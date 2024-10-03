package pt.isel

import org.openjdk.jmh.annotations.*

@BenchmarkMode(Mode.Throughput)
@State(Scope.Benchmark)
open class YamlParserAccountBenchmark  {

    private val parserAccountBaseline = YamlSavingsAccountParser()
    private val parserAccountReflect = YamlParserReflect.yamlParser(SavingsAccount::class)
    private val parserAccountCojen = YamlParserCojen.yamlParser(SavingsAccount::class)

    @Benchmark
    fun accountBaseline(): SavingsAccount {
        return parserAccountBaseline
            .parseObject(yamlSavingsAccount.reader())
    }

    @Benchmark
    fun accountReflect(): SavingsAccount {
        return parserAccountReflect.parseObject(yamlSavingsAccount.reader())
    }

    @Benchmark
    fun accountCojen(): SavingsAccount {
        return parserAccountCojen.parseObject(yamlSavingsAccount.reader())
    }
}

