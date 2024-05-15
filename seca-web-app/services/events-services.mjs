
export default async function(tmData, errors) {
    const tm = tmData
    const errs = errors
    return {
        getEventsByName,
        getPopularEvents,
        getEventDetails
    }

    async function getEventsByName(name, size, page){
        if(!name) throw errs.badRequest("There must be a name to search for")
        const pagination = await checkPagination(size, page)
        const namedEvents = await tm.getEventsByName(name, pagination.size, pagination.page)
        if(!namedEvents['_embedded']) return []
        return namedEvents['_embedded'].events
    }
    
    async function getPopularEvents(size, page){
        const pagination = await checkPagination(size, page)
        const popularEvents = await tm.getPopularEvents(pagination.size, pagination.page)
        return popularEvents['_embedded'].events
    }

    async function getEventDetails(id) {
        const event = await tm.getEvent(id)
        const details = {
            name: event.name,
            image: event.images?.[0].url || "No image",
            sale_start: event.sales?.public.startDateTime || "No start sales",
            end_time: event.sales?.public.endDateTime || "No end sales",
            dates: event.dates?.start.dateTime || "No dates",
            segment: event.classifications?.[0].segment.name || "No segment",
            genre: event.classifications?.[0].genre.name || "No genre",
            sub_genre: event.classifications?.[0].subGenre.name || "No subgenre"
        }
        return details
    }

    //Auxiliary functions
    async function checkPagination(size, page){
        const s = Number(size)
        const p = Number(page)
        if (isNaN(s) || isNaN(p)) throw errs.badRequest("Query parameters must be numbers")
        if (p <= 0 || s <= 0) throw errs.badRequest("Query parameters must be bigger than 0")
        return {
            size: s,
            page: p
        }
    }
}