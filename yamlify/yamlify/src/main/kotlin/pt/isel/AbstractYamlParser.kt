package pt.isel

import java.io.File
import java.io.Reader
import kotlin.reflect.KClass

// O AbstractYamlParser implementa a interface YamlParser
abstract class AbstractYamlParser<T : Any>(private val type: KClass<T>) : YamlParser<T> {

    // método abstrato que retorna um parser para um tipo T usando a mesma abordagem de parsing
    abstract fun <T : Any> yamlParser(type: KClass<T>): AbstractYamlParser<T>

    // cria uma nova instância de T a partir do primeiro construtor
    // que tem todos os parâmetros obrigatórios no mapa e parâmetros opcionais para o resto
    abstract fun newInstance(args: Map<String, Any>): T

    // retorna o tipo da classe a ser instanciada
    fun getType(): KClass<T> = this.type

    // é chamada pela segunda parseObject
    // analisa uma lista de strings e retorna um par com um mapa e o índice da última linha analisada
    // o mapa é constituido por pares chave-valor onde a chave é uma string que representa o nome do atributo e o valor é o valor do atributo
    private fun objectParser(level: Int, yaml: List<String>, idx: Int = 0): Pair<Map<String, Any>, Int> {
        // se a primeira linha não contiver um objeto, lança uma exceção
        if (idx == 0 && yaml.first().trim()
                .startsWith("-")
        ) throw IllegalArgumentException("The reader passed does not contain a representation of an object")
        val map = mutableMapOf<String, Any>() // cria um mapa vazio
        var i = idx // é o indice da linha atual
        while (i < yaml.size) { // percorre todas as linhas do yaml
            val currentLevel = findLevel(yaml[i]) // encontra o nível da linha atual para saber se é um objeto, lista de objetos ou lista de primitivos
            when {
                currentLevel == level -> { // se o nível da linha atual for igual ao nível do objeto
                    val s = yaml[i].split(":") // divide a linha atual em duas partes, a chave e o valor
                    val key = s.first().trim() // a chave é a primeira parte da linha
                    if (s.size == 2) { // se a linha tiver duas partes
                        val value = s.last().trim() // o valor é a segunda parte da linha
                        when {
                            value.isEmpty() -> { // se o valor for vazio
                                // se a próxima linha for uma lista de objetos, chama listParser se não chama objectParser
                                val parser = if (yaml[i.inc()].contains("-")) ::listParser else ::objectParser
                                val v = parser(findLevel(yaml[i.inc()]), yaml, i.inc()) // chama o parser para a próxima linha
                                map[key] = v.first // adiciona o valor ao mapa
                                i = v.second // atualiza o índice
                            }

                            else -> { // se o valor não for vazio
                                map[key] = value // adiciona o valor ao mapa
                                i++ // atualiza o índice
                            }
                        }
                    }
                }
                // se o nível da linha atual for menor que o nível do objeto, retorna o mapa e o índice
                currentLevel < level -> return map to i
            }
        }
        return map to i // retorna o mapa e o índice
    }

    // é a segunda a ser chamada, chama objectParser para criar um mapa e depois cria uma nova instância de T
    // chama objectParser e depois usa o mapa retornado para criar uma nova instância de T usando newInstance
    // o .first é usado para obter o mapa retornado por objectParser
    private fun parseObject(yaml: List<String>): T = newInstance(objectParser(findLevel(yaml.first()), yaml).first)

    // é a primeira a ser chamada
    // quando queremos analisar um objeto a partir de um Reader
    final override fun parseObject(yaml: Reader): T = parseObject(readerToList(yaml))

    // encontra o nível de uma linha
    // serve para saber se a linha é um objeto, lista de objetos ou lista de primitivos
    private fun findLevel(line: String): Int = line.takeWhile { it == ' ' }.length

    // é a primeira a ser chamada
    // quando queremos analisar uma lista de objetos a partir de um Reader
    final override fun parseList(yaml: Reader): List<T> {
        val txt = readerToList(yaml) // lê o yaml e converte para uma lista de strings
        val parsed = listParser(findLevel(txt.first()), txt) // chama listParser para analisar a lista de strings e retorna um par com uma lista e o índice
        val list = if (type == String::class || type.javaPrimitiveType != null) parsed.first.map { it as T } // se o tipo for String ou primitivo, retorna a lista de primitivos
        else parsed.first.map { newInstance(it as Map<String, Any>) } // se não, cria uma nova instância de T para cada mapa da lista
        return list // retorna a lista
    }

