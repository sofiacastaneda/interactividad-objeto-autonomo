import processing.serial.*;

Serial myPort;  // Create object from Serial class
String serialData;  // Data received from the serial port
boolean matriz[][] = new boolean[4][4];
int tmatriz = 4;
float tcelda;

void setup() {
  size(800, 400);
  tcelda = height / tmatriz;
  println(Serial.list());
  String portName = Serial.list()[2]; // Select the correct port here
  myPort = new Serial(this, portName, 115200);
  myPort.bufferUntil('\n'); // Set '\n' as the end marker for each data packet
}

void draw() {
  background(255, 105, 180);
  for (int i = 0; i < tmatriz; i++) {
    for (int j = 0; j < tmatriz; j++) {
      if (matriz[i][j]) {
        fill(255, 105, 180); 
      } else {
        fill(109, 208, 247);
      }
      rect(i * tcelda, j * tcelda, tcelda, tcelda);
    }
  }
}

void serialEvent(Serial p) {
  serialData = p.readStringUntil('\n');
  if (serialData != null) {
    serialData = trim(serialData);
    updateMatriz(serialData);
  }
}

void updateMatriz(String data) {
  String[] sensorStates = split(data, ",");
  int index = 0;
  for (int i = 0; i < tmatriz; i++) {
    for (int j = 0; j < tmatriz; j++) {
      if (index < sensorStates.length) {
        matriz[j][i] = sensorStates[index].equals("1");
        index++;
      }
    }
  }
}
