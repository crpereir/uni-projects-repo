package pt.isel.test

import pt.isel.YamlArg
import pt.isel.YamlConvert
import pt.isel.YamlToDate
import java.io.Serial
import java.time.LocalDate

class StudentWithAnnotation
@JvmOverloads constructor(
    val name: String,
    val nr: Int,
    val from: String,
    val address: Address? = null,
    val grades: List<Grade> = emptyList(),
    @Serial @YamlConvert(YamlToDate::class) val birth: LocalDate
)
