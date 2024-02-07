
export default async function(apiFunctions, userServices) {
    const apiFunc = apiFunctions
    const us = userServices
    return {
        addUser: apiFunc.processRequest(_addUser)
    }

    async function _addUser(req) {
        const result = await us.addUser(req.body.username, req.body.password)
        return apiFunc.returnType(result, 201)
    }
}