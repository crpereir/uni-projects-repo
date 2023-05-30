import java.io.PrintWriter


object Users {
    var userlist: ArrayList<User?> = ArrayList()
    fun loadUsers() {
        // função do FileAccess probably que faz load dos users FileAccess.load()
    }

    fun getiD(id: Int): Int? {
        for (user in userlist) {
            if (user!!.iD == id) return user.iD
        }
        return null
    }

    fun searchUser(id: Int): String? {
        for (user in userlist) {
            if (user!!.iD == id) return user.name
        }
        return null
    }

    fun getUser(id: Int?): User? {
        for (user in userlist) {
            if (user != null) {
                if (user.getiD() == id) return user
            }
        }
        return null
    }

    fun getName(name: String): String? {
        for (user in userlist) {
            if (user!!.name == name) return user.name
        }
        return null
    }

    fun getPassword(password: Int?): Int? {
        for (user in userlist) {
            if (user!!.password == password) return user.password
        }
        return null
    }


    class User {
        private val identification = 0
        private val pass = 0
        private val user: String? = null
        private val timespent = 0
        var iD: Int
            private set
        var password: Int
            private set
        var name: String
            private set
        var time: Int
            private set

        constructor(iD: Int, password: Int, name: String, time: Int) {
            this.password = password
            this.name = name
            this.iD = iD
            this.time = time
        }

        fun getiD(): Int = identification
        fun getName(): String? = user
        fun getPass(): Int = pass
        fun getTime(): Int = timespent

        fun addTime(time: Long) {
            this.time += time.toInt()
        }

        fun saveParameters(pw: PrintWriter) =
            pw.print("$iD; $name; $time")

    }


}