package pt.isel.gomoku.http.dto

/**
 * Creates a new [SirenModelDto].
 */
fun <T> sirenDto(
    props: T? = null,
    clazz: List<String> = emptyList(),
    links: List<LinkModelDto> = emptyList(),
    entities: List<EntityModelDto<*>> = emptyList(),
    actions: List<ActionModelDto> = emptyList()
): SirenModelDto<T> = SirenModelDto(clazz, props, links, entities, actions)

/**
 * Creates a new [SirenModelDto] with no [LinkModelDto]s, [EntityModelDto]s and [ActionModelDto]s.
 */
fun <T> emptySirenDto(props: T? = null) =
    sirenDto(props)