
void setup() {
  Serial.begin(9600); // iniciar comunicación serial
}


void loop() {
  int sensorValue = analogRead(A0); // leer el voltaje en A0
  Serial.print(sensorValue); // enviar el dato por serial
  Serial.print(",");
  delay(10); // pausa breve para que el dato se envíe correctamente
}