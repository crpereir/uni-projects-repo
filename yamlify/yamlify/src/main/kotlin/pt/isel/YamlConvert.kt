package pt.isel

import kotlin.reflect.KClass

// pode ser usada em parâmetros de métodos ou construtores
// é usada para converter um YAML num objeto do tipo especificado
@Target(AnnotationTarget.VALUE_PARAMETER)
annotation class YamlConvert(val name: KClass<*>)