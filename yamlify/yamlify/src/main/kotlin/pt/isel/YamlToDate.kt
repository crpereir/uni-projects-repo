package pt.isel

import java.time.LocalDate

class YamlToDate {
    fun parse(obj: String): LocalDate {
        return LocalDate.parse(obj)
    }
}