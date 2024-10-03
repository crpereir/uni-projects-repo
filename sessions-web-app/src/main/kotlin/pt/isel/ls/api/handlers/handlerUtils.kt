package pt.isel.ls.api.handlers

import org.http4k.core.Request

fun getBearerToken(request: Request): String? {
    val authHeader = request.header("Authorization") ?: return null
    if (!authHeader.startsWith("Bearer ")) {
        return null
    }
    return authHeader.substring("Bearer ".length)
}
