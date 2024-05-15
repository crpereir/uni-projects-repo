//curl -X PUT http://localhost:9200/groups

// Create a group
//curl -X POST --data '{ "name" : "GroupN" , "description" : "Group N elastic", "userId": "iduser", "events": [] }' -H "Content-Type: application/json" http://localhost:9200/groups/_doc

import {get, post, del, put} from './fetch-wrapper.mjs'
import uriManager from './uri-manager.mjs'


export default async function (indexName = 'groups') {

    const URI_MANAGER = await uriManager(indexName)

    return {
        getGroups,
        getGroup,
        insertGroup,
        updateGroup,
        deleteGroup,
        addEvent,
        getGroupEvent,
        deleteEvent
    }

    async function getGroups(userId) {
        const query = {
            query: {
              match: {
                "userId.keyword": userId
              }
            }
          }
        return post(URI_MANAGER.getAll(), query)
            .then(body => body.hits.hits.map(createGroupFromElastic))
    }

    async function getGroup(userId, gId) {
        const groupElastic = await get(URI_MANAGER.get(gId))
        const groupObj = createGroupFromElastic(groupElastic)
        if (groupObj.userId == userId) return groupObj
    }

    async function insertGroup(newGroup) {
        const newGroupElastic = await post(URI_MANAGER.create(), newGroup)
        newGroup.id = newGroupElastic._id
        return newGroup
    }

    async function updateGroup(groupToUpdate) {
        return put(URI_MANAGER.update(groupToUpdate.id), groupToUpdate)
    }

    async function deleteGroup(deletedGroup) {
        const deletedGroupElastic = await del(URI_MANAGER.delete(deletedGroup.id))
        return deletedGroup
    }
    
    async function addEvent(newEvent, group) {
        const uptGroup = await getGroup(group.userId, group.id)
        const groupEventIdx = uptGroup.events.findIndex(e => e.eventId == newEvent.eventId)
        if(groupEventIdx != -1) uptGroup.events[groupEventIdx] = newEvent
        else uptGroup.events.push(newEvent)
        await updateGroup(uptGroup)
        return newEvent
    }
    
    async function getGroupEvent(group, eId) {
        const groupObj = await getGroup(group.userId, group.id)
        return groupObj.events.find(e => e.eventId == eId)
    }
    
    async function deleteEvent(group, event) {
        const groupObj = await getGroup(group.userId, group.id)
        const deletedGroupEventIdx = groupObj.events.findIndex(e => e.eventId == event.eventId)
        groupObj.events.splice(deletedGroupEventIdx, 1)
        await updateGroup(groupObj)
        return event
    }   

    //Auxiliary functions
    function createGroupFromElastic(groupElastic) {
        let group = Object.assign({id: groupElastic._id}, groupElastic._source)
        return group
    }
}