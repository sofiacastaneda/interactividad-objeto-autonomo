import processing.serial.*;

Serial myPort;  // Create object from Serial class
int[] sensorValues = new int[3]; // Array to hold sensor values

String[] sentences = {"1", "2", "3"}; // Initial sentences

void setup() {
  size(600, 300); // Set the size of the window
  background(255); // Set background color to white
  println(Serial.list());
  String portName = Serial.list()[2]; // Adjust this to your port
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  if (myPort.available() > 0) {
    String incomingString = myPort.readStringUntil('\n');
    if (incomingString != null) {
      incomingString = incomingString.trim();
      String[] stringValues = incomingString.split(",");
      if (stringValues.length == 3) {
        for (int i = 0; i < 3; i++) {
          int newVal = int(stringValues[i]);
          if (newVal != sensorValues[i]) {
            sentences[i] = newVal == 0 ? String.valueOf(i + 1) : String.valueOf((char)('A' + i));
            sensorValues[i] = newVal;
          }
        }
      }
    }
  }

  // Define text characteristics
  textSize(20);
  textAlign(CENTER, CENTER);
  background(255); // Redraw background to clear old text

  // Draw sentences
  fill(255, 0, 0); // Red color for sentence 1
  text(sentences[0], width / 2, height / 6);
  fill(0, 255, 0); // Green color for sentence 2
  text(sentences[1], width / 2, height / 2);
  fill(0, 0, 255); // Blue color for sentence 3
  text(sentences[2], width / 2, 5 * height / 6);
}
