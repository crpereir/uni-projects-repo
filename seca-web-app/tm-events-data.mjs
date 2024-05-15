
export default async function() {
    return {
        getEventsByName,
        getPopularEvents,
        getEvent
    }

    async function getEventsByName(name, size, page) {
        const p = page - 1
        const URL = "https://app.ticketmaster.com/discovery/v2/events.json?size=" + size + "&page=" + p + "&keyword=" + name + "&apikey=ACCjageYGB5M2AplJb2MtXJGk67tHb1N"
        return await fetchURL(URL)
    }
    
    async function getPopularEvents(size, page) {
        const p = page - 1
        const URL = "https://app.ticketmaster.com/discovery/v2/events.json?size=" + size + "&page=" + p + "&sort&apikey=E4okdj01C8N6PsWYGRRmNtvWBJC6kvAD"
        return await fetchURL(URL)
    }
    
    async function getEvent(eventId) {
        const URL = "https://app.ticketmaster.com/discovery/v2/events/" + eventId + ".json?apikey=2pmX9ddTrafd3MxbTP0m6ACS7WqzRVlK"
        return await fetchURL(URL)
    }

    //Auxiliary functions
    async function fetchURL(url) {
        const newFetch = await fetch(url)
        return newFetch.json()
    }
}