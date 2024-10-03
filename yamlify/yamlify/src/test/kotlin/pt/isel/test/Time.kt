package pt.isel.test

import pt.isel.YamlConvert
import pt.isel.YamlToTime
import java.time.LocalTime

open class Time(
    @YamlConvert(YamlToTime::class) val time: LocalTime
)