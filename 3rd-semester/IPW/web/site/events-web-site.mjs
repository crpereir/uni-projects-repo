
export default async function(siteFunctions, eventServices) {
    const siteFunc = siteFunctions
    const es = eventServices
    return {
        getEventsByName: siteFunc.processRequest(_getEventsByName),
        getPopularEvents: siteFunc.processRequest(_getPopularEvents),
        getEventDetails: siteFunc.processRequest(_getEventDetails)
    }

    async function _getPopularEvents(req) {
        const s = req.query.s || "30"
        const p = req.query.p || "1"
        const result = await es.getPopularEvents(s, p)
        let noResults = false
        if(result.length == 0) noResults = true
        const newResult = result.map(e => e = { id: e.id, name: e.name})
        return siteFunc.returnType(false, 'search-events', {header: "Most Popular Events", searchedEvents: newResult, searchedName: "Popular", noResults})
    }

    async function _getEventsByName(req) {
        const name = req.query.name
        const s = req.query.s || "30"
        const p = req.query.p || "1"
        const result = await es.getEventsByName(name, s, p)
        let noResults = false
        if(result.length == 0) noResults = true
        const newResult = result.map(e => e = { id: e.id, name: e.name})
        return siteFunc.returnType(false, 'search-events', {header: `Results for ${name}`, searchedEvents: newResult, searchedName: name, noResults})
    }

    async function _getEventDetails(req) {
        const id = req.params.eventId
        const result = await es.getEventDetails(id)
        return siteFunc.returnType(false, 'event-details', result)
    }
}
