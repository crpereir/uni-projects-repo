package pt.isel

import kotlin.reflect.KClass
import kotlin.reflect.KFunction
import kotlin.reflect.KParameter
import kotlin.reflect.full.createInstance
import kotlin.reflect.full.declaredMemberFunctions
import kotlin.reflect.full.findAnnotations
import kotlin.reflect.jvm.jvmErasure

/**
 * A YamlParser that uses reflection to parse objects.
 */
class YamlParserReflect<T : Any>(type: KClass<T>) : AbstractYamlParser<T>(type) {
    companion object {

        // guarda instâncias de YamlParserReflect para diferentes tipos de classes
        // para um determinado tipo de classe, so precisamos de criar uma instância de YamlParserReflect e podemos reutilizá-la
        // KClass -> qaulquer tipo de classe a ser instanciada e YamlParserReflect -> instância do parser
        private val yamlParsers: MutableMap<KClass<*>, YamlParserReflect<*>> = mutableMapOf()

        /**
         * Creates a YamlParser for the given type using reflection if it does not already exist.
         * Keep it in an internal cache of YamlParserReflect instances.
         */
        fun <T : Any> yamlParser(type: KClass<T>): AbstractYamlParser<T> {
            return yamlParsers.getOrPut(type) { YamlParserReflect(type) } as YamlParserReflect<T>
        }
    }

    /**
     * Used to get a parser for other Type using the same parsing approach.
     */
    override fun <T : Any> yamlParser(type: KClass<T>) = YamlParserReflect.yamlParser(type)

    /**
     * Creates a new instance of T through the first constructor
     * that has all the mandatory parameters in the map and optional parameters for the rest.
     */

    private var constructor: KFunction<T> // guarda o construtor da classe T para criar novas instâncias
    // guarda o nome do parâmetro e a função de conversão para esse parâmetro
    // a função serve para converter o valor do parâmetro para o tipo correto
    private val functionMap: MutableMap<String, Pair<KParameter, (KParameter, Any) -> Any>> = mutableMapOf()
    private val yamlCovertAnnotations: MutableMap<KParameter, YamlConvert> = mutableMapOf() // guarda as anotações YamlConvert
    private val yamlArgAnnotation: MutableMap<KParameter, YamlArg> = mutableMapOf() // guarda as anotações YamlArg
    private val stringToTypeConversions = mapOf<KClass<*>, (String) -> Any>(Int::class to String::toInt, // guarda as funções de conversão para tipos primitivos
        Float::class to String::toFloat,
        Boolean::class to String::toBoolean,
        Char::class to { s: String -> s.first() },
        Long::class to String::toLong,
        Double::class to String::toDouble,
        Short::class to String::toShort,
        Byte::class to String::toByte,
        String::class to { s: String -> s })

    init {
        constructor = getConstructor()
    }

    // obtem o construtor da classe T
    private fun getConstructor(): KFunction<T> {
        val type = getType() // obtem o tipo da classe
        val typeConstructor = type.constructors.first() // obtem o primeiro construtor
        val typeParameters = typeConstructor.parameters // obtem os parâmetros do construtor
        typeParameters.forEach { param -> // para cada parâmetro do construtor
            val convertAnnotation = param.findAnnotations<YamlConvert>() // obtem as anotações YamlConvert
            if (convertAnnotation.isNotEmpty()) yamlCovertAnnotations[param] = convertAnnotation.first() // guarda a anotação no mapa de anotações
            val argAnnotation = param.findAnnotations<YamlArg>() // obtem as anotações YamlArg
            if (argAnnotation.isNotEmpty()) { // se tiver anotação guarda a anotação no mapa de anotações e o parâmetro no mapa de funções
                yamlArgAnnotation[param] = argAnnotation.first() // guarda a anotação no mapa de anotações
                functionMap[argAnnotation.first().name] = Pair(param, getFunction(param)) // guarda o parâmetro e a função de conversão no mapa de funções
            }
            functionMap[param.name!!] = Pair(param, getFunction(param)) // guarda o parâmetro e a função de conversão no mapa de funções
        }
        return typeConstructor // retorna o construtor
    }

