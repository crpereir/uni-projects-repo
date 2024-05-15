import { expect } from 'chai';
import assert from 'assert';
import { readFile } from 'node:fs/promises'
import errors from '../common/errors.mjs'
import tmData from '../tm-events-data.mjs'
import usersData from '../data/mem/users-data-mem.mjs'
import groupsData from '../data/mem/groups-data-mem.mjs'
import userServices from '../services/users-services.mjs'
import groupServices from '../services/groups-services.mjs'
import eventServices from '../services/events-services.mjs'

//Initializations
const codeErrors = await errors()
const tmAccess = await tmData()
const usersMem = await usersData()
const groupsMem = await groupsData(usersMem)
const userService = await userServices(usersMem, codeErrors)
const groupService = await groupServices(groupsMem, userService, tmAccess, codeErrors)
const eventService = await eventServices(tmAccess, codeErrors)

//Paths to local files
const SEARCH_EVENTS_BY_NAME_FILE = './test/data-test/events-searched-by-name.json'
const POPULAR_EVENTS_FILE = './test/data-test/popular-events.json'
const ADD_EVENT_TO_GROUP_FILE = './test/data-test/event-added-to-group.json'
const GROUP_DETAILS_FILE = './test/data-test/group-details.json'
const NEW_GROUP_FILE = './test/data-test/new-group.json'
const EDITED_GROUP_FILE = './test/data-test/edited-group.json'

