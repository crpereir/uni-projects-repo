package pt.isel


// pode ser usada em propriedades de classes ou em parâmetros de métodos ou construtores
// é usada para especificar o nome ao converter um YAML num objeto do tipo especificado (ou vice-versa)
@Target(AnnotationTarget.PROPERTY, AnnotationTarget.VALUE_PARAMETER)
annotation class YamlArg(val name: String)
