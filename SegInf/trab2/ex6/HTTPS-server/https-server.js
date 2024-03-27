// Built-in HTTPS support.
const https = require("https");
// Handling GET request.
const express = require("express");
// Load of files from the local file system.
var fs = require('fs'); 

const PORT = 4433;
const app = express();

// Get request for resource /.
app.get("/", function (req, res) {
    const subject = req.socket.getPeerCertificate().subject
    let auth = "without client authentication"
    if (subject) auth = `with client authentication: ${subject.CN}`
    
    console.log(
        req.socket.remoteAddress
        + ' ' + auth
        + ' ' + req.method
        + ' ' + req.url);
    res.send("<html><body>Secure Hello World with node.js</body></html>");
});

// Configure TLS handshake.
const options = {
    key: fs.readFileSync('../certificates-keys/pems/secure-server-key.pem'),
    cert: fs.readFileSync('../certificates-keys/pems/secure-server.pem'),
    ca: fs.readFileSync('../certificates-keys/pems/CA2.pem'), 
    requestCert: true, 
    rejectUnauthorized: false
};

// Create HTTPS server.
https.createServer(options, app).listen(PORT, 
    function (req, res) {
        console.log("Server started at port " + PORT);
    }
);
