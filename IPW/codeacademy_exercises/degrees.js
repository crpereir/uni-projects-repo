
//this line is the forecast today
let kelvin = 0;

//convert forecast into celsius
let celsius = kelvin - 273;

//calculate fahrenheit
let fahrenheit = celsius * (9/5) + 32;

//convert using floor function
fahrenheit = Math.floor(fahrenheit);

console.log('The temperature is ' + fahrenheit + ' degrees Fahrenheit.')
