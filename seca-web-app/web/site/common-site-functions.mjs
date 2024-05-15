
export default async function(errorsToHttp) {
    const errHttp = errorsToHttp
    return {
        processRequest,
        returnType,
        tokenExists,
    }

    function processRequest(internalFunction){
        return async function(req, rsp){
            try {
                const result = await internalFunction(req)
                if(result.isRedirect == true) {
                    if(result.isAuth) req.login(result.objForRender, () => rsp.redirect(result.nameOrPath))
                    else rsp.redirect(result.nameOrPath)
                }
                else {
                    rsp.render(result.nameOrPath, result.objForRender)
                }
            } catch (e) {
                console.log(e)
                const errRsp = await errHttp.convert(e)
                const statusDes = await getErrorDescription(errRsp.status)
                errRsp.status = statusDes
                rsp.render('error', errRsp)
            }
        }
    }
    
    async function returnType(isRedirect, nameOrPath, objForRender, isAuth){
        return {
            isRedirect, nameOrPath, objForRender, isAuth
        }
    }
    
    async function tokenExists(req, rsp, next) {
        let token = await getToken(req)
        req.token = token
        next()
    }
    
    async function getToken(req) {
        return req.user.token
    }

    async function getErrorDescription(status){
        switch (status) {
            case 404: return new String("404 Not Found")
            case 401: return new String("401 Not Authorized")
            case 400: return new String("400 Bad Request")
            default: return new String("500 Internal server error")
        }
    }  
}