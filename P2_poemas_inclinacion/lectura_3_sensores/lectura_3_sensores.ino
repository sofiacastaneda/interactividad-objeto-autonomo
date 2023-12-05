const int sensorPin1 = 18;
const int sensorPin3 = 20;
const int sensorPin4 = 16;

bool estadoAnterior1 = false;
bool estadoAnterior3 = false;
bool estadoAnterior4 = false;

void setup() {
  pinMode(sensorPin1, INPUT);
  pinMode(sensorPin3, INPUT);
  pinMode(sensorPin4, INPUT);
  Serial.begin(9600);
}

void loop() {
  bool sensorValue1 = digitalRead(sensorPin1);
  bool sensorValue3 = digitalRead(sensorPin3);
  bool sensorValue4 = digitalRead(sensorPin4);

  if (sensorValue1 != estadoAnterior1) {
    Serial.print("Sensor 1: ");
    Serial.println(sensorValue1);
  }
  if (sensorValue3 != estadoAnterior3) {
    Serial.print("Sensor 3: ");
    Serial.println(sensorValue3);
  }
  if (sensorValue4 != estadoAnterior4) {
    Serial.print("Sensor 4: ");
    Serial.println(sensorValue4);
  }

  delay(100);

  estadoAnterior1 = sensorValue1;
  estadoAnterior3 = sensorValue3;
  estadoAnterior4 = sensorValue4;
}
