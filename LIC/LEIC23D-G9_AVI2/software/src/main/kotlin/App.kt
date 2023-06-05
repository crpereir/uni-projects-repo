import LOG.writeLog
import Users.getName
import Users.getPassword
import Users.loadUser
import Users.userlist
import Users.write
import isel.leic.utils.Time
import java.time.*
import java.time.format.*
import java.util.*
import kotlin.collections.HashMap
import kotlin.system.exitProcess


object App {

    //private val list: HashMap<String,Users.User> = Users.loadUser()
    private var flag = false
    val logIn = emptyList<LOG.log>().toMutableList()

    // bug quando metemos id e apagamos ele vai para id em vez de apagar, permanece na passe mas aparece id
    // bug de vez em quando, quando meto o user 009 ele nao abre a porta mas nao aperece a porta a abrir
    // quando clickamos enter temos que voltar
    fun entry() {
        userlist = loadUser()
        while (true) {
            /*list.forEach{
                println("${it.value.id} ${it.value.password} ${it.value.name} ")
            }*/

            TUI.clearLCD()
            TUI.setCursor(0, 0)
            val formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")
            val current = LocalDateTime.now().format(formatter)
            TUI.writeLCD(current)
            TUI.setCursor(1, 0)

            val useriD = TUI.useriD()

            //val teste = list["00" + useriD.toString()]?.password

            if (useriD == null) {
                manutencao()
                if (flag == true) {
                    break
                }
                continue
            }


            //println(Users.getiD(id = useriD))
            //println("------------------------")
            //println(useriD.toString())
            //println(userlist[useriD.toString()])


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

                if ((userPIN != userlist[useriD.toString()]?.password) || (userPIN == null)) {

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

                logIn.add(LOG.log(current,useriD))
                open(userlist[useriD.toString()]!!)

                close()
            }
        }
    }

    private fun open(user: Users.User) {
        LCD.clear()
        TUI.setCursor(0,1)
        TUI.writeStr("${user.name}")
        Time.sleep(250)
        LCD.clear()
        TUI.setCursor(0,6)
        if (user.mensagem != "") {
            LCD.clear()
            TUI.writeStr("${user.mensagem}")
        }
        //TUI.writeLCD("${user.name}")
        //LCD.clear()

        Time.sleep(1000)
        LCD.clear()

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
        //var i = "000"
        while (id < userlist.size) {
            if ( id.toString() !in userlist ) {
                return id.toString()
            }
            id++
        }
        return id.toString()
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
                    print("PIN? ")
                    password = readln().toInt()
                    val id = getFirstIDAvailable()
                    val user = Users.User(id.toInt(), password, name)
                    userlist.put(id, user)
                    println( userlist.put(id, user)?.name)
                    println("Adding user ${user.id}:${user.name}")
                    userlist.forEach{
                        println("${it.value.id}   ${it.value.name}")
                    }
                }

                "DEL" -> {
                    print("UIN? ")
                    val uin = readln()
                    val user = userlist.get(uin)
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
                        userlist.remove(uin)

                    }

                }

                "MSG" -> {
                    print("UIN? ")
                    val uin = readln().toInt()
                    val user = userlist.get(uin.toString())
                    println(user)
                    print("Message? ")
                    val read = readln()
                    if (user != null) {
                        println("The message $read has been associated to ${user.id}:${user.name}")
                        userlist[user.id.toString()]?.mensagem = read
                    }
                    println(" ")
                }

                "OFF" -> {
                    write("USERS.txt", userlist)
                    writeLog("LOG.txt", logIn)
                    exitProcess(0)
                }
            }
        }
    }
}

fun main(){
    TUI.init()
    DoorMechanism.init()
    DoorMechanism.close(15)
    App.entry()
    App.commands()
}

