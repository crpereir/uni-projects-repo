
export default async function(groupsData, userServices, tmData, errors) {
    const gd = groupsData
    const us = userServices
    const tm = tmData
    const errs = errors
    return {
        getAllGroups,
        getGroupDetails,
        addGroup,
        editGroup,
        deleteGroup,
        addEventToGroup,
        deleteGroupEvent
    }

    async function getAllGroups(userToken) {
        const userId = await us.getUserId(userToken)
        return gd.getGroups(userId)
    }
    
    async function getGroupDetails(userToken, gId) {
        const group = await checkIfValidRequest(userToken, gId)
        return {
            name: group.name,
            description: group.description,
            events: group.events
        }
    }
    
    async function addGroup(userToken, body) {
        const userId = await us.getUserId(userToken)
        checkBodyProperties(body)
        const newGroup = {
            name: body.name,
            description: body.description,
            events: [],
            userId: userId
        } 
        return gd.insertGroup(newGroup)
    }
    
    async function editGroup(userToken, gId, body) {
        const group = await checkIfValidRequest(userToken, gId)
        checkBodyProperties(body)
        group.name = body.name
        group.description = body.description
        return gd.updateGroup(group)
    }
    
    async function deleteGroup(userToken, gId) {
        const deletedGroup = await checkIfValidRequest(userToken, gId)
        return gd.deleteGroup(deletedGroup)
    }
    
    async function addEventToGroup(userToken, gId, eId) {
        const group = await checkIfValidRequest(userToken, gId)
        const newEvent = await tm.getEvent(eId)
        if(newEvent.hasOwnProperty('errors')) throw errs.notFound(`Event with id ${eId} was not found`)
        const eventDetails = {
            eventId: newEvent.id,
            eventName: newEvent.name,
            eventDate: newEvent.dates?.start.dateTime || "No dates",
            eventSegment: newEvent.classifications?.[0].segment.name || "No segment",
            eventGenre: newEvent.classifications?.[0].genre.name || "No genre"
        }
        return gd.addEvent(eventDetails, group)
    }
    
    async function deleteGroupEvent(userToken, gId, eId) {
        const group = await checkIfValidRequest(userToken, gId)
        const deletedGroupEvent = await gd.getGroupEvent(group, eId)
        if (!deletedGroupEvent) throw errs.notFound(`Event with id ${eId} was not found in group with id ${gId}`)
        return await gd.deleteEvent(group, deletedGroupEvent)
    }
    
    // Auxiliary functions
    async function checkIfValidRequest(userToken, gId) {
        const userId = await us.getUserId(userToken)
        const group = await gd.getGroup(userId, gId)
        if (!group) throw errs.notFound(`Group with id ${gId} was not found`)
        return group
    }
    
    function checkBodyProperties(body) {
        if(!body.hasOwnProperty('name')) throw errs.badRequest('Missing parameter: name')
        if(!body.hasOwnProperty('description')) throw errs.badRequest('Missing parameter: description')
        if(body.name.constructor != String) throw errs.badRequest('Invalid parameter: name')
        if(body.description.constructor != String) throw errs.badRequest('Invalid parameter: description')
    }
}