export async function get(uri) {
    return fetchInternal(uri)
}

export async function post(uri, body) {
    return fetchInternal(uri, { method: "POST"}, body)
}

export async function put(uri, body) {
    return fetchInternal(uri, { method: "PUT" }, body)
}

export async function del(uri) {
    return fetchInternal(uri, { method: "DELETE" })
}

async function fetchInternal(uri, options = { } , body = undefined) {
    if(body) {
        options.headers = {
            'Content-Type': 'application/json'
        }
        options.body = JSON.stringify(body)
    }

    console.log(`Fetching from ${uri} with these options`, options)

    const rsp = await fetch(uri, options)
    const obj = await rsp.json()
    console.log(obj)
    return obj
}