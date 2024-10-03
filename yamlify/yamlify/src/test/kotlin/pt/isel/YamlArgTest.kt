package pt.isel

import pt.isel.test.StudentWithAnnotation
import kotlin.reflect.full.findAnnotation
import kotlin.reflect.full.primaryConstructor
import kotlin.test.Test
import kotlin.test.assertEquals


class Birth(
    @param:YamlArg("city of birth") val from: String
)

class YamlArgTest {

    @Test
    fun parseBirth() {
        val yaml = """
            city of birth: Oleiros
        """.trimIndent()
        val birth = YamlParserReflect.yamlParser(Birth::class).parseObject(yaml.reader())
        assertEquals("Oleiros", birth.from)
    }

    @Test
    fun testAnnotation() {
        val annotations = StudentWithAnnotation::class.primaryConstructor!!.parameters.mapNotNull {
            it.findAnnotation<YamlConvert>()
            }
        assertEquals(1, annotations.size)
    }
}