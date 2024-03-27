package pt.isel.gomoku.presentation.utils

import pt.isel.gomoku.domain.infra.Action
import pt.isel.gomoku.domain.infra.Field
import pt.isel.gomoku.domain.infra.Link

val MockAction = Action(
    name = "mock",
    title = "Mock",
    href = "/mock",
    method = "POST",
    authenticationType = listOf("MOCK"),
    type = "mock",
    fields = listOf(
        Field("mock1", "mock"),
        Field("mock2", "mock"),
        Field("mock3", "mock")
    )
)

val MockLink = Link(
    rel = emptyList(),
    href = "/mock",
    authenticationType = listOf("MOCK")
)