    // é a segunda a ser chamada, analisa o yaml e constrói uma lista de mapas
    private fun listParser(level: Int, yaml: List<String>, idx: Int = 0): Pair<List<Any>, Int> {
        val list = mutableListOf<Any>() // cria uma lista vazia
        // se o tipo for String ou primitivo, chama parseListOfValues para analisar a lista de primitivos
        // retorna o primeiro elemento que é a lista de valores analisados e o segundo elemento que é o índice da última linha analisada
        if (type == String::class || type.javaPrimitiveType != null) return parseListOfValues(yaml) to yaml.size
        else { // se não
            var i = idx // é o índice da linha atual
            while (i < yaml.size) { // percorre todas as linhas do yaml
                val currentLevel = findLevel(yaml[i]) // encontra o nível da linha atual para saber se é um objeto, lista de objetos ou lista de primitivos
                if (currentLevel == level && isList(yaml[i])) { // se o nível da linha atual for igual ao nível da lista e a linha for uma lista
                    val parser = if (isList(yaml[i.inc()])) ::listParser else ::objectParser // se a próxima linha for uma lista de objetos, chama listParser se não chama objectParser
                    val v = parser(findLevel(yaml[i.inc()]), yaml, i.inc()) // chama o parser para a próxima linha
                    list.add(v.first) // adiciona o valor à lista
                    i = v.second // atualiza o índice
                } else if (currentLevel < level) return list to i // se o nível da linha atual for menor que o nível da lista, retorna a lista e o índice
            }
            return list to i // retorna a lista e o índice
        }
    }

    // verifica se a linha é uma lista
    private fun isList(str: String): Boolean = str.trim().startsWith("-")

    // analisa uma lista de primitivos e retorna uma lista de valores
    private fun parseListOfValues(yaml: List<String>): List<Any> {
        val list = mutableListOf<Any>() // cria uma lista vazia
        yaml.forEach { line -> // percorre todas as linhas do yaml
            if (isList(line)) { // se a linha for uma lista
                val value = line.substringAfter("-").trim() // o valor é a parte da linha depois do traço
                when (type) { // adiciona o valor à lista convertendo para o tipo correto
                    Int::class -> list.add(value.toInt())
                    Long::class -> list.add(value.toLong())
                    Float::class -> list.add(value.toFloat())
                    Double::class -> list.add(value.toDouble())
                    String::class -> list.add(value)
                    Char::class -> list.add(value.first())
                    Short::class -> list.add(value.toShort())
                    Byte::class -> list.add(value.toByte())
                    else -> throw IllegalArgumentException("Unsupported type $type")
                }
            }
        }
        return list
    }

    // lê o yaml e converte para uma lista de strings
    private fun readerToList(yaml: Reader): List<String> = yaml.readLines().filter { it.isNotEmpty() }

    // é usada para analisar um ficheiro yaml e retornar uma sequência de objetos do tipo T
    // yield é usada para adicionar cada novo objeto à sequência
    fun parseSequence(yaml: Reader): Sequence<T> {
        val txt = readerToList(yaml) // lê o yaml e converte para uma lista de strings
        // se a primeira linha não contiver uma lista, lança uma exceção
        if (!txt.first().contains("-")) throw Exception("The reader passed does not contain a representation of a list")
        // chama listParser para analisar a lista de strings e retorna a lista de valores analisados
        val list = listParser(findLevel(txt.first()), txt).first
        return sequence { // cria uma sequência
            // para cada mapa na lista, a função newInstance é chamada para criar uma nova instância do objeto do tipo T
            for (elem in list) yield(newInstance(elem as Map<String, Any>))
        }
    }

    // é usado para analisar ficheiros yaml de forma eager, ou seja, todos os ficheiros são analisados de uma vez
    fun parseFolderEager(path: String): List<T> {
        // chama a função parseFolderLazy para criar uma sequência de objetos
        // converte essa sequência numa lista com a chamada toList()
        // como a sequência é convertida numa lista, todos os objetos são analisados imediatamente, em vez de serem analisados conforme necessário
        return parseFolderLazy(path).toList()
    }

    // é usada para analisar ficheiros yaml de forma lazy, ou seja, os ficheiros são
    // analisados um por um, conforme necessário, em vez de todos de uma vez.
    fun parseFolderLazy(path: String): Sequence<T> {
        val files = File(path).listFiles()?.toList()?.filter { it.extension == "yaml" } ?: emptyList() // lista os ficheiros yaml da pasta
        val fileIterator = files.iterator() // cria um iterador a partir da lista de ficheiros
        return sequence { // cria uma sequência
            for (file in fileIterator) { // percorre todos os ficheiros
                val reader = file.reader() // cria um reader para o ficheiro
                yield(parseObject(reader)) // chama parseObject para analisar o ficheiro e adicionar o objeto à sequência
            }
        }
    }

    // yield é usada para adicionar cada objeto à sequência de maneira preguiçosa, ou seja, o objeto é analisado e adicionado
    // à sequência apenas quando necessário.
}