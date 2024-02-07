const express = require("express");
const cookieParser = require("cookie-parser");
const axios = require("axios");
const FormData = require("form-data");
const jwt = require("jsonwebtoken");
const crypto = require("crypto");
const casbin = require("casbin");

// Casbin configuration.
let e;
casbin
  .newEnforcer("./app_model.conf", "./app_policy.csv")
  .then((enforcer) => (e = enforcer));

const port = 3001;

// System variables where Client's credentials are stored.
const CLIENT_ID_GOOGLE = process.env.CLIENT_ID_GOOGLE;
const CLIENT_SECRET_GOOGLE = process.env.CLIENT_SECRET_GOOGLE;

const CLIENT_ID_GITHUB = process.env.CLIENT_ID_GITHUB;
const CLIENT_SECRET_GITHUB = process.env.CLIENT_SECRET_GITHUB;

// Callbacks URL configured during Client registration in OIDC providers.
const CALLBACK = "callback";
const GOOGLE_REDIRECT_URI = "http://localhost:3001/callback/google";
const GITHUB_REDIRECT_URI = "http://localhost:3001/callback/github";

const app = express();
app.use(cookieParser());
app.use(express.urlencoded({ extended: false }));

// Container to store each user's data in memory.
let container = [];

function getPermsFromRole(perm) {
  if(perm === 'free')
    return 'You are allowed to view your Google tasks.'
  else
    return 'You are allowed to view your Google tasks and create new ones from your GitHub repository milestones.'
}

function getCookieValue(req, key) {
  const value = req.cookies[key];
  return value;
}

// Error handling.
function rbacNotAllowed(resp) {
  resp
    .status(401)
    .send(
      '<div><h1>Only premium and admin accounts can add tasks.</h1><a href="/lists">Back to lists.</a></div>'
    );
}

function ownerOrRepoNotFound(resp) {
  resp
    .status(404)
    .send(
      '<div><h1>Owner or Repo not found.</h1><a href="/lists">Back to lists.</a></div>'
    );
}

// Get request for home resource.
app.get("/", (req, resp) => {
  console.log("Home page.");
  resp.send("<a href=/login/google>Use Google Account</a>");
});

// Get request for login w/ google resource.
app.get("/login/google", (req, resp) => {
  console.log("Start login w/ google...");

  // Generate a random state ...
  const state = crypto.randomUUID();
  // ... and set cookie.
  resp.cookie("state", state, { httpOnly: true, secure: true });

  resp.redirect(
    302,
    // authorization endpoint
    "https://accounts.google.com/o/oauth2/v2/auth?" +
      // client id
      "client_id=" +
      CLIENT_ID_GOOGLE +
      "&" +
      // OpenID scope "openid email tasks"
      "scope=openid%20email%20https://www.googleapis.com/auth/tasks&" +
      // parameter state is used to check if the user-agent requesting login is the same making the request to the callback URL
      "state=" +
      state +
      "&" +
      // responde_type for "authorization code grant"
      "response_type=code&" +
      // redirect uri used to register RP
      "redirect_uri=" +
      GOOGLE_REDIRECT_URI
  );
});

