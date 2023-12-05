import java.util.HashMap;
import java.util.ArrayList;
import processing.serial.*;

Serial myPort;  // Create object from Serial class
int[] sensorValues = new int[3]; // Array to hold sensor values

String[] textosArriba = {
  "pero en verdad amo esta lluvia,", 
  "dejese llevar por lo menos en forma inmediata—", 
  "cada vez me es penoso rememorarlo", 
  "si no hay amor es lo segundo",
  "tal vez yo no me produce ese antiguo fervor",
  "rece y pedi que no me olvide",
  "aunque la lluvia cae sin cesar,", 
  "deje que sus pensamientos fluyan libremente—",
  "recordar esos momentos siempre trae nostalgia",
  "el amor, si no es verdadero, se convierte en rutina",
  "a veces, el fervor de antaño se desvanece",
  "recuerdo y espero no ser olvidado",
  "la lluvia trae recuerdos de tiempos pasados,", 
  "siga el camino que dicta su corazón—", 
  "revivir el pasado puede ser un ejercicio doloroso", 
  "el amor perdura si es genuino",
  "es posible que nuevas pasiones despierten",
  "anhelo y ruego por el recuerdo eterno",
  "bajo el manto de la lluvia, reflexiono,", 
  "fluya con la corriente de la existencia—",
  "cada recuerdo es un eco de días idos", 
  "el amor es la respuesta a muchas preguntas",
  "quizás lo que una vez fue, puede ser de nuevo",
  "rezo para que la memoria perdure en el tiempo"
};

String[] textosAbajo = {
  "esta lluvia incansable tiene su encanto,", 
  "permitase ser llevado por la corriente de la vida—",
  "pensar en el pasado a menudo resulta doloroso",
  "donde falta amor, queda el consuelo",
  "es posible que la pasión de antes ya no resurja",
  "oro y deseo mantener viva la memoria",
  "la lluvia siempre trae una lección oculta,", 
  "deje que la vida fluya naturalmente—",
  "el recuerdo, aunque dulce, a veces duele",
  "en la ausencia de amor, reside la esperanza",
  "la pasión de ayer puede reavivarse hoy",
  "mis plegarias son por un recuerdo imperecedero"
};

String[] standby = {
  "esperando", 
  "con paciencia", 
  "todo se revelará a su tiempo", 
  "mantenga la atención", 
  "cuidado con el peligro", 
  "en pausa", 
  "la paciencia es una virtud", 
  "la revelación llegará",
  "estar alerta es clave", 
  "el peligro acecha en la sombra", 
  "a la espera de un signo", 
  "la paciencia puede ser recompensada", 
  "la verdad se desvelará",
  "vigilancia constante es necesaria", 
  "el riesgo está siempre presente"
};



String sourceText;
HashMap<String, ArrayList<String>> markovChain = new HashMap<String, ArrayList<String>>();
String[] sentences = new String[3]; // Array to hold generated sentences

void setup() {
    fullScreen(); // Set the size of the window
  background(255); // Set background color to white
  buildSourceText();
  buildMarkovChain();
  for (int i = 0; i < sentences.length; i++) {
    sentences[i] = generateMarkovSentence(); // Initialize sentences
  }
  println(Serial.list());
  String portName = Serial.list()[2]; // Adjust this to your port
  myPort = new Serial(this, portName, 9600);
}

void buildSourceText() {
  sourceText = join(textosArriba, " ") + " " + join(textosAbajo, " ") + " " + join(standby, " ");
}

String[] lastSentences = new String[3]; 

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
            sensorValues[i] = newVal;
            String newSentence;
            do {
              newSentence = generateMarkovSentence();
            } while (newSentence.equals(lastSentences[0]) || newSentence.equals(lastSentences[1]) || newSentence.equals(lastSentences[2]));
            sentences[i] = newSentence;
            lastSentences[i] = newSentence; // Update the last sentence for this sensor
          }
        }
      }
    }
  }

  // Define text characteristics
  textSize(60);
  textAlign(CENTER, CENTER);
  background(255); // Redraw background to clear old text

  // Draw sentences
  fill(0, 0, 0); // Red color for sentence 1
  text(sentences[0], width / 2, height / 6);
  fill(0, 0, 0); // Green color for sentence 2
  text(sentences[1], width / 2, height / 2);
  fill(0, 0, 0); // Blue color for sentence 3
  text(sentences[2], width / 2, 5 * height / 6);
}


void buildMarkovChain() {
  String[] words = sourceText.split("\\s+");
  for (int i = 0; i < words.length - 1; i++) {
    String key = words[i].replaceAll("[^a-zA-Z0-9']", ""); // Remove punctuation
    String value = words[i + 1];

    if (!markovChain.containsKey(key)) {
      markovChain.put(key, new ArrayList<String>());
    }
    markovChain.get(key).add(value);
  }
}

String generateMarkovSentence() {
  String[] words = sourceText.split("\\s+");
  String currentWord = words[(int)random(words.length)];
  String generatedText = currentWord;
  int wordCount = 0;
  int maxWords = 6; // Reduced limit for shorter sentences

  while (wordCount < maxWords) {
    ArrayList<String> nextWords = markovChain.get(currentWord.replaceAll("[^a-zA-Z0-9']", ""));
    if (nextWords != null && nextWords.size() > 0) {
      String nextWord;

      // Choose next word and limit the frequency of "Pero"
      do {
        nextWord = nextWords.get((int)random(nextWords.size()));
      } while (nextWord.equals("Pero") && random(1) < 0.5); // 50% chance to skip "Pero"

      currentWord = nextWord;
      generatedText += " " + currentWord;
      wordCount++;

      // End the sentence if it reaches punctuation
      if (currentWord.endsWith(".")) {
        break;
      }
    } else {
      break;
    }
  }
  return generatedText;
}
