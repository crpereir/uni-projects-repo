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
// ver a diferenca entre writeStr e writeLCD
var flag = false
object App {

    val     logIn = emptyList<LOG.log>().toMutableList()

    fun entry() {
        userlist = loadUser()
        while (true) {

            TUI.clearLCD()
            TUI.setCursor(0, 0)
            val formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")
            val current = LocalDateTime.now().format(formatter)
                TUI.writeLCD(current)
            TUI.setCursor(1, 0)

            val useriD = TUI.useriD()
            if (useriD == null) {
                manutencao()
                if (flag == true) {
                    break
                }
                continue
            }

            if (useriD != Users.getiD(id = useriD)) {

                TUI.setCursor(1,0)
                TUI.writeLCD("                ")
                TUI.setCursor(1,0)
                TUI.writeLCD("PIN:????")
                Time.sleep(100)
                TUI.userPIN()
                LCD.clear()
                TUI.setCursor(0,2)
                TUI.writeLCD("Login Failed")
                Time.sleep(2500)
                continue
            } else {
                TUI.setCursor(1,0)
                TUI.writeLCD("                ")
                TUI.setCursor(1,0)
                TUI.writeLCD("PIN:????")
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
                open(userlist[useriD.toString()]!!) // ver o porque de ter !!

                close(userlist[useriD.toString()]!!)
            }
        }
    }

    fun deleteMensage(uid:String){
        TUI.clearLCD()
        TUI.setCursor(0,3)
        TUI.writeLCD("Clear Msg?")
        TUI.setCursor(1,5)
        TUI.writeLCD("(YES=*)")
        val key= TUI.readInt(5000).toChar()
        TUI.clearLCD()
        if ( key == '*'){
            TUI.setCursor(0,2)
            TUI.writeLCD("Msg has been")
            TUI.setCursor(1,4)
            TUI.writeLCD("cleared!")
            Time.sleep(2000)

                if (userlist[uid]?.mensagem != null) {
                    userlist[uid]?.mensagem = ""
                    // loadUser()
                }

            } else{
                TUI.clearLCD()
                TUI.setCursor(0,3)
                TUI.writeLCD("msg has been")
                TUI.setCursor(1,5)
                TUI.writeLCD("helded!")
            }

    }

    private fun open(user: Users.User) {
        TUI.clearLCD()
        TUI.setCursor(0,2)
        TUI.writeStr("welcome back")
        TUI.setCursor(1,2)
        TUI.writeLCD(user.name)

        Time.sleep(2000)
        //Time.sleep(2500)
        //TUI.setCursor(0,6)
        //println(userlist[user.mensagem])
        if (user.mensagem != "") {
            //print("hey")
            TUI.clearLCD()
            TUI.writeStr("${user.mensagem}")
            if (TUI.readInt(5000).toChar() == '*') deleteMensage(user.id.toString())
        }

        if (TUI.readInt(5000).toChar() == '#') changePassword(user.id.toString())
        TUI.clearLCD()
        TUI.setCursor(0,2)
        TUI.writeLCD(user.name)
        TUI.setCursor(1,0)
        TUI.writeLCD("Opening Door...")
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

    private fun changePassword(uid:String){
        TUI.clearLCD()
        TUI.setCursor(0,3)
        TUI.writeLCD("Change PIN?")
        TUI.setCursor(1,5)
        TUI.writeLCD("(YES=*)")

        val key= TUI.readInt(5000).toChar()
        TUI.clearLCD()
        if ( key == '*'){
            TUI.setCursor(0,4)
            TUI.writeLCD("Insert New")
            TUI.setCursor(1,0)
            TUI.writeLCD("PIN:????")


            val newPassword= TUI.userPIN()

            TUI.setCursor(0,2)
            TUI.writeLCD("Re-Insert New")
            TUI.setCursor(1,0)
            TUI.writeLCD("PIN:????")
            val confirmPassword = TUI.userPIN()
            if (newPassword==confirmPassword){
                TUI.clearLCD()
                TUI.setCursor(0,3)
                TUI.writeLCD("PIN has been")
                TUI.setCursor(1,5)
                TUI.writeLCD("changed!")
                Time.sleep(1000)
                TUI.clearLCD()
                if (newPassword != null) {
                    userlist[uid]?.password = newPassword
                   // loadUser()
                }
            } else{
                TUI.clearLCD()
                TUI.setCursor(0,3)
                TUI.writeLCD("PIN has been")
                TUI.setCursor(1,5)
                TUI.writeLCD("helded!")
            }



        }
    }

    private fun close (user: Users.User) {
        TUI.setCursor(0,2)
        TUI.writeLCD(user.name)
        TUI.setCursor(1,2)
        TUI.writeLCD("Closing Door")
        Time.sleep(500)
        DoorMechanism.close(2)
        while (DoorMechanism.finished() != true) {}
        TUI.clearLCD()
        TUI.setCursor(0,2)
        TUI.writeLCD(user.name)
        TUI.setCursor(1,2)
        TUI.writeLCD("Door Closed")
        Time.sleep(500)
    }

    private fun manutencao() {
        if (M.manutencao()) {
            flag = true
            TUI.clearLCD()
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
            var password: Int

            when (str) {
                "NEW" -> {
                    print("User name? ")
                    var name = readln()
                    while (name.length > 16) {
                        println("The $name has more than 16 chars")
                        print("User name? ")
                        name = readln()
                    }
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
                        //println(userlist[user.id.toString()]?.mensagem)
                    }
                    //println(" ")

                }

                "OFF" -> {
                    write("USERS.txt", userlist)
                    writeLog("LOG.txt", logIn)
                    //ADICIONAR 1000 USERS
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
    while (true) {
        App.entry()
        App.commands()
        flag = false

    }
}

