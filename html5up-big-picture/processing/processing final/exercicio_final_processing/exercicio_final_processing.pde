
int n = 10;
// Ponto central
int cx, cy;
// Stroke weight
int sw;
// Cor base
color cbase;
// Hue
float h;

void setup()
{
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  background(0);
  cbase = color(300, 100, 100);
  h = hue(cbase);
  cx = width/2;
  cy = height/2;
  sw = 5;
}

void draw()
{
}

void mousePressed()
{
  println("Number of axis = " + n);
  println("Sroke weight = " + sw);
  println("Hue = " + h);
}

void mouseReleased()
{
  fill(360); 
  stroke(360); 
  strokeWeight(1);
  ellipse(cx, cy, 2, 2);
}

void mouseClicked()
{
  cx = mouseX;
  cy = mouseY;
  fill(0); 
  stroke(0); 
  strokeWeight(1);
  ellipse(cx, cy, 2, 2);
}

void mouseWheel(MouseEvent event)
{
  sw = sw + event.getCount();
  sw = max(1, sw);
  println("Stroke Weight = " + (int) sw);
}

void keyPressed()
{
  if (key == 'z') saveFrame("simetria.png");
  if (key == ' ') background(360);
  if (key == 'w') {
    n = n + 1;
    println("Number of axis = " + n);
  }
  if (key == 's') {
    n = max(1,--n);
    println("Number of axis = " + n);
  }
  if (keyCode == UP) {
    h = hue(cbase) + 5;
    if (h > 360) h = h - 360;
    cbase = color(h, saturation(cbase), brightness(cbase));
    println("Hue = " + (int) h);
  }
  if (keyCode == DOWN) {
    h = hue(cbase) - 5;
    if (h < 0) h = 360 + h;
    cbase = color(h, saturation(cbase), brightness(cbase));
    println("Hue = " + (int) h);
  }
}

void mouseDragged()
{
  float x = mouseX - cx;
  float y = mouseY - cy;
  float px = pmouseX - cx;
  float py = pmouseY - cy;

  pushMatrix();
  translate(cx, cy);
  for (int i=0; i<n; i++) {
    myLine(x, y, px, py);
    rotate(2*PI/n);
  }
  popMatrix();
}

void myLine(float x, float y, float px, float py)
{
  if (mouseButton == LEFT) {
    stroke(cbase);
    strokeWeight(sw);
    line(x, y, px, py);
  } else {
    stroke(360);
    strokeWeight(sw*4);
    line(x, y, px, py);
  }
}
