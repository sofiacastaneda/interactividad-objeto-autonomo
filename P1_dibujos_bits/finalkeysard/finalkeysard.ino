void setup() {
  for (int i = 10; i < 14; i++) {

    pinMode(i, OUTPUT);
    digitalWrite(i, HIGH);
  }
  for (int i = 18; i < 22; i++) {

    pinMode(i, INPUT_PULLUP);
  }
  Serial.begin(115200);
}

void loop() {
  for (int f = 10; f < 14; f++) {
    digitalWrite(f, LOW);
    for (int c = 18; c < 22; c++) {
      Serial.print(digitalRead(c));
      Serial.print(",");
    }
    digitalWrite(f, HIGH);
  }
  Serial.println("");
  delay(10);
}