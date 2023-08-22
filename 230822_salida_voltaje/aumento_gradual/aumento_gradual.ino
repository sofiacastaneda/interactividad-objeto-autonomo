int brillo = 0;
void setup() {
 pinMode(17, OUTPUT);
Serial.begin(115200); // recuerde que en el IDE hay que poner Serial.begin(115200), sin el 1;
 
}

void loop() {
  brillo = brillo + 1; // incrementar el valor de la variable 'brillo'
  analogWrite(17,brillo); // usar la variable 'brillo' para determinar el voltaje del GPIO 17
  
  Serial.println(brillo); //  (opcional) enviar el dato por el puerto serial para verificar cómo cambia
    
    if(brillo > 255){ // si el valor de la variable es mayor que 255 ...
      brillo=0; // hacer que el valor de la variable vuelva a ser 0
    }
  
  delay(10); 
}