// Get request for callback of login w/ google resource.
app.get("/" + CALLBACK + "/google", (req, resp) => {
  console.log("Callback w/ google...");

  // Check if the state of the cookie and the query is the same, i.e., check if it is valid.
  const state = getCookieValue(req, "state");
  if (req.query.state !== state) {
    resp.status(401).send("<div>State mismatch</div>");
    return;
  }

  console.log("making request to token endpoint");
  // content-type: application/x-www-form-urlencoded (URL-Encoded Forms)
  const form = new FormData();
  form.append("code", req.query.code);
  form.append("client_id", CLIENT_ID_GOOGLE);
  form.append("client_secret", CLIENT_SECRET_GOOGLE);
  form.append("redirect_uri", GOOGLE_REDIRECT_URI);
  form.append("grant_type", "authorization_code");

  axios
    .post(
      // token endpoint
      "https://www.googleapis.com/oauth2/v3/token",
      // body parameters in form url encoded
      form,
      { headers: form.getHeaders() }
    )
    .then(function (response) {
      const accessTokenGoogle = response.data.access_token;
      const jwt_payload = jwt.decode(response.data.id_token);

      // Generate a random session token ...
      const sessionToken = crypto.randomUUID();
      // ... and associate session token with user information ...
      container.push({
        sessionToken: sessionToken,
        accessTokenGoogle: accessTokenGoogle,
        googleEmail: jwt_payload.email,
      });
      // ... and set a cookie to maintain the user session.
      resp.cookie("session", sessionToken, {
        httpOnly: true,
        secure: true,
      });
      // ... and redirect to user home page.
      resp.redirect(302, "http://localhost:3001/me");
    })
    .catch(function (error) {
      console.log(error);
      resp.send(
        '<div><h1>Unexpected error</h1><a href="/">Back home.</a></div>'
      );
    });
});

// Get request for user home resource.
app.get("/me", (req, resp) => {
  console.log("Finished authentication w/ google");

  // Check if the user is authenticated.
  const sessionToken = getCookieValue(req, "session");
  const userTokens = container.find((o) => o.sessionToken === sessionToken);
  if (userTokens === undefined) {
    resp.redirect(302, "/login/google");
  }

  e.getRolesForUser(userTokens.googleEmail)
    .then(res => {
      const role = res[0]
      resp.send(`<h4>Your account is ${role}</h4><h4>${getPermsFromRole(role)}</h4><a href="/lists">My Lists</a>`);
    })

  
});

// Get request for login w/ github resource.
app.get("/login/github", (req, resp) => {
  console.log("Start login w/ github...");

  // Check if the user is authenticated.
  const sessionToken = getCookieValue(req, "session");
  const userTokens = container.find((o) => o.sessionToken === sessionToken);
  if (userTokens === undefined) {
    resp.redirect(302, "/login/google");
  }

  // Check permissions.
  e.enforce(userTokens.googleEmail, "tasks", "write").then((canAdd) => {
    if (canAdd) {
      // Generate a random state ...
      const state = crypto.randomUUID();
      // ... and set cookie.
      resp.cookie("state", state, { httpOnly: true, secure: true });

      // Save the list identifier where the user wants to change it for later use.
      container = container.map((o) =>
        o.sessionToken === sessionToken
          ? { ...o, triedToAlterListId: req.query.listId }
          : o
      );

      resp.redirect(
        302,
        // authorization endpoint
        "https://github.com/login/oauth/authorize?" +
          // client id
          "client_id=" +
          CLIENT_ID_GITHUB +
          "&" +
          // Scope "repo"
          "scope=repo&" +
          // parameter state is used to check if the user-agent requesting login is the same making the request to the callback URL
          "state=" +
          state +
          "&" +
          // redirect uri used to register RP
          "redirect_uri=" +
          GITHUB_REDIRECT_URI
      );
    } else {
      rbacNotAllowed(resp);
    }
  });
});

