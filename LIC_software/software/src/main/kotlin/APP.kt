
import App.USER_ID
import App.entry
import isel.leic.utils.Time
import java.time.LocalDateTime


object App {

    const val USER_ID: Long = 1234
    private const val USER_PASS = 4321


    fun entry(id: Long, pass: Long) {
        TUI.setCursor(0, 1)
        TUI.writeLCD("${LocalDateTime.now()}")
        TUI.setCursor(1, 1)
        TUI.writeLCD("UIN:  ")
        while (true) {
            if (TUI.read(id).toLong() != USER_ID ) {
                TUI.writeLCD("PIN: ")

                    TUI.writeLCD("Login Failed")


            } else {
                TUI.writeLCD("PIN: ")
                if (TUI.read(pass) != USER_PASS) {
                    TUI.writeLCD("Login Failed")
                    continue
                }

                open()
                TUI.writeLCD("Hello User")
                Time.sleep(1000)
                TUI.setCursor(0,1)
                TUI.writeLCD("User")
                TUI.setCursor(1,1)
                TUI.writeLCD("Opening Door...")
                Time.sleep(50)
                TUI.writeLCD("Door Open")
                Time.sleep(1000)
                TUI.writeLCD("Closing Door")
                Time.sleep(1000)
                TUI.writeLCD("Door Close")
            }

        }

    }


    private fun open() {
        TUI.setCursor(1, 2)
        TUI.writeLCD("Door Opened")

        while (!DoorMechanism.finished()) {
            DoorMechanism.open(15)
        }
        Time.sleep(1000)
        TUI.clearLCD()
    }

    private fun close() {
        TUI.setCursor(1, 1)
        TUI.writeLCD("Closing Door..")

        while (!DoorMechanism.finished()) {
            DoorMechanism.close(15)
        }
        Time.sleep(1000)
        TUI.clearLCD()
        Time.sleep(1000)
    }

}
fun main(){
    App.entry(USER_ID,4444)
}