function deleteGroup(tokenClient, groupId) {
    const button = document.querySelector("#delete_group")
    button.addEventListener("click", handleClick)

    async function handleClick() {
       
        const uriDelete = `/groups/${groupId}`
        const options = { 
            method: 'DELETE',
            headers: {
                'Authorization': `Bearer ${tokenClient}`
            }
        }
        const rsp = await fetch(uriDelete,  options)
        if(rsp.ok) {
            window.location = '/auth/site/groups'
        }
    }
}

function editGroup(tokenClient, groupId) {
    const button = document.querySelector("#edit_group")
    const name = document.querySelector("#edit_name")
    const description = document.querySelector("#edit_description")
    
    let nameValue = name.value
    let descriptionValue = description.value

    name.onblur = async function updateName() {nameValue = name.value}
    description.onblur = async function updateDescription() {descriptionValue = description.value}

    button.addEventListener("click", handleClick)

    async function handleClick() {

        const uriEdit = `/groups/${groupId}`
        const options = { 
            method: 'PUT',
            headers: {
                'Authorization': `Bearer ${tokenClient}`,
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                name: nameValue,
                description: descriptionValue 
            })
        }
        const rsp = await fetch(uriEdit,  options)
        if(rsp.ok) {
             window.location = '/auth/site/groups/' + groupId
        }
    }
}

function addEventToGroup(id, tokenClient, groupId, eventId) {
    const button = document.querySelector(`#${id}`)
    button.onclick = handleClick

    async function handleClick() {
        
        const uriAddEvent = `/groups/${groupId}/events/${eventId}`
        const options = { 
            method: 'PUT',
            headers: {
                'Authorization': `Bearer ${tokenClient}`,
            }
        }
        const rsp = await fetch(uriAddEvent,  options)
        if(rsp.status = 201 || rsp.ok) {
            window.location = '/auth/site/groups/' + groupId
        }
    }
}

function deleteEventFromGroup(id, tokenClient, groupId, eventId) {
    const button = document.querySelector(`#${id}`)
    button.onclick = handleClick

    async function handleClick() {
        
        const uriDeleteEvent = `/groups/${groupId}/events/${eventId}`
        const options = { 
            method: 'DELETE',
            headers: {
                'Authorization': `Bearer ${tokenClient}`,
            }
        }
        const rsp = await fetch(uriDeleteEvent,  options)
        if(rsp.ok) {
            window.location = '/auth/site/groups/' + groupId
        }
    }
}