package pt.isel.gomoku.http

import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import kotlinx.coroutines.CancellableContinuation
import okhttp3.Call
import okhttp3.Callback
import okhttp3.MediaType.Companion.toMediaTypeOrNull
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody
import okhttp3.RequestBody.Companion.toRequestBody
import okhttp3.Response
import org.json.JSONObject
import pt.isel.gomoku.domain.infra.Siren
import pt.isel.gomoku.http.dto.ProblemDto
import pt.isel.gomoku.http.dto.SirenModelDto
import java.io.IOException
import kotlin.coroutines.resumeWithException

const val MEDIA_TYPE_APPLICATION_JSON = "application/json"
const val MEDIA_TYPE_SIREN = "application/vnd.siren+json"
const val MEDIA_TYPE_PROBLEM_JSON = "application/problem+json"

enum class Method { GET, PUT, POST, DELETE }

/**
 * Converts a string to a [Method].
 * @throws IllegalArgumentException if the string does not represent a valid method.
 */
fun String.toMethod(): Method =
    when (this) {
        "GET" -> Method.GET
        "PUT" -> Method.PUT
        "POST" -> Method.POST
        "DELETE" -> Method.DELETE
        else -> throw IllegalArgumentException("Method not supported")
    }

/**
 * Converts a [Method] to a string.
 */
fun request(
    client: OkHttpClient,
    uri: String,
    method: Method = Method.GET,
    token: String = "",
    bodyInfo: Map<String, Any> = emptyMap()
): Call {

    /**
     * Builds the request.
     */
    val requestBuilder = Request.Builder()
        .url(uri)
        .addHeader(
            name = "accept",
            value = "application/json, application/vnd.siren+json, application/problem+json"
        )
        .addHeader(
            name = "Authorization",
            value = "Bearer $token"
        )

    /**
     * Adds the body to the request.
     */
    val jsonBody = JSONObject(bodyInfo).toString()
    val requestBody: RequestBody =
        jsonBody.toRequestBody(MEDIA_TYPE_APPLICATION_JSON.toMediaTypeOrNull())

    val request = when (method) {
        Method.GET -> requestBuilder.get()
        Method.DELETE -> requestBuilder.delete()
        Method.POST -> requestBuilder.post(requestBody)
        Method.PUT -> requestBuilder.put(requestBody)
    }

    /**
     * Builds the call.
     */
    return client.newCall(request.build())
}

/**
 * Sends a request to the server.
 * @param gson the [Gson] instance.
 * @param call the call to be sent.
 * @param continuation the continuation to be resumed when the call is completed.
 */
fun send(
    gson: Gson,
    call: Call,
    continuation: CancellableContinuation<Unit>
) {
    call.enqueue(object : Callback {
        override fun onFailure(call: Call, e: IOException) {
            continuation.resumeWithException(ConnectionToServerException)
        }

        /**
         * Handles the response.
         */
        override fun onResponse(call: Call, response: Response) {
            val contentType = response.headers["Content-Type"]
            val body = response.body

            when {
                !response.isSuccessful && response.code == 401 -> {
                    continuation.resumeWithException(
                        NotLoggedInException
                    )
                }

                !response.isSuccessful && contentType == MEDIA_TYPE_PROBLEM_JSON && body != null -> {
                    val type = object : TypeToken<ProblemDto>() {}.type
                    val problemDto = gson.fromJson<ProblemDto>(body.string(), type)

                    continuation.resumeWithException(
                        APIException(
                            type = problemDto.type,
                            title = problemDto?.title ?: UnexpectedErrorException.title,
                            message = problemDto?.detail ?: "",
                        )
                    )
                }

                response.isSuccessful -> {
                    continuation.resumeWith(Result.success(Unit))
                }

                else -> continuation.resumeWithException(UnexpectedErrorException)
            }
        }
    })

    continuation.invokeOnCancellation { call.cancel() }
}

/**
 * Fetches a resource from the server.
 * @param gson the [Gson] instance.
 * @param call the call to be sent.
 * @param continuation the continuation to be resumed when the call is completed.
 */
inline fun <reified T, reified D : Any?> fetch(
    gson: Gson,
    call: Call,
    continuation: CancellableContinuation<Siren<T>>
) {
    call.enqueue(object : Callback {
        override fun onFailure(call: Call, e: IOException) {
            continuation.resumeWithException(ConnectionToServerException)
        }

        /**
         * Handles the response.
         */
        override fun onResponse(call: Call, response: Response) {
            val contentType = response.headers["Content-Type"]
            val body = response.body


            // Handles the response.
            when {
                // If the response is not successful and the code is 401, the user is not logged in.
                !response.isSuccessful && response.code == 401 -> {
                    continuation.resumeWithException(
                        NotLoggedInException
                    )
                }

                // If the response is not successful and the content type is problem+json, the response is a problem.
                !response.isSuccessful && contentType == MEDIA_TYPE_PROBLEM_JSON && body != null -> {
                    val type = object : TypeToken<ProblemDto>() {}.type
                    val problemDto = gson.fromJson<ProblemDto>(body.string(), type)

                    // Resumes the continuation with an API exception.
                    continuation.resumeWithException(
                        APIException(
                            type = problemDto.type,
                            title = problemDto?.title ?: UnexpectedErrorException.title,
                            message = problemDto?.detail ?: "",
                        )
                    )
                }

                // If the response is successful and the content type is vnd.siren+json, the response is a siren.
                response.isSuccessful && contentType == MEDIA_TYPE_SIREN && body != null -> {
                    val type = object : TypeToken<SirenModelDto<D>>() {}.type
                    val sirenModelDto = gson.fromJson<SirenModelDto<D>>(body.string(), type)

                    val siren: Siren<T> = sirenModelDto.toSiren()
                    continuation.resumeWith(Result.success(siren))
                }

                // If the response is not successful.
                else -> continuation.resumeWithException(UnexpectedErrorException)

            }
        }
    })

    // Cancels the call when the continuation is cancelled.
    continuation.invokeOnCancellation { call.cancel() }
}
