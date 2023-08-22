boolean boton = false; // una variable booleana guarda únicamente dos valores posibles "true" (cierto) o "false" (falso).
int brillo = 0;

void setup() {
 pinMode(16, INPUT_PULLUP);
Serial1.begin(115200); // recuerde que en el IDE hay que poner Serial.begin(115200), sin el 1;
 
}

void loop() {
  boton = digitalRead(16); // lea si el GPIO 14 está o no conectado a GND y guarde el resultado en una variable

  brillo = brillo + 1; // incrementar el valor de la variable 'brillo'
  if(brillo > 255){ // si el valor de la variable es mayor que 255 ...
      brillo=0; // hacer que el valor de la variable vuelva a ser 0
  }

  if(boton==1){ // si el valor de la variable es 1 ..
    analogWrite(17,brillo); // prenda el LED rojo 
    analogWrite(18,LOW); // y apague el azul
  }else{       // de lo contrario (si el valor de la variable es 0) ...
     analogWrite(17,LOW); // apague el LED rojo
     analogWrite(18,brillo);  // y prenda el azul
  }
  
   Serial.print("Estado botón:");
   Serial.print(boton);
   Serial.print("///"); // (opcional) envíe el valor de la variable por el puerto serial
   Serial.print("Cantidad de brillo:");
   Serial.println(brillo); 

  delay(10); 
}
