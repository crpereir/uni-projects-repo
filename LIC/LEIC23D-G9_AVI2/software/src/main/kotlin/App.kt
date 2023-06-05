import LOG.writeLog
import Users.getName
import Users.getPassword
import Users.userlist
import Users.write
import isel.leic.utils.Time
import java.time.*
import java.time.format.*
import java.util.*
import kotlin.collections.HashMap
import kotlin.system.exitProcess


object App {

    private val list:HashMap<String,Users.User> = Users.loadUser()
    private var flag = false
    val logIn= emptyList<LOG.log>().toMutableList()
// bug quando metemos id e apagamos ele vai para id em vez de apagar, permanece na passe mas aparece id
// bug de vez em quando, quando meto o user 009 ele nao abre a porta mas nao aperece a porta a abrir
    // quando clickamos enter temos que voltar
    fun entry() {
        while (true) {
            list.forEach{
                println("${it.value.id}   ${it.value.name} ${it.value.password}")
            }


            TUI.clearLCD()
            TUI.setCursor(0, 0)
            val formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")
            val current = LocalDateTime.now().format(formatter)
            TUI.writeLCD(current)
            TUI.setCursor(1, 0)

            val useriD = TUI.useriD()

            val teste= list["00"+useriD.toString()]?.password

            if (useriD == null) {
                manutencao()
                if (flag == true) {
                    break
                }
                continue
            }

// com user valido nao entra aqui
            if (useriD != Users.getiD(id = useriD)) {
                TUI.setCursor(1,0)
                TUI.writeLCD("                ")
                TUI.setCursor(1,0)
                TUI.writeLCD("PIN:")
                Time.sleep(100)
                TUI.userPIN()
                LCD.clear()
                TUI.setCursor(0,2)
                TUI.writeLCD("Login Failed")
                Time.sleep(2500)
                continue
            } else {
               // println("here")
                TUI.setCursor(1,0)
                TUI.writeLCD("                ")
                TUI.setCursor(1,0)
                TUI.writeLCD("PIN:")
                val userPIN = TUI.userPIN()

                if (userPIN != teste || userPIN==null) {

                    LCD.clear()
                    TUI.setCursor(0,2)
                    TUI.writeLCD("Login Failed")
                    Time.sleep(2500)
                    manutencao()
                    if (flag == true) {
                        break
                    }
                    continue
                }

                manutencao()
                if (flag == true) {
                    break
                }
                open()
                val myUser= list.get("00" + useriD.toString())
                getUser(myUser?.name, useriD.toInt(), current)
                println(logIn)
                close()

            }
        }
    }

    private fun open() {
        LCD.clear()
        TUI.setCursor(0,3)
        //TUI.writeLCD("Hello ${updatedUser?.name}")
        Time.sleep(250)
        LCD.clear()
        TUI.setCursor(0,6)
        TUI.writeLCD("User")
        TUI.setCursor(1,1)
        TUI.writeLCD("Opening Door..")
        Time.sleep(500)
        DoorMechanism.open(2)
        while (DoorMechanism.finished() != true) {}
        Time.sleep(500)
        TUI.setCursor(1,0)
        TUI.writeLCD("               ")
        TUI.setCursor(1,3)
        TUI.writeLCD("Door Open")
        Time.sleep(500)
    }
    private fun close () {
        TUI.setCursor(1,2)
        TUI.writeLCD("Closing Door")
        Time.sleep(500)
        DoorMechanism.close(2)
        while (DoorMechanism.finished() != true) {}
        LCD.clear()
        TUI.setCursor(1,3)
        TUI.writeLCD("Door Close")
        Time.sleep(250)
    }
    private fun manutencao() {
        if (M.manutencao()) {
            flag = true
            LCD.clear()
            TUI.setCursor(0,1)
            TUI.writeLCD("Out Of Service")
            TUI.setCursor(1,5)
            TUI.writeLCD("Wait")

        }
    }

    fun getFirstIDAvailable(): String {
        var id = 0
        var i = "000"
        while (id < list.size) {
            if ( i !in list ) {
                return i
            }
            id++
            i = if (id < 10) {
                "00${id}"
            } else if (id in 10..99) {
                "0${id}"
            } else {
                "$id"
            }
        }
        return i
    }




    fun commands() {
        println("Turn M key to off, to terminate the maintenance mode.")
        println("Commands: NEW, DEL, MSG, or OFF")
        while (M.manutencao()) {
            print("Maintenance> ")
            val str = readln().uppercase()
            val password: Int
            when (str) {
                "NEW" -> {
                    print("User name? ")
                    val name = readln()
                    print("PIN?")
                    password = readln().toInt()
                    val id = getFirstIDAvailable()
                    val user = Users.User(id.toInt(), password, name)
                    list.put(id, user)
                    println( list.put(id, user)?.name)
                    println("Adding user ${user.id}:${user.name}")
                    list.forEach{
                        println("${it.value.id}   ${it.value.name}")
                    }
                }
                // aqui deteta bem a passe,users e nome
                "DEL" -> {
                    print("UIN? ")
                    val uin = readln()
                    val user = list.get(uin)
                    if (user != null) {
                        println("Remove user ${user.id}:${user.name}")
                    }
                    print("Y/N? ")
                    val read = readln()
                    if (read == "Y" || read == "y")
                        if (user != null) {
                            println("User ${user.id}:${user.name} removed.")
                        }
                    else
                        println("Command aborted.")
                    if (user != null) {
                        list.remove(uin)

                    }

                }

                "MSG" -> {
                    print("UIN? ")
                    val uin = readln()
                    val user = list.get(uin)
                    print("Message? ")
                    val read = readln()
                    if (user != null) {
                        println("The message $read has been associated to ${user.id}:${user.name}")
                    }
                    if (user != null) {
                        user.mensagem = read
                    }
                }

                "OFF" -> {
                    write("USERS.txt", Users.userlist)
                    writeLog("LOG.txt", logIn)
                    exitProcess(0)

                }
            }
        }
    }
    //criar uma classe log que recebe um nome do tipo string , um UIne uma string que e uma data
    // criei uma variavel que e mutable list, na funcao new register
    fun getUser(name:String?,uid:Int,date:String){
    val new=LOG.log(uid,name,date)
        logIn+=new
        logIn.forEach {
            println(it.uid)
        }
    }
}

fun main(){
    TUI.init()
    App.entry()
    DoorMechanism.init()
    DoorMechanism.close(15)
    App.commands()
}

