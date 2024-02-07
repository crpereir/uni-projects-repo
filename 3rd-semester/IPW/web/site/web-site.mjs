export default async function(siteFunctions) {
    const siteFunc = siteFunctions
    return {
        getHomePage: siteFunc.processRequest(_getHomePage),
        getHomePageAuth: siteFunc.processRequest(_getHomePageAuth),
    }

    async function _getHomePage(){
        return siteFunc.returnType(false, 'home')
    }

    async function _getHomePageAuth(){
        return siteFunc.returnType(false, 'home-auth')
    }
}