//SECA-SERVICES Tests
describe('Service Test Modules', function () {
    
    //Auxiliary functions
    async function readF(file) {
      const fileContent = await readFile(file)
      return JSON.parse(fileContent)
    }

    //Constants
    const userToken = 'b351d48c-1fc0-4cbf-a184-52c9138b0304'

    const Group = {
      id: 2,
      name: 'Group 2',
      description: 'Group 2 description',
      userId: 2,
      events: []
    }

    const UserId = 2

    const editBody = { name: 'Edited Group', description: 'Edited Group description' }

    describe('getEventsByName', function() {
      it('Should return the first event with the searched name', async function() {
        //This test will not pass if file "events-searched-by-name.json" is not updated
        const mostPopularEvent = await readF(SEARCH_EVENTS_BY_NAME_FILE)
        const apiMostPopularEvent = await eventService.getEventsByName('P!NK', 1, 1)
        assert.deepEqual(apiMostPopularEvent, mostPopularEvent)
      })
      it('Should throw an error if there is no name', async function() {
        try {
          await eventService.getEventsByName('', 1, 1)
        }
        catch(e) {
          assert.deepEqual(e, codeErrors.badRequest("There must be a name to search for"))
          return
        }
        assert.fail("Should throw an error of type BAD REQUEST")
      })
      it('Should throw an error if the size or page are invalid', async function() {
        try {
          await eventService.getEventsByName('P!NK', "batata", 2)
        }
        catch(e) {
          assert.deepEqual(e, codeErrors.badRequest("Query parameters must be numbers"))
          return
        }
        assert.fail("Should throw an error of type BAD REQUEST")
      })
      it('Should throw an error if the size or page are 0', async function() {
        try {
          await eventService.getEventsByName('P!NK', 1, 0)
        }
        catch(e) {
          assert.deepEqual(e, codeErrors.badRequest("Query parameters must be bigger than 0"))
          return
        }
        assert.fail("Should throw an error of type BAD REQUEST")
      })
    })

    describe('getPopularEvents', function () {
      //This test will not pass if file "popular-events.json" is not updated
      it('Should return the 3 most popular events', async function () {
        const popularEvents = await readF(POPULAR_EVENTS_FILE)
        const apiPopularEvents = await eventService.getPopularEvents(3, 1)
        assert.deepEqual(apiPopularEvents, popularEvents)
      })
      it('Should throw an error if the size or page are invalid', async function() {
        try {
          await eventService.getPopularEvents(1, "cebolas")
        }
        catch(e) {
          assert.deepEqual(e, codeErrors.badRequest("Query parameters must be numbers"))
          return
        }
        assert.fail("Should throw an error of type BAD REQUEST")
      })
      it('Should throw an error if the size or page are 0', async function() {
        try {
          await eventService.getPopularEvents(0, 1)
        }
        catch(e) {
          assert.deepEqual(e, codeErrors.badRequest("Query parameters must be bigger than 0"))
          return
        }
        assert.fail("Should throw an error of type BAD REQUEST")
      })
    })

    describe('getAllGroups', function () {
      it('Should return all groups', async function () {
        const groups = await groupService.getAllGroups(userToken)
        assert.deepEqual(groups, new Array(1).fill(Group))
      })
    })

    describe('editGroup', function () {
      it('Should edit an existing group', async function () {
        const editedGroup = await readF(EDITED_GROUP_FILE)
        const apiEditedGroup = await groupService.editGroup(userToken, 2, editBody)
        assert.deepEqual(apiEditedGroup, editedGroup)
      })
      it('Should throw an error if the group with groupId does not exist', async function () {
        try {
          await groupService.editGroup(userToken, 20, editBody)
        }
        catch(e) {
          assert.deepEqual(e, codeErrors.notFound("Group with id 20 was not found"))
          return
        }
        assert.fail("Should throw an error of type NOT FOUND")
      })
      it('Should throw an error if the name of the request body is invalid', async function () {
        try {
          await groupService.editGroup(userToken, 2, { name: {}, description: "Group Description" })
        }
        catch(e) {
          assert.deepEqual(e, codeErrors.badRequest("Invalid parameter: name"))
          return
        }
        assert.fail("Should throw an error of type BAD REQUEST")
      })
      it('Should throw an error if the description of the request body is invalid', async function () {
        try {
          await groupService.editGroup(userToken, 2, { name: "Group Name", description: 30 })
        }
        catch(e) {
          assert.deepEqual(e, codeErrors.badRequest("Invalid parameter: description"))
          return
        }
        assert.fail("Should throw an error of type BAD REQUEST")
      })
      it('Should throw an error if the property name of the request body does not exist', async function () {
        try {
          await groupService.editGroup(userToken, 2, { total: {}, description: "Group Description" })
        }
        catch(e) {
          assert.deepEqual(e, codeErrors.badRequest("Missing parameter: name"))
          return
        }
        assert.fail("Should throw an error of type BAD REQUEST")
      })
      it('Should throw an error if the property description of the request body does not exist', async function () {
        try {
          await groupService.editGroup(userToken, 2, { name: "Group Name", total: "Group Description" })
        }
        catch(e) {
          assert.deepEqual(e, codeErrors.badRequest("Missing parameter: description"))
          return
        }
        assert.fail("Should throw an error of type BAD REQUEST")
      })
    })

    describe('addEventToGroup', function () {
      it('Should add a new event to an existing group', async function () {
        const addedEventFile = await readF(ADD_EVENT_TO_GROUP_FILE)
        const addedEventObj = {created: true, event: addedEventFile}
        const apiAddedEvent = await groupService.addEventToGroup(userToken, 2, 'G5v0Z9Yc3zOy3')
        assert.deepEqual(apiAddedEvent, addedEventObj)
      })
      it('Should replace an existing event to an existing group', async function () {
        const addedEventFile = await readF(ADD_EVENT_TO_GROUP_FILE)
        const addedEventObj = {created: false, event: addedEventFile}
        const apiAddedEvent = await groupService.addEventToGroup(userToken, 2, 'G5v0Z9Yc3zOy3')
        assert.deepEqual(apiAddedEvent, addedEventObj)
      })
      it('Should throw an error if the group with groupId does not exist', async function () {
        try {
          await groupService.addEventToGroup(userToken, 20, 'G5v0Z9Yc3zOy3')
        }
        catch(e) {
          assert.deepEqual(e, codeErrors.notFound("Group with id 20 was not found"))
          return
        }
        assert.fail("Should throw an error of type NOT FOUND")
      })
      it('Should throw an error if the eventId is invalid', async function () {
        try {
          await groupService.addEventToGroup(userToken, 2, 'G5v0Z9Yc3zOz4')
        }
        catch(e) {
          assert.deepEqual(e, codeErrors.notFound("Event with id G5v0Z9Yc3zOz4 was not found"))
          return
        }
        assert.fail("Should throw an error of type NOT FOUND")
      })
    })

    describe('getGroupDetails', function () {
      it('Should return the details of a group', async function () {
        const groupDetails = await readF(GROUP_DETAILS_FILE)
        const apiGroupDetails = await groupService.getGroupDetails(userToken, 2)
        assert.deepEqual(groupDetails, apiGroupDetails)
      })
      it('Should throw an error if the group with groupId does not exist', async function () {
        try {
          await groupService.getGroupDetails(userToken, 20)
        }
        catch(e) {
          assert.deepEqual(e, codeErrors.notFound("Group with id 20 was not found"))
          return
        }
        assert.fail("Should throw an error of type NOT FOUND")
      })
    })
  
    describe('addGroup', function () {
      it('Should add a new group', async function () {
        const newGroup = await readF(NEW_GROUP_FILE)
        const apiNewGroup = await groupService.addGroup(userToken, { name: 'New Group', description: 'New Group description' })
        assert.deepEqual(apiNewGroup, newGroup)
      })
      it('Should throw an error if the name of the request body is invalid', async function () {
        try {
          await groupService.addGroup(userToken, { name: {}, description: "Group Description" })
        }
        catch(e) {
          assert.deepEqual(e, codeErrors.badRequest("Invalid parameter: name"))
          return
        }
        assert.fail("Should throw an error of type BAD REQUEST")
      })
      it('Should throw an error if the description of the request body is invalid', async function () {
        try {
          await groupService.addGroup(userToken, { name: "Group Name", description: 30 })
        }
        catch(e) {
          assert.deepEqual(e, codeErrors.badRequest("Invalid parameter: description"))
          return
        }
        assert.fail("Should throw an error of type BAD REQUEST")
      })
      it('Should throw an error if the property name of the request body does not exist', async function () {
        try {
          await groupService.addGroup(userToken, { total: {}, description: "Group Description" })
        }
        catch(e) {
          assert.deepEqual(e, codeErrors.badRequest("Missing parameter: name"))
          return
        }
        assert.fail("Should throw an error of type BAD REQUEST")
      })
      it('Should throw an error if the property description of the request body does not exist', async function () {
        try {
          await groupService.addGroup(userToken, { name: "Group Name", total: "Group Description" })
        }
        catch(e) {
          assert.deepEqual(e, codeErrors.badRequest("Missing parameter: description"))
          return
        }
        assert.fail("Should throw an error of type BAD REQUEST")
      })
    })

    describe('deleteGroupEvent', function () {
      it('Should delete an existing event from an existing group', async function () {
        const deletedEvent = await readF(ADD_EVENT_TO_GROUP_FILE)
        const apiDeletedEvent = await groupService.deleteGroupEvent(userToken, 2, 'G5v0Z9Yc3zOy3')
        assert.deepEqual(apiDeletedEvent, deletedEvent)
      })
      it('Should throw an error if the group with groupId does not exist', async function () {
        try {
          await groupService.deleteGroupEvent(userToken, 20, 'G5v0Z9Yc3zOy3')
        }
        catch(e) {
          assert.deepEqual(e, codeErrors.notFound("Group with id 20 was not found"))
          return
        }
        assert.fail("Should throw an error of type NOT FOUND")
      })
      it('Should throw an error if the eventId is invalid', async function () {
        try {
          await groupService.deleteGroupEvent(userToken, 2, 'G5v0Z9Yc3zOz4')
        }
        catch(e) {
          assert.deepEqual(e, codeErrors.notFound("Event with id G5v0Z9Yc3zOz4 was not found in group with id 2"))
          return
        }
        assert.fail("Should throw an error of type NOT FOUND")
      })
    })

    describe('deleteGroup', function () {
      it('Should delete an existing group', async function () {
        const deletedGroup = await readF(EDITED_GROUP_FILE)
        const apiDeletedGroup = await groupService.deleteGroup(userToken, 2)
        assert.deepEqual(apiDeletedGroup, deletedGroup)
      })
      it('Should throw an error if the group with groupId does not exist', async function () {
        try {
          await groupService.deleteGroup(userToken, 20)
        }
        catch(e) {
          assert.deepEqual(e, codeErrors.notFound("Group with id 20 was not found"))
          return
        }
        assert.fail("Should throw an error of type NOT FOUND")
      })
    })

    describe('addUser', function () {
      it('Should create an user', async function () {
        const createdUser = await userService.addUser("McQueen")
        assert.equal(createdUser.id, 3)
        assert.equal(createdUser.name, "McQueen")
      })
      it('Should throw an error if the username given is not of type string', async function () {
        try {
          await userService.addUser(23)
        }
        catch(e) {
          assert.deepEqual(e, codeErrors.badRequest("Invalid username"))
          return
        }
        assert.fail("Should throw an error of type BAD REQUEST")
      })
      it('Should throw an error if the username given is already taken', async function () {
        try {
          await userService.addUser("McQueen")
        }
        catch(e) {
          assert.deepEqual(e, codeErrors.badRequest("Username already taken"))
          return
        }
        assert.fail("Should throw an error of type BAD REQUEST")
      })
    })

    describe('getUserId', function () {
      it('Should get the Id of a certain user', async function () {
        const userId = await userService.getUserId(userToken)
        assert.equal(userId, UserId)
      })
      it('Should throw an error if the user does not exist', async function () {
        try {
          await userService.getUserId("b351d48c-1fc0-4cbf-a184-52c9138b1248")
        }
        catch(e) {
          assert.deepEqual(e, codeErrors.notAuthorized("User not found"))
          return
        }
        assert.fail('Should throw an error of type NOT AUTHORIZED')
      })
    })
  })