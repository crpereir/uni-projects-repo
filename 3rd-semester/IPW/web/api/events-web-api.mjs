
export default async function(apiFunctions, eventServices) {
    const apiFunc = apiFunctions
    const es = eventServices
    return {
        getEventsByName: apiFunc.processRequest(_getEventsByName),
        getPopularEvents: apiFunc.processRequest(_getPopularEvents),
        getEventDetails: apiFunc.processRequest(_getEventDetails)
    }

    async function _getEventsByName(req) {
        const name = req.query.name
        const s = req.query.s || "30"
        const p = req.query.p || "1"
        const result = await es.getEventsByName(name, s, p)
        return apiFunc.returnType(result)
    }
    
    async function _getPopularEvents(req) {
        const s = req.query.s || "30"
        const p = req.query.p || "1"
        const result = await es.getPopularEvents(s, p)
        return apiFunc.returnType(result)
    }

    async function _getEventDetails(req) {
        const id = req.params.eventId
        const result = await es.getEventDetails(id)
        return apiFunc.returnType(result)
    }
}