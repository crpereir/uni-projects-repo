
export default async function(apiFunctions, groupServices) {
    const apiFunc = apiFunctions
    const gs = groupServices
    return {
        getAllGroups: apiFunc.processRequest(_getAllGroups),
        addGroup: apiFunc.processRequest(_addGroup),
        editGroup: apiFunc.processRequest(_editGroup),
        deleteGroup: apiFunc.processRequest(_deleteGroup),
        getGroupDetails: apiFunc.processRequest(_getGroupDetails),
        addEventToGroup: apiFunc.processRequest(_addEventToGroup),
        deleteGroupEvent: apiFunc.processRequest(_deleteGroupEvent)
    }

    async function _getAllGroups(req) {
        const result = await gs.getAllGroups(req.token)
        return apiFunc.returnType(result)
    }
    
    async function _getGroupDetails(req) {
        const groupId = req.params.groupId
        const result = await gs.getGroupDetails(req.token, groupId)
        return apiFunc.returnType(result)
    }
    
    async function _addGroup(req) {
        const result = await gs.addGroup(req.token, req.body)
        return apiFunc.returnType(result, 201)
    }
    
    async function _editGroup(req) {
        const groupId = req.params.groupId
        const result = await gs.editGroup(req.token, groupId, req.body)
        return apiFunc.returnType(result)
    }
    
    async function _deleteGroup(req) {
        const groupId = req.params.groupId
        const result = await gs.deleteGroup(req.token, groupId)
        return apiFunc.returnType(result)
    }
    
    async function _addEventToGroup(req) {
        const groupId = req.params.groupId
        const eventId = req.params.eventId
        const result = await gs.addEventToGroup(req.token, groupId, eventId)
        if(result.created) return apiFunc.returnType(result.event, 201)
        else return apiFunc.returnType(result.event)
    }
    
    async function _deleteGroupEvent(req) {
        const groupId = req.params.groupId
        const eventId = req.params.eventId
        const result = await gs.deleteGroupEvent(req.token, groupId, eventId)
        return apiFunc.returnType(result)
    }
}