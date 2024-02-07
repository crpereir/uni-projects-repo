package pt.isel.gomoku.http.dto

import pt.isel.gomoku.domain.variants.Variant
import pt.isel.gomoku.domain.variants.Variants

/**
 * The DTO used to represent variants obtained from the remote service.
 */
data class VariantsDto(
    val variants: List<VariantDto>
) {

    /**
     * Convert [VariantsDto] to [Variants].
     */
    fun toVariants() = Variants(
        variants = variants.map { vDto: VariantDto ->
            Variant(
                variantId = vDto.variantId,
                boardDim = vDto.boardDim,
                openingRules = enumValueOf(vDto.openingRules),
                playingRules = enumValueOf(vDto.playingRules)
            )
        }
    )
}

/**
 * The DTO used to represent variant obtained from the remote service.
 */
data class VariantDto(
    val variantId: Int,
    val boardDim: Int,
    val openingRules: String,
    val playingRules: String
)
