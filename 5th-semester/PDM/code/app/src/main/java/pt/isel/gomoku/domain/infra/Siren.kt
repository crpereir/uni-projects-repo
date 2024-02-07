package pt.isel.gomoku.domain.infra

/**
 * Hypermedia Siren Android client.
 * @see <a href="https://github.com/kevinswiber/siren">Hypermedia Siren</a>
 */
data class Siren<T>(
    val clazz: List<String>,
    val properties: T?,
    val links: List<Link>,
    val entities: List<Entity<*>>,
    val actions: List<Action>
) {

    /**
     * Get the link for the indicated link relation.
     * @param rel the link relation.
     */
    fun getLink(rel: String): Link? =
        links.firstOrNull { link -> link.rel.contains(rel) }

    /**
     * Get the action for the indicated action name.
     * @param name the name of action.
     */
    fun getAction(name: String): Action? =
        actions.firstOrNull { action -> action.name == name }
}

/**
 * Siren Link.
 * @see <a href="https://github.com/kevinswiber/siren">Hypermedia Siren</a>
 */
data class Link(
    val rel: List<String>,
    val href: String,
    val authenticationType: List<String>
)

/**
 * Siren Entity.
 * @see <a href="https://github.com/kevinswiber/siren">Hypermedia Siren</a>
 */
data class Entity<T>(
    val properties: T,
    val links: List<Link>,
    val rel: List<String>
)

/**
 * Siren Action.
 * @see <a href="https://github.com/kevinswiber/siren">Hypermedia Siren</a>
 */
data class Action(
    val name: String,
    val title: String?,
    val href: String,
    val method: String,
    val authenticationType: List<String>,
    val type: String?,
    val fields: List<Field>
)

/**
 * Siren Field.
 * @see <a href="https://github.com/kevinswiber/siren">Hypermedia Siren</a>
 */
data class Field(
    val name: String,
    val type: String,
    val value: String? = null
)