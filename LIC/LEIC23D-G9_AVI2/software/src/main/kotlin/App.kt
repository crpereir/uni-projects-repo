import TUI.clearLCD
import Users.getPassword
import Users.getUser
import Users.loadUsers
import isel.leic.utils.Time
import java.io.File
import java.io.FileNotFoundException
import java.io.PrintWriter
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter


object App {

    private const val USER_ID: Int = 123
    private const val USER_PASS = 4321
    private var updatedUser: Users.User? = null
    private var flag = false

    fun entry() {

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

            if (useriD != USER_ID) {
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

                TUI.setCursor(1,0)
                TUI.writeLCD("                ")
                TUI.setCursor(1,0)
                TUI.writeLCD("PIN:")

                if (TUI.userPIN() != USER_PASS) {
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
                close()

            }
        }
    }


    private fun open() {
        LCD.clear()
        TUI.setCursor(0,3)
        TUI.writeLCD("Hello ${updatedUser?.getName()}")
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


    fun close () {
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

    fun manutencao() {
        if (M.manutencao()) {
            flag = true
            LCD.clear()
            TUI.setCursor(0,1)
            TUI.writeLCD("Out Of Service")
            TUI.setCursor(1,5)
            TUI.writeLCD("Wait")

        }
    }

    fun updateUserList() {
        val printWriter = PrintWriter(File("USERS.txt"))
        for (user in Users.userlist) {
            user!!.saveParameters(printWriter)
            printWriter.println()
        }
            printWriter.close()
    }

    fun generateID(): Int {
        var iD = (Math.random() * (999 - 1) + 1).toInt()
        for (user in Users.userlist) {
            if (iD == user!!.iD) iD = (Math.random() * (999 - 1) + 1).toInt()
        }
        return iD
    }

    fun userInput(): Boolean {
        val a = TUI.useriD()
        if (getUser(a) == null) return false
        val b = TUI.userPIN()
        val c: Int
        if (getUser(a) != null) {
            updatedUser = getUser(a)
            c = getPassword(a)!!
            return c == b
        }
        return false
    }
}

fun main(){
    TUI.init()
    loadUsers()
    DoorMechanism.init()
    DoorMechanism.close(15)
    while (true) {
        clearLCD()
        TUI.init()
        if (App.userInput()) {
            App.entry()
        }
    }
}