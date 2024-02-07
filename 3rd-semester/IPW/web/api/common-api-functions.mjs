
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
                rsp.status(result.status).json(result.body)
            } catch (e) {
                const errRsp = await errHttp.convert(e)
                rsp.status(errRsp.status).json(errRsp.body)
            }
        }
    }
    
    async function returnType(body, status = 200){
        return {
            status: status,
            body: body
        }
    }
    
    async function tokenExists(req, rsp, next) {
        let token = await getToken(req)
        if (!token){
            return  rsp.status(401).json("Invalid User Token") 
        }
        req.token = token
        next()
    }
    
    function getToken(req) {
        const token = req.get("Authorization")
        if(token) {
            return token.split(" ")[1]
        }
    }
}