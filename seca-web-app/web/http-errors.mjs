
export default async function(errors) {
    const errCode = errors.errorCodes
    return {
        convert
    }

    function HttpResponse (status, body){
        this.status = status
        this.body = body
    }

    async function convert(e){
        switch (e.code) {
            case errCode.BAD_REQUEST: return new HttpResponse(400, e.description)
            case errCode.NOT_AUTHORIZED: return new HttpResponse(401, e.description)
            case errCode.NOT_FOUND: return new HttpResponse(404, e.description)
            default: return new HttpResponse(500, "Internal server error")
        }
    }
}