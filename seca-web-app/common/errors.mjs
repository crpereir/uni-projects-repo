
export default async function () {
    const ERROR_CODES = {
        BAD_REQUEST: "e1",
        NOT_AUTHORIZED: "e2",
        NOT_FOUND: "e3"
    }
    
    return {
        errorCodes: ERROR_CODES,
        badRequest,
        notAuthorized,
        notFound
    }

    function Error(code, description) {
        this.code = code
        this.description = description
    }
    
    function badRequest(message) {
        return new Error(ERROR_CODES.BAD_REQUEST, message)
    }
    
    function notAuthorized(message) {          
        return new Error(ERROR_CODES.NOT_AUTHORIZED, message)
    }
    
    function notFound(message) {               
        return new Error(ERROR_CODES.NOT_FOUND, message)
    }
}