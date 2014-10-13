// All Examples Written by Casey Reas and Ben Fry

// unless otherwise stated.

void setup() {

  size(200, 400);

  stroke(255);

  smooth();

}

void draw() {

  background(0);


  // Angles for sin() and cos() start at 3 o'clock;

  // subtract HALF_PI to make them start at the top

  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;

  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;

  float h = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI;



  fill(80);

  noStroke();

  ellipse(100, 100, 160, 160);



  stroke(255);

  strokeWeight(1);

  line(100, 100, cos(s) * 72 + 100, sin(s) * 72 + 100);

  strokeWeight(2);

  line(100, 100, cos(m) * 60 + 100, sin(m) * 60 + 100);

  strokeWeight(4);

  line(100, 100, cos(h) * 50 + 100, sin(h) * 50 + 100);


  noStroke();

  ellipse(100, 300, 160, 160);

  stroke(255);

  strokeWeight(1);

  line(100, 300, cos(s) * 72 + 100, sin(s) * 72 + 300);

  strokeWeight(2);

  line(100, 300, cos(m) * 60 + 100, sin(m) * 60 + 300);

  strokeWeight(4);

  line(100, 300, cos(h) * 50 + 100, sin(h) * 50 + 300);

}

class Clock

{

  int ex, ey;

  float angle = 0.0;



  Eye(int x, int y,) {

    ex = x;

    ey = y;

    size = s;

 }