// Get request for callback of login w/ github resource.
app.get("/" + CALLBACK + "/github", (req, resp) => {
  console.log("Callback w/ github...");

  // Check if the user is authenticated.
  const session = getCookieValue(req, "session");
  const userTokens = container.find((o) => o.sessionToken === session);
  if (userTokens === undefined) {
    resp.redirect(302, "/login/google");
  }

  // Check permissions.
  e.enforce(userTokens.googleEmail, "tasks", "write").then((canAdd) => {
    if (canAdd) {
      // Check if the state of the cookie and the query is the same, i.e., check if it is valid.
      const state = getCookieValue(req, "state");
      if (req.query.state !== state) {
        resp.status(401).send("<div>State mismatch</div>");
      }

      console.log("making request to token endpoint");
      // content-type: application/x-www-form-urlencoded (URL-Encoded Forms)
      const form = new FormData();
      form.append("code", req.query.code);
      form.append("client_id", CLIENT_ID_GITHUB);
      form.append("client_secret", CLIENT_SECRET_GITHUB);
      form.append("redirect_uri", GITHUB_REDIRECT_URI);

      axios
        .post(
          // token endpoint
          "https://github.com/login/oauth/access_token",
          // body parameters in form url encoded
          form,
          {
            headers: {
              Accept: `application/json`,
              "Content-Type": "application/x-www-form-urlencoded",
            },
          }
        )
        .then(function (response) {
          const accessTokenGithub = response.data.access_token;

          // Add user information to existing information ...
          container = container.map((o) =>
            o.sessionToken === session
              ? { ...o, accessTokenGithub: accessTokenGithub }
              : o
          );

          // ... and retrieve previously saved list identifier ...
          const userTokensInner = container.find(
            (o) => o.sessionToken === session
          );
          const listId = userTokensInner.triedToAlterListId;

          // ... to redirect to creation ...
          resp.redirect(302, `http://localhost:3001/lists/${listId}/create`);
        })
        .catch(function (error) {
          console.log(error);
          resp.send(
            '<div><h1>Unexpected error</h1><a href="/">Back home.</a></div>'
          );
        });
    } else {
      rbacNotAllowed(resp);
    }
  });
});

// Get request for user lists resource.
app.get("/lists", (req, resp) => {
  console.log("Accessing google tasks.");

  // Check if the user is authenticated.
  const sessionToken = getCookieValue(req, "session");
  const userTokens = container.find((o) => o.sessionToken === sessionToken);
  if (userTokens === undefined) {
    resp.redirect(302, "/login/google");
  }

  axios
    .get("https://tasks.googleapis.com/tasks/v1/users/@me/lists", {
      headers: { Authorization: `Bearer ${userTokens.accessTokenGoogle}` },
    })
    .then(function (response) {
      const info = response.data.items
        .map((i) => {
          return (
            "<div><a href= http://localhost:3001/lists/" +
            i.id +
            "> " +
            i.title +
            "</a></div><br>"
          );
        })
        .join("");

      resp.send(info);
    })
    .catch(function (error) {
      console.log(error);
      resp.send(
        '<div><h1>Unexpected error</h1><a href="/">Back home.</a></div>'
      );
    });
});

// Get request for one of user list resource.
app.get("/lists/:id", (req, resp) => {
  
  // Check if the user is authenticated.
  const sessionToken = getCookieValue(req, "session");
  const userTokens = container.find((o) => o.sessionToken == sessionToken);
  if (userTokens === undefined) {
    resp.redirect(302, "/login/google");
  }

  axios
    .get(`https://tasks.googleapis.com/tasks/v1/lists/${req.params.id}/tasks`, {
      headers: { Authorization: `Bearer ${userTokens.accessTokenGoogle}` },
    })
    .then(function (response) {
      const info = response.data.items
        .map((i) => {
          return (
            "<div> Title = " +
            i.title +
            " | Notes = " +
            i.notes +
            " | Status = " +
            i.status +
            "</div><br>"
          );
        })
        .join("");

      // Check permissions.
      e.enforce(userTokens.googleEmail, "tasks", "write").then((canAdd) => {
        if (canAdd) {
          resp.send(
            info +
              `<a href='http://localhost:3001/lists/${req.params.id}/create'>Create task from public repo milestone.</a><br>` +
              `<a href='http://localhost:3001/login/github?listId=${req.params.id}'>Create task from private repo milestone.</a><br>`
          );
        } else {
          resp.send(info);
        }
      });
    })
    .catch(function (error) {
      console.log(error);
      resp.send(
        '<div><h1>Unexpected error</h1><a href="/">Back home.</a></div>'
      );
    });
});

