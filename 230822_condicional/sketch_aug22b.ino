boolean boton = false; // una variable booleana guarda únicamente dos valores posibles "true" (cierto) o "false" (falso).

void setup() {
 pinMode(16, INPUT_PULLUP);
Serial.begin(115200); // recuerde que en el IDE hay que poner Serial.begin(115200), sin el 1;
 
}

void loop() {
  boton = digitalRead(16); // lea si el GPIO 14 está o no conectado a GND y guarde el resultado en una variable
  Serial.println(boton); // (opcional) envíe el valor de la variable por el puerto serial
  
  if(boton==1){ // si el valor de la variable es 1 ..
    digitalWrite(17,HIGH); // prenda el LED rojo 
    digitalWrite(18,LOW); // y apague el azul
  }else{       // de lo contrario (si el valor de la variable es 0) ...
     digitalWrite(17,LOW); // apague el LED rojo
    digitalWrite(18,HIGH);  // y prenda el azul
  }
  
  delay(100); 
}
