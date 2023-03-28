

import isel.leic.utils.Time

fun main (){
    HAL.init()
    LCD.init()
    LCD.cursor(0,0)

    LCD.write("benfica")
    Time.sleep(5000)
    LCD.clear()
    while (true){ // so parace none quando meto o 0 no bit dval
        val k= KBD.waitKey(10000)
        if (k!= KBD.NONE) LCD.write(k)
    }
}