// Get request for form to create a task resource.
app.get("/lists/:id/create", (req, resp) => {
  console.log("Before accessing repos of user");

  // Check if the user is authenticated.
  const sessionToken = getCookieValue(req, "session");
  const userTokens = container.find((o) => o.sessionToken == sessionToken);
  if (userTokens === undefined) {
    resp.redirect(302, "/login/google");
  }

  // Check permissions.
  e.enforce(userTokens.googleEmail, "tasks", "write").then((canAdd) => {
    if (canAdd) {
      resp.send(
        `<form action="/milestones" method="get"> ` +
          `<label for="owner"> Owner <input type="text" id="owner" name="owner">` +
          `<label for="repo"> Repo <input type="text" id="repo" name="repo">` +
          `<input type="hidden" name="listId" value=${req.params.id}>` +
          `<input type="submit" value="Get milestones">` +
          `</form>`
      );
    } else {
      rbacNotAllowed(resp);
    }
  });
});

// Get request for milestones resource.
app.get("/milestones", (req, resp) => {
  console.log("Finished querying milestones");

  // Check if the user is authenticated.
  const sessionToken = getCookieValue(req, "session");
  const userTokens = container.find((o) => o.sessionToken == sessionToken);
  if (userTokens === undefined) {
    resp.redirect(302, "/login/google");
  }

  // Check permissions.
  e.enforce(userTokens.googleEmail, "tasks", "write").then((canAdd) => {
    if (canAdd) {
      const requestHeaders = userTokens.accessTokenGithub
        ? {
            Authorization: `Bearer ${userTokens.accessTokenGithub}`,
            Accept: "application/vnd.github+json",
          }
        : { Accept: "application/vnd.github+json" };
      axios
        .get(
          `https://api.github.com/repos/${req.query.owner}/${req.query.repo}/milestones`,
          {
            headers: requestHeaders,
          }
        )
        .then(function (response) {
          const info = response.data
            .map((i) => {
              return (
                "<div>" +
                i.title +
                ` | ` +
                i.description +
                ` | Due on: ` +
                i.due_on +
                `<form action="/createTask" method="post"> <input type="hidden" name="title" value="${i.title}"> ` +
                `<input type="hidden" name="description" value="${i.description}"> ` +
                `<input type="hidden" name="due_on" value="${i.due_on}"></input>` +
                `<input type="hidden" name="listId" value="${req.query.listId}">` +
                `<input type=submit value="Add task to list"></form></div><br>`
              );
            })
            .join("");

          resp.send(info);
        })
        .catch(function (error) {
          ownerOrRepoNotFound(resp);
        });
    } else {
      rbacNotAllowed(resp);
    }
  });
});

// Post request to create a task resource.
app.post("/createTask", (req, resp) => {
  console.log("Creating task...");

  // Check if the user is authenticated.
  const sessionToken = getCookieValue(req, "session");
  const userTokens = container.find((o) => o.sessionToken === sessionToken);
  if (userTokens === undefined) {
    resp.redirect(302, "/login/google");
  }

  const taskTitle = req.body.title;
  const taskDescription = req.body.description;
  const taskDueDate = req.body.due_on;
  const taskList = req.body.listId;
  console.log(
    `${taskTitle} | ${taskDescription} | ${taskDueDate} | ${taskList}`
  );

  const body = { title: taskTitle, notes: taskDescription, due: taskDueDate };

  // Check permissions.
  e.enforce(userTokens.googleEmail, "tasks", "write").then((canAdd) => {
    if (canAdd) {
      axios
        .post(
          `https://tasks.googleapis.com/tasks/v1/lists/${taskList}/tasks`,
          body,
          {
            headers: {
              Authorization: `Bearer ${userTokens.accessTokenGoogle}`,
              "Content-Type": "application/json",
            },
          }
        )
        .then((res) => {
          if (res.status == 200) {
            console.log("Finished with success!");
            resp.redirect(302, `http://localhost:3001/lists/${taskList}`);
          } else {
            console.log(res);
            resp.redirect(302, `http://localhost:3001/lists/`);
          }
        })
        .catch((error) => {
          console.log(error);
          resp.redirect(302, "http://localhost:3001");
        });
    } else {
      rbacNotAllowed(resp);
    }
  });
});

// App configuration.
app.listen(port, (err) => {
  if (err) {
    return console.log("something bad happened", err);
  }
  console.log(`server is listening on ${port}`);
});
