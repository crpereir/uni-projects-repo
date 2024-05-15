import express from 'express'
import cors from 'cors'
import swaggerUi from 'swagger-ui-express'
import yaml from 'yamljs'
import path from 'path'
import hbs from 'hbs'
import url from 'url'
import passport from 'passport'
import expressSession from 'express-session'

import errors from './common/errors.mjs'
import tmData from './tm-events-data.mjs'
//import usersData from './data/mem/users-data-mem.mjs'
//import groupsData from './data/mem/groups-data-mem.mjs'
import usersData from './data/elastic/users-data-elastic.mjs'
import groupsData from './data/elastic/groups-data-elastic.mjs'
import userServices from './services/users-services.mjs'
import groupServices from './services/groups-services.mjs'
import eventServices from './services/events-services.mjs'
import errorsToHttp from './web/http-errors.mjs'
import commonApiFunctions from './web/api/common-api-functions.mjs'
import commonSiteFunctions from './web/site/common-site-functions.mjs'
import usersAPI from './web/api/users-web-api.mjs'
import groupsAPI from './web/api/groups-web-api.mjs'
import eventsAPI from './web/api/events-web-api.mjs'
import usersSite from './web/site/users-web-site.mjs'
import groupsSite from './web/site/groups-web-site.mjs'
import eventsSite from './web/site/events-web-site.mjs'
import webSite from './web/site/web-site.mjs'
import sitePassport from './web/site/seca-passport.mjs'

const PORT = 1909

console.log("Setting up server")
let app = express()

app.use(cors())
app.use(express.json())
app.use(express.urlencoded())
const swaggerDocument = yaml.load('./docs/seca_api._spec.yaml')
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument))


// Register current directory
const currentFileDir = url.fileURLToPath(new URL('.', import.meta.url))

// Register public directory
const publicFilesDir = path.join(currentFileDir, 'web', 'site', 'public')
console.log(publicFilesDir)
app.use('/public', express.static(publicFilesDir))

// Register views directory
const viewsDir = path.join(currentFileDir, 'web', 'site', 'views')
app.set('view engine', 'hbs')
app.set('views', viewsDir)

// Register partials directory
hbs.registerPartials(path.join(viewsDir, 'partials'))
console.log(path.join(viewsDir, 'partials'))



// Passport initialization
app.use(expressSession(
    {
      secret: "IPW31D-G10",
      resave: false,
      saveUninitialized: false
      //store: new FileStore()
    }
    ))

app.use(passport.session())
app.use(passport.initialize())

//Common consts
const usersMem = await usersData()
const groupsMem = await groupsData()
const codeErrors = await errors()
const tmAccess = await tmData()
const userService = await userServices(usersMem, codeErrors)
const groupService = await groupServices(groupsMem, userService, tmAccess, codeErrors)
const eventService = await eventServices(tmAccess, codeErrors)
const httpErrors = await errorsToHttp(codeErrors)

//--------------------------------------------- Site ---------------------------------------------------------

//Site consts
const siteFunctions = await commonSiteFunctions(httpErrors)
const userSite = await usersSite(siteFunctions, userService)
const groupSite = await groupsSite(siteFunctions, groupService, eventService)
const eventSite = await eventsSite(siteFunctions, eventService)
const site = await webSite(siteFunctions)
const sitePass = await sitePassport()

passport.serializeUser(sitePass.serializeDeserializeUser)
passport.deserializeUser(sitePass.serializeDeserializeUser)


//Site routes
app.get('/site', site.getHomePage)
app.get('/site/register', userSite.getRegisterForm)
app.post('/site/register', userSite.registerUser)
app.get('/site/login', userSite.getLoginForm)
app.post('/site/login', userSite.loginUser)


app.get('/site/events/search', eventSite.getPopularEvents)
app.get('/site/events/search/name', eventSite.getEventsByName)
app.get('/site/events/:eventId', eventSite.getEventDetails)

app.use('/auth', sitePass.verifyAuthenticated)
app.get('/auth/site', site.getHomePageAuth)
app.post('/auth/site/logout', sitePass.logout)

app.use('/auth/site/groups', siteFunctions.tokenExists)
app.get('/auth/site/groups', groupSite.getAllGroups)
app.post('/auth/site/groups', groupSite.addGroup)

app.get('/auth/site/groups/:groupId', groupSite.getGroupDetails)
app.get('/auth/site/groups/:groupId/edit', groupSite.editGroupForm)
app.put('/auth/site/groups/:groupId', groupSite.editGroup)
app.delete('/auth/site/groups/:groupId', groupSite.deleteGroup)

app.get('/auth/site/groups/:groupId/events', groupSite.addEventToGroupForm)
app.get('/auth/site/groups/:groupId/events/add', groupSite.addEventToGroupSelect)
app.put('/auth/site/groups/:groupId/events/add/:eventId', groupSite.addEventToGroup)
app.delete('/auth/site/groups/:groupId/events/:eventId/delete', groupSite.deleteGroupEvent)

//--------------------------------------------- API ----------------------------------------------------------

//API consts
const apiFunctions = await commonApiFunctions(httpErrors)
const userAPI = await usersAPI(apiFunctions, userService)
const groupAPI = await groupsAPI(apiFunctions, groupService)
const eventAPI = await eventsAPI(apiFunctions, eventService)

//API routes
app.get('/events/search/name', eventAPI.getEventsByName)
app.get('/events/search/popular', eventAPI.getPopularEvents)
app.get('/events/:eventId', eventAPI.getEventDetails)

app.use('/groups', apiFunctions.tokenExists)
app.get('/groups', groupAPI.getAllGroups)
app.post('/groups', groupAPI.addGroup)

app.get('/groups/:groupId', groupAPI.getGroupDetails)
app.put('/groups/:groupId', groupAPI.editGroup)
app.delete('/groups/:groupId', groupAPI.deleteGroup)

app.put('/groups/:groupId/events/:eventId', groupAPI.addEventToGroup) 
app.delete('/groups/:groupId/events/:eventId', groupAPI.deleteGroupEvent)

app.post('/users', userAPI.addUser)

app.listen(PORT, () => console.log(`Server listening in http://localhost:${PORT}`))

console.log("End setting up server")