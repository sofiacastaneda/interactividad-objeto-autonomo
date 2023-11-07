const int sensorPin = 2; 

void setup() {
  pinMode(sensorPin, INPUT);
  Serial.begin(9600);
}

void loop() {
  int sensorValue = digitalRead(sensorPin);

  if (sensorValue == HIGH) {
    Serial.println("El sensor está en posición horizontal.");
  } else {
    Serial.println("El sensor está inclinado.");
  }

  delay(100); 
    }