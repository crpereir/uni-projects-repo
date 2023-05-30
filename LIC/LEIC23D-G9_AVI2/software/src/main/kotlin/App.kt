
import isel.leic.utils.Time
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter


object App {

    const val USER_ID: Int = 123
    private const val USER_PASS = 4321
    var flag = false

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

                open()
                close()

            }
        }
    }


    fun open() {
        LCD.clear()
        TUI.setCursor(0,3)
        TUI.writeLCD("Hello User")
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

}


fun main(){
    TUI.init()
    DoorMechanism.init()
    DoorMechanism.close(15)
    App.entry()
}