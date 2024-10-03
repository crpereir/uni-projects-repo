package pt.isel

import org.junit.jupiter.api.BeforeEach
import pt.isel.test.Time
import java.time.LocalTime
import kotlin.test.Test
import kotlin.test.assertEquals

class YamlSequenceParser {
    class TimeTest(@YamlConvert(YamlToTime::class) time: LocalTime) : Time(time) {

        companion object {
            var count = 0
        }

        init {
            count++
        }
    }

    @BeforeEach fun resetCounter() {
        TimeTest.count = 0
    }

    @Test
    fun `is Lazy Reflect`() {
        val yaml = """
            -
                time: 15-27-52
            -
                time: 19-27-30
            -
                time: 23-59-59
        """.trimIndent()
        val seq = YamlParserReflect.yamlParser(TimeTest::class).parseSequence(yaml.reader())
        val iterator = seq.iterator()
        assertEquals(0, TimeTest.count)
        iterator.next()
        assertEquals(1, TimeTest.count)
    }

    @Test
    fun `is Lazy Cojen`() {
        val yaml = """
            -
                time: 15-27-52
            -
                time: 19-27-30
            -
                time: 23-59-59
        """.trimIndent()
        val seq = YamlParserCojen.yamlParser(TimeTest::class).parseSequence(yaml.reader())
        val iterator = seq.iterator()
        assertEquals(0, TimeTest.count)
        iterator.next()
        assertEquals(1, TimeTest.count)
    }
}