import crypto from 'node:crypto'

export default async function() {
    const USERS = [
        {
            id: 1,
            name: "McDonalds",
            token: "23553253fds"
        },
        {
            id: 2,
            name: "KFC",
            token: "b351d48c-1fc0-4cbf-a184-52c9138b0304"
        }
    ]
    
    let nextId = USERS.length + 1
    
    return {
        users: USERS,
        insertUser,
        getUserByToken
    }

    async function insertUser(username, password) {
        if(!USERS.find(u => u.name == username)) {
            const user = {
                id: nextId++,
                name: username,
                password: password,
                token: crypto.randomUUID()
            }
            USERS.push(user)
            return user
        } 
    }
    
    async function getUserByToken(userToken) {
        const user = USERS.find(u => {
            return u.token == userToken
        })
        if(user) {
            return user
        }
    }
}