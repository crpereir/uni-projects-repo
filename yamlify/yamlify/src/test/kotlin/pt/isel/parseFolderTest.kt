package pt.isel

import org.junit.jupiter.api.Test
import org.junit.jupiter.api.assertThrows
import pt.isel.test.StudentWithAnnotation
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class parseFolderTest {

    @Test
    fun `parse Folder Lazy Reflect`() {
        val path = "src/test/kotlin/pt/isel/resources"
        val folder = YamlParserReflect.yamlParser(StudentWithAnnotation::class).parseFolderLazy(path)
        val iterator = folder.iterator()
        assertTrue(iterator.hasNext())
        val student = iterator.next()
        assertEquals("Maria Candida", student.name)
        val st2 = iterator.next()
        assertEquals("Jose Carioca", st2.name)
    }

    @Test
    fun `parse Folder Eager Reflect`() {
        val path = "src/test/kotlin/pt/isel/resources"
        assertThrows<IllegalArgumentException> {
            val folder = YamlParserReflect.yamlParser(StudentWithAnnotation::class).parseFolderEager(path)
            assertEquals("Maria Candida", folder[0].name)
            assertEquals("Jose Carioca", folder[1].name)
        }
    }

    @Test
    fun `parse Folder Lazy Cojen`() {
        val path = "src/test/kotlin/pt/isel/resources"
        val folder = YamlParserCojen.yamlParser(StudentWithAnnotation::class).parseFolderLazy(path)
        val iterator = folder.iterator()
        assertTrue(iterator.hasNext())
        val student = iterator.next()
        assertEquals("Maria Candida", student.name)
        val st2 = iterator.next()
        assertEquals("Jose Carioca", st2.name)
    }

    @Test
    fun `parse Folder Eager Cojen`() {
        val path = "src/test/kotlin/pt/isel/resources"
        assertThrows<IllegalArgumentException> {
            val folder = YamlParserCojen.yamlParser(StudentWithAnnotation::class).parseFolderEager(path)
            assertEquals(2, folder.size)
            assertEquals("Maria Candida", folder[0].name)
            assertEquals("Jose Carioca", folder[1].name)
        }
    }

}