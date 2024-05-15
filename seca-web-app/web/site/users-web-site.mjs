
export default async function(siteFunctions, userServices) {
    const us = userServices
    const siteFunc = siteFunctions
    return {
        getRegisterForm: siteFunc.processRequest(_getRegisterForm),
        registerUser: siteFunc.processRequest(_registerUser),
        getLoginForm: siteFunc.processRequest(_getLoginForm),
        loginUser: siteFunc.processRequest(_loginUser)
    }

    async function getAuthForm(req, type) {
        if(req.user) return siteFunc.returnType(true, '/auth/site')
        return siteFunc.returnType(false, type)
    }

    async function _getRegisterForm(req) {
        return getAuthForm(req, 'register')
    }
    
    async function _registerUser(req) {
        const addedUser = await us.addUser(req.body.username, req.body.password)
        const user = {
            username: addedUser.username,
            token: addedUser.token
        }
        return siteFunc.returnType(true, '/auth/site', user, true)
    }

    async function _getLoginForm(req) {
        return getAuthForm(req, 'login')
    }

    async function _loginUser(req) {
        const userValidation = await us.validateUser(req.body.username, req.body.password)
        if(userValidation) {
            const user = {
                username: userValidation.username,
                token: userValidation.token
            }
            return siteFunc.returnType(true, '/auth/site', user, true)
        }
        else return siteFunc.returnType(true, '/site/login')
    }
}