package pt.isel.gomoku.http.dto

import com.google.gson.annotations.SerializedName
import pt.isel.gomoku.domain.infra.Action
import pt.isel.gomoku.domain.infra.Entity
import pt.isel.gomoku.domain.infra.Field
import pt.isel.gomoku.domain.infra.Link
import pt.isel.gomoku.domain.infra.Siren

/**
 * The DTO used to represent siren obtained from the remote service.
 */
data class SirenModelDto<D>(
    @SerializedName("class")
    val clazz: List<String>,
    val properties: D?,
    val links: List<LinkModelDto>,
    val entities: List<EntityModelDto<*>>,
    val actions: List<ActionModelDto>
) {

    /**
     * Convert [SirenModelDto] to [Siren].
     */
    inline fun <reified T> toSiren(): Siren<T> {
        val newProperties = when (properties) {
            is RankingDto -> properties.toRanking()
            is VariantsDto -> properties.toVariants()
            is MonitorDto -> properties.toMonitor()
            is GameDto -> properties.toGame()
            is UserDto -> properties.toUser()
            is TokenDto -> properties.toToken()
            is HomeDto -> properties.toHome()
            else -> properties
        }
        require(newProperties is T)

        return Siren(
            clazz,
            newProperties,
            links.map { link -> Link(link.rel, link.href, link.authenticationType) },
            entities.map { entity ->
                Entity(
                    entity.properties,
                    entity.links.map { link ->
                        Link(
                            link.rel,
                            link.href,
                            link.authenticationType
                        )
                    },
                    entity.rel
                )
            },
            actions.map { action ->
                Action(
                    action.name,
                    action.title,
                    action.href,
                    action.method,
                    action.authenticationType,
                    action.type,
                    action.fields.map { field -> Field(field.name, field.type, field.value) })
            }
        )
    }
}

/**
 * The DTO used to represent siren link obtained from the remote service.
 */
data class LinkModelDto(
    val rel: List<String>,
    val href: String,
    val authenticationType: List<String>
)

/**
 * The DTO used to represent siren entity obtained from the remote service.
 */
data class EntityModelDto<T>(
    val properties: T,
    val links: List<LinkModelDto>,
    val rel: List<String>
)

/**
 * The DTO used to represent siren action obtained from the remote service.
 */
data class ActionModelDto(
    val name: String,
    val title: String?,
    val href: String,
    val method: String,
    val authenticationType: List<String>,
    val type: String?,
    val fields: List<FieldModelDto>
)

/**
 * The DTO used to represent siren field obtained from the remote service.
 */
data class FieldModelDto(
    val name: String,
    val type: String,
    val value: String? = null
)