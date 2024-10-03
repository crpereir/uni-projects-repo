package pt.isel

import java.time.LocalTime

class YamlToTime {
    fun parse(time: String): LocalTime {
        val t = time.split("-").map { it.toInt() }
        return LocalTime.of(t[0], t[1], t[2])
    }
}
