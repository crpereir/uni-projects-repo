
export default async function(siteFunctions, groupServices, eventServices) {
    const siteFunc = siteFunctions
    const gs = groupServices
    const es = eventServices
    return {
        getAllGroups: siteFunc.processRequest(_getAllGroups),
        addGroup: siteFunc.processRequest(_addGroup),
        editGroupForm: siteFunc.processRequest(_editGroupForm),
        editGroup: siteFunc.processRequest(_editGroup),
        deleteGroup: siteFunc.processRequest(_deleteGroup),
        getGroupDetails: siteFunc.processRequest(_getGroupDetails),
        addEventToGroupForm: siteFunc.processRequest(_addEventToGroupForm),
        addEventToGroupSelect: siteFunc.processRequest(_addEventToGroupSelect),
        addEventToGroup: siteFunc.processRequest(_addEventToGroup),
        deleteGroupEvent: siteFunc.processRequest(_deleteGroupEvent),
    }

    async function _getAllGroups(req) {
        const result = await gs.getAllGroups(req.token)
        return siteFunc.returnType(false, 'all-groups', {allGroups: result})
    }
    
    async function _getGroupDetails(req) {
        const groupId = req.params.groupId
        const result = await gs.getGroupDetails(req.token, groupId)
        result.id = groupId
        result.noEvents = result.events.length == 0
        result.token= req.token
        return siteFunc.returnType(false, 'group-details', result)
    }
    
    async function _addGroup(req) {
        await gs.addGroup(req.token, req.body)
        return siteFunc.returnType(true, '/auth/site/groups')
    }
    
    async function _editGroupForm(req) {
        const groupId = req.params.groupId
        const group = await gs.getGroupDetails(req.token, groupId)
        return siteFunc.returnType(false, 'group-edit', {id: groupId, name: group.name, description: group.description, token: req.token})
    }

    async function _editGroup(req) {
        const groupId = req.params.groupId
        await gs.editGroup(req.token, groupId, req.body)
        return siteFunc.returnType(true, `/auth/site/groups/${groupId}`)
    }

    async function _deleteGroup(req) {
        const groupId = req.params.groupId
        await gs.deleteGroup(req.token, groupId)
        return siteFunc.returnType(true, '/auth/site/groups')
    }
    
    async function _addEventToGroupForm(req) {
        const groupId = req.params.groupId
        return siteFunc.returnType(false, 'search-event-to-add', {url: `/auth/site/groups/${groupId}/events/add`, gId: groupId})
    }

    async function _addEventToGroupSelect(req) {
        const groupId = req.params.groupId
        const name = req.query.name
        const s = req.query.s || "30"
        const p = req.query.p || "1"
        const result = await es.getEventsByName(name, s, p)
        let noResults = false
        if(result.length == 0) noResults = true
        const newResult = result.map(e => e = { id: e.id, name: e.name})
        return siteFunc.returnType(false, 'search-event-to-add-result', {gId: groupId, searchedEvents: newResult, searchedName: name, noResults, token: req.token})
    }

    async function _addEventToGroup(req) {
        const groupId = req.params.groupId
        const eventId = req.params.eventId
        const result = await gs.addEventToGroup(req.token, groupId, eventId)
        return siteFunc.returnType(true, '/auth/site/groups/' + groupId)
    }
    
    async function _deleteGroupEvent(req) {
        const groupId = req.params.groupId
        const eventId = req.params.eventId
        const result = await gs.deleteGroupEvent(req.token, groupId, eventId) //Ver se é preciso constante
        return siteFunc.returnType(true, '/auth/site/groups/' + groupId)
    }
    
}