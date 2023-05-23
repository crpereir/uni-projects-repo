import isel.leic.utils.Time


object App {

    private const val USER_ID = 1234
    private const val USER_PASS = 4321


    fun verifyUser(id: Long, pass: Long) {
        TUI.setCursor(1, 1)
        TUI.writeLCD("USER ID: ")
        if (TUI.read(id) != USER_ID) {
            close()
        }
        TUI.clearLCD()
        TUI.setCursor(1, 1)
        TUI.writeLCD("PASSWORD: ")
        if (TUI.read(pass) != USER_PASS) {
            close()
        } else {
            open()
        }
    }

    private fun open() {
        TUI.setCursor(1, 2)
        TUI.writeLCD("DOOR OPENED")

        while (!DoorMechanism.finished()) {
            DoorMechanism.open(15)
        }
        Time.sleep(1000)
        TUI.clearLCD()
    }

    private fun close() {
        TUI.setCursor(1, 1)
        TUI.writeLCD("DOOR CLOSE")

        while (!DoorMechanism.finished()) {
            DoorMechanism.close(15)
        }
        Time.sleep(1000)
        TUI.clearLCD()
        Time.sleep(1000)
    }

}