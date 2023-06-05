object Users {

    var userlist: HashMap<String, User> = HashMap()

    fun loadUser (): HashMap<String, User> {
        val read = FileAccess.read("USERS.txt")
        addID(read)
        return userlist
    }

    fun addID (read: HashSet<User>) {
        for (user in read) {
            userlist[user.id.toString()] = user
        }
    }
    fun getiD(id: Int): Int? {
        for (user in userlist) {
            if (user.value.id == id) return user.value.id
        }
        return null
    }
    fun getName(name: String): String? {
        for (user in userlist) {
            if (user.value.name == name) return user.value.name
        }
        return null
    }
    fun getPassword(password: Int?): Int? {
        for (user in userlist) {
            if (user.value.password == password) return user.value.password
        }
        return null
    }
    fun write(file: String, mapa: HashMap<String, User>) =
            FileAccess.write(file, mapa)

    class User {
        val id: Int
        val password: Int
        val name: String
        var mensagem: String?

        constructor(str: String) {
            val list = str.split(";")
            //println(list)
            id = list[0].toInt()
            password = list[1].toInt()
            name = list[2]
            mensagem = if (list.size == 5) {
                list[3]
            } else {
                " "
            }
            //println(password)
            //println(name)
            //println(mensagem)
        }

        constructor(id: Int, password: Int, name: String, mensagem: String = "") {
            this.id = id
            this.name = name
            this.password = password
            this.mensagem = mensagem
            //println(this.password)
        }
    }
}

fun main () {
    Users.User("0;1249;Alan Turing;Turing machine is ready;")
    Users.User("1;2072;George Boole;")
}