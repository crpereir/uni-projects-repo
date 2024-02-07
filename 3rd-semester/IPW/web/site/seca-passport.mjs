
export default async function() {
  return {
    serializeDeserializeUser,
    verifyAuthenticated,
    logout
  }

  function serializeDeserializeUser (user, done) {
    done(null, user) 
  }
  
  function verifyAuthenticated(req, rsp, next) {
    console.log("verifyAuthenticated", req.user)
    if(req.user) {
      return next()
    }
    rsp.redirect('/site/login')
  }
  
  function logout(req, rsp) {
    req.logout((err) => { 
      rsp.redirect('/site')
    })
    
  }
}