import processing.serial.*;

Serial myPort;  // Create object from Serial class
int sensorValue = 0; // Variable to hold the sensor value

String textos[] = {
  "no te veo", 
  "me escapo", 
  "sucker", 
  "casi! pero no me atraparáaaaaaaas",
  "too fast for ya'",
  "adiossssssss",
};

boolean mostrarIzquierda = true; // Variable para alternar el lado del mensaje
String currentText = textos[0]; // Mensaje inicial

void setup() {
  fullScreen(); // Pantalla completa
  textSize(32); // Tamaño del texto aumentado
  textAlign(CENTER, CENTER);
  
  println(Serial.list());
  String portName = Serial.list()[2]; // Ajusta esto a tu puerto
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  if (myPort.available() > 0) {
    String incomingString = myPort.readStringUntil('\n');
    if (incomingString != null) {
      incomingString = incomingString.trim();
      sensorValue = int(incomingString); // Suponiendo que solo hay un valor

      // Alternar el lado del mensaje cuando el valor del sensor cambia
      if (sensorValue != 0) { // Ajusta esta condición según tus necesidades
        int indexTexto = int(random(textos.length));
        currentText = textos[indexTexto];
        mostrarIzquierda = !mostrarIzquierda;
      }
    }
  }

  background(255); // Fondo blanco
  noStroke(); // Sin contornos
  int space = 50;

  // Rectángulos (blancos)
  fill(255);
  rect(space, space, (width - 3*space) / 2, height - 2*space); // Izquierdo
  rect(width/2 + space, space, (width - 3*space) / 2, height - 2*space); // Derecho

  // Texto
  fill(0); // Texto negro
  if (mostrarIzquierda) {
    text(currentText, space + ((width - 3*space) / 4), height / 2); // Izquierda
  } else {
    text(currentText, width/2 + space + ((width - 3*space) / 4), height / 2); // Derecha
  }
}
