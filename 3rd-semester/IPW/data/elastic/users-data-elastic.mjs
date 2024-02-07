// Module manages application users data.
// In this specific module, data is stored ElasticSearch
import crypto from 'node:crypto'
import {get, post, del, put} from './fetch-wrapper.mjs'
import uriManager from './uri-manager.mjs'


export default async function (indexName = 'users') {

    const URI_MANAGER = await uriManager(indexName)

    return {
        getUserByToken,
        getUserByUsername,
        insertUser
    }

    async function getUserByToken(token) {
        return getUserBy("token",  token)
    }

    async function getUserByUsername(username) {
        return getUserBy("name", username)
    }

    async function getUserBy(propName, value) {
        const uri = `${URI_MANAGER.getAll()}?q=${propName}:${value}`
        return get(uri)
            .then(body => body.hits.hits.map(createUserFromElastic))
            .then(users => users[0])
    }

    async function insertUser(username, password){
        const getUser = await getUserByUsername(username)
        if(!getUser) {
            const user = buildUser(username, password)
            await post(`${URI_MANAGER.create()}`, user)
            return user
        }
    }

    //Auxiliary functions
    function createUserFromElastic(userElastic) {
        let user = Object.assign({id: userElastic._id}, userElastic._source)
        return user
    }

    function buildUser(username, password){
        return {
            name: username,
            password: password,
            token: crypto.randomUUID()
        }
    }

}