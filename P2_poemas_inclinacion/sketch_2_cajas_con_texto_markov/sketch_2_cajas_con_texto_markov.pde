import java.util.HashMap;
import java.util.ArrayList;

String sourceText = "This is an example text to demonstrate a Markov chain in Processing. Markov chains are useful for text generation. They can create interesting patterns of words. However, for more coherent sentences, a larger corpus of text is beneficial.";
HashMap<String, ArrayList<String>> markovChain = new HashMap<String, ArrayList<String>>();

String sentence1 = "This is the first sentence.";
String sentence2 = "Here goes the second sentence.";
String sentence3 = "And this is the third sentence.";

void setup() {
  size(600, 300); // Set the size of the window
  background(255); // Set background color to white
  buildMarkovChain();
}

void draw() {
  // Define text characteristics
  textSize(20);
  textAlign(CENTER, CENTER);
  background(255); // Redraw background to clear old text

  // Draw sentences
  fill(255, 0, 0); // Red color for sentence 1
  text(sentence1, width / 2, height / 6);
  fill(0, 255, 0); // Green color for sentence 2
  text(sentence2, width / 2, height / 2);
  fill(0, 0, 255); // Blue color for sentence 3
  text(sentence3, width / 2, 5 * height / 6);
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
  String currentWord = words[0];
  String generatedText = currentWord;
  int wordCount = 0;
  int maxWords = 10; // Limit the number of words

  while (wordCount < maxWords) {
    ArrayList<String> nextWords = markovChain.get(currentWord.replaceAll("[^a-zA-Z0-9']", ""));
    if (nextWords != null && nextWords.size() > 0) {
      currentWord = nextWords.get((int)random(nextWords.size()));
      generatedText += " " + currentWord;
      wordCount++;

      if (currentWord.endsWith(".")) {
        break;
      }
    } else {
      break;
    }
  }
  return generatedText;
}

void keyReleased() {
  if (key == 'A' || key == 'a') {
    sentence1 = generateMarkovSentence();
  } else if (key == 'B' || key == 'b') {
    sentence2 = generateMarkovSentence();
  } else if (key == 'C' || key == 'c') {
    sentence3 = generateMarkovSentence();
  }
  redraw(); // Redraw the window with updated sentences
}
