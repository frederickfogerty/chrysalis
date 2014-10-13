Clock c1;

void setup() {

  size(200, 400);

  stroke(255);

  smooth();

  c1 = new Clock(100,100);

}




  void draw()

{

  background(0);



  c1.update(mouseX, mouseY);

  c1.display();
}



  class Clock

{

  int ex, ey;

  float angle = 0.0;



  Clock(int x, int y,) {

    ex = x;

    ey = y;

 }



  void update(int mx, int my) {

    angle = atan2(my-ey, mx-ex);

  }



  void display() {

    pushMatrix();

    translate(ex, ey);

    fill(80);

    ellipse(0, 0, 160, 160);

    rotate(angle);

    fill(255);

    rect(100, 100, 1, 72, 2);

    popMatrix();

  }

}