void setup() {
  size(600, 300); // Set the size of the window
  background(255); // Set background color to white
}

void draw() {
  // Define text characteristics
  textSize(20);
  textAlign(CENTER, CENTER);

  // Draw the first sentence in the top section
  fill(255, 0, 0); // Red color
  text("This is the first sentence.", width / 2, height / 6);

  // Draw the second sentence in the middle section
  fill(0, 255, 0); // Green color
  text("Here goes the second sentence.", width / 2, height / 2);

  // Draw the third sentence in the bottom section
  fill(0, 0, 255); // Blue color
  text("And this is the third sentence.", width / 2, 5 * height / 6);

  noLoop(); // Stop draw loop since static display is intended
}