    // cria uma nova instância de um tipo usando um mapa de valores
    // type -> classe do objeto que quero criar e value -> mapa com os valores usados para criar a nova instancia
    // yamlParser é chamado para criar uma nova instância de AbstractYamlParser para analisar objetos yaml
    // so é usado para objetos que nao sao primitivos, listas, sequencias etc
    private fun objectParser(type: KClass<*>, value: Any) = yamlParser(type).newInstance(value as Map<String, Any>)

    // para cada item da lista chama objectParser para criar uma nova instância do tipo
    private fun collectionParser(type: KClass<*>, value: Any): List<Any> {
        return (value as List<*>).map { objectParser(type, it!!) }
    }

    // usado para obter uma função de conversão para tipos primitivos
    // KParameter -> representa um parametro do metodo ou construtor
    // .type -> instancia de KType que representa o tipo do parametro
    // .jvmErasure -> obtem a classe de tempo de execução do tipo ()
    private fun getPrimitiveConversionFunction(param: KParameter): ((KParameter, Any) -> Any)? {
        val type = param.type.jvmErasure // List<String> -> List::class
        // verifica se o tipo está no mapa, se sim retorna a função de conversão, se não retorna null
        return if (type in stringToTypeConversions) { _, v: Any -> stringToTypeConversions[type]!!(v as String) } else null
    }

    // usado para obter uma função de conversão para tipos não primitivos
    private fun getSpecialConversionFunction(param: KParameter): ((KParameter, Any) -> Any) {
        when (param.type.jvmErasure) {
            // (1) verifica se o tipo é uma sequence e retorna uma função que chama collectionParser
            Sequence::class -> return { p: KParameter, v: Any -> // (1)
                collectionParser(p.type.arguments[0].type?.classifier as KClass<*>, v).asSequence()
                // p é um parametro do construtor (KParameter)
                // p.type é o tipo do parametro
                // arguments[0] obtem o primeiro argumento do tipo (no caso é o tipo do argumento da sequencia)
                // p.type.arguments[0].type?.classifier obtem o tipo do argumento da sequencia
            }

            // (2) verifica se o tipo é uma lista e retorna uma função que chama collectionParser
            List::class -> return { p: KParameter, v: Any ->
                collectionParser(p.type.arguments[0].type?.classifier as KClass<*>, v)
            }

            // (3) se não for sequence nem lista verifica se o parâmetro está anotado com YamlConvert
            // se sim retorna uma função de conversão que cria uma nova instância do tipo anotado e chama o método parse para converter na instância da class
            else -> if (param in yamlCovertAnnotations) { // (3)
                return lambda@{ p: KParameter, v: Any ->
                    val annotation = yamlCovertAnnotations[p]
                    val obj = annotation?.name?.createInstance()
                    val parsedObject =
                        annotation?.name?.declaredMemberFunctions?.first { // retorna a primeira função que tem o nome parse e dois parâmetros
                            it.name == "parse" && it.parameters.size == 2 && it.parameters.last().type.jvmErasure == String::class
                        }?.call(obj, v) // chama a função parse com o valor v (valor do parâmetro que queremos converter)
                    if (parsedObject == null) throw IllegalStateException("Annotated class must implement method parse(String)")
                    return@lambda parsedObject
                }
            }
            // se nao tiver anotação retorna uma função que chama objectParser para criar uma nova instância do tipo
            else return { p: KParameter, v: Any -> objectParser(p.type.jvmErasure, v) }
        }
    }

    // obtem a função de conversão para o parâmetro (ou a dos tipos primitivos ou a dos tipos não primitivos)
    private fun getFunction(param: KParameter): (KParameter, Any) -> Any =
        getPrimitiveConversionFunction(param) ?: getSpecialConversionFunction(param)

    // cria uma nova instância do tipo T (chave -> nome do parâmetro, valor -> valor do parâmetro)
    override fun newInstance(args: Map<String, Any>): T {
        return constructor.callBy(args.map { // para cada entrada do mapa de argumentos passados
            val key = it.key // obtem a chave (nome do parâmetro do construtor)
            val value = it.value // obtem o valor (função que converte o valor do param para o tipo correto)
            val obj = functionMap[key]!! // obtem o parâmetro e a função de conversão para o parâmetro
            // cria um novo par de chave-valor em que o segundo valor é o resultado da função de conversão
            obj.first to obj.second(obj.first, value)
        }.toMap()) // converte a lista de pares chave-valor para um mapa
    }
}
