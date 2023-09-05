int entrada = 0;
int salida = 0;
void setup() {
Serial.begin(115200); // recuerde que en el IDE hay que poner Serial.begin(115200), sin el 1;
 
}

void loop() {
  
  entrada = analogRead(A0); // leer el voltaje que está entrando por el GP26 / ADC 0
  salida = map(entrada,0,1024,20,1000); //convertir la variable de entrada, con rango posible de 0 a 1024, a un rango de 20 a 1000
  Serial.print(entrada); //  enviar el dato por el puerto serial 
  Serial.print(","); // una coma para separar los dos números
  Serial.println(salida); // el segundo dato
  tone(5,salida,200);// produce un tono en el pin 5 de 200 milisegundos. La frecuencia está determinada por la lectura del potenciómetro
  delay(200); 
}
