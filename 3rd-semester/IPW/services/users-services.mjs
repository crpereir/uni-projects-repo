
export default async function(usersData, errors) {
    const ud = usersData
    const errs = errors
    return {
        addUser,
        getUserId,
        validateUser
    }

    async function addUser(username, password) {
        if(typeof(username) != 'string') throw errs.badRequest("Invalid username")
        const res = await ud.insertUser(username, password)
        if (!res) throw errs.badRequest("Username already taken")
        return res
    }
    
    async function getUserId(userToken) {
        const res = await ud.getUserByToken(userToken)
        if (!res) throw errs.notAuthorized("User not found")
        return res.id
    }

    async function validateUser(username, password) { 
        const user = await ud.getUserByUsername(username)
        if(user && user.password == password) return user
    }
}   