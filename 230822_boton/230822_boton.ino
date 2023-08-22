boolean boton = false; // una variable booleana guarda únicamente dos valores posibles "true" (cierto) o "false" (falso).

void setup() {
 pinMode(16, INPUT_PULLUP);
Serial.begin(115200); // recuerde que en el IDE hay que poner Serial.begin(115200), sin el 1;
 
}

void loop() {
  boton = digitalRead(16); // lea si el GPIO 14 está o no conectado a GND y guarde el resultado en una variable
 Serial.println(boton); // envíe el valor de la variable por el puerto serial
  delay(10); 
}