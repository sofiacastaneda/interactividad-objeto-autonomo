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

  // Draw the rotated matrices
  boolean[][] tempMatriz = matriz;
  for (int x = 0; x < height; x += tmatriz * 2) {
    for (int y = 0; y < height; y += tmatriz * 2) {
      dibujarMatriz(tempMatriz, x, y);
      tempMatriz = rotateCW(tempMatriz);
      dibujarMatriz(tempMatriz, x + tmatriz, y);
      tempMatriz = rotateCW(tempMatriz);
      dibujarMatriz(tempMatriz, x + tmatriz, y + tmatriz);
      tempMatriz = rotateCW(tempMatriz);
      dibujarMatriz(tempMatriz, x, y + tmatriz);
      tempMatriz = rotateCW(tempMatriz);
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

void keyReleased() {
  matriz = rotateCW(matriz);
}

void dibujarMatriz(boolean[][] mat, int x, int y) {
  for (int i = 0; i < tmatriz; i++) {
    for (int j = 0; j < tmatriz; j++) {
      if (mat[i][j]) {
        noStroke();
        fill(109, 208, 247);
        rect((width / 2) + (x * 2 + i * 2), y * 2 + j * 2, 2, 2);
      }
    }
  }
}

static boolean[][] rotateCW(boolean[][] mat) {
  final int M = mat.length;
  final int N = mat[0].length;
  boolean[][] ret = new boolean[N][M];
  for (int r = 0; r < M; r++) {
    for (int c = 0; c < N; c++) {
      ret[c][M - 1 - r] = mat[r][c];
    }
  }
  return ret;
}
