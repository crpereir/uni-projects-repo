
export default async function() {
    
    const NUM_GROUPS = 2

    const GROUPS = new Array(NUM_GROUPS).fill(0).map((e, idx) => {
    return {
        id: (idx + 1),
        name: `Group ${idx + 1}`,
        description: `Group ${idx + 1} description`,
        userId: (idx + 1),
        events: []
    }
})

let nextGroupId = GROUPS.length + 1 

    return {
        getGroup,
        getGroupEvent,
        getGroups,
        insertGroup,
        updateGroup,
        deleteGroup,
        addEvent,
        deleteEvent
    }

    async function getGroup(userId, gId) {
        return GROUPS.find(e => e.id == gId && e.userId == userId)
    }
    
    async function getGroups(userId) {
        return GROUPS.filter(e => e.userId == userId)
    }
    
    async function insertGroup(group) {
        const newGroup = {
            id: nextGroupId++,
            name: group.name,
            description: group.description,
            userId: group.userId,
            events: []
        }
        GROUPS.push(newGroup)
        return newGroup
    }
    
    async function updateGroup(updatedGroup) {
        const groupIdx = GROUPS.findIndex(e => e.id == updatedGroup.id)
        GROUPS.splice(groupIdx, 1, updatedGroup)
        return updatedGroup
    }
    
    async function deleteGroup(group) {
        const groupIdx = GROUPS.findIndex(e => e.id == group.id)
        GROUPS.splice(groupIdx, 1)
        return group
    }
    
    async function addEvent(newEvent, group) {
        const groupIdx = GROUPS.findIndex(e => e.id == group.id)
        const groupEventIdx = group.events.findIndex(e => e.eventId == newEvent.eventId)
        if (groupEventIdx != -1) {
            GROUPS[groupIdx].events[groupEventIdx] = newEvent
            return {
                event: newEvent,
                created: false
            } 
        }
        else {
            GROUPS[groupIdx].events.push(newEvent)
            return {
                event: newEvent,
                created: true
            } 
        }
    }
    
    async function getGroupEvent(group, eId) {
        return group.events.find(e => e.eventId == eId)
    }
    
    async function deleteEvent(group, event) {
        const groupIdx = GROUPS.findIndex(e => e.id == group.id)
        const deletedGroupEventIdx = group.events.findIndex(e => e.id == event.id)
        GROUPS[groupIdx].events.splice(deletedGroupEventIdx,1)
        return event
    }   
}