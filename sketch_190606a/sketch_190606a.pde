void setup() {
  // Set the size of the window
  size(640, 360);
  background(50);
}

void draw() {
  stroke(255);
  line(pmouseX,pmouseY,mouseX,mouseY);
}