Eye e1, e2, e3, e4, e5, e6, e7, e8;



void setup()

{

  size(800, 400);

  smooth();

  noStroke();

  e1 = new Eye( 100, 100, 160);
  e2 = new Eye( 100, 300, 160);
  e3 = new Eye( 300, 100, 160);
  e4 = new Eye( 300, 300, 160);
  e5 = new Eye( 500, 100, 160);
  e6 = new Eye( 500, 300, 160);
  e7 = new Eye( 700, 100, 160);
  e8 = new Eye( 700, 300, 160);
}



void draw()

{

  background(0);



  e1.update(mouseX, mouseY);
  e2.update(mouseX, mouseY);
  e3.update(mouseX, mouseY);
  e4.update(mouseX, mouseY);
  e5.update(mouseX, mouseY);
  e6.update(mouseX, mouseY);
  e7.update(mouseX, mouseY);
  e8.update(mouseX, mouseY);

  e1.display();
  e2.display();
  e3.display();
  e4.display();
  e5.display();
  e6.display();
  e7.display();
  e8.display();
}



class Eye

{

  int ex, ey;

  int size;

  float angle = 0.0;
  float angle2 = 0.0;



  Eye(int x, int y, int s) {

    ex = x;

    ey = y;

    size = s;

 }



  void update(int mx, int my) {

    angle = atan2(my-ey, mx-ex) - HALF_PI;
    angle2 = atan2(my-ey, mx-ex)
  }



  void display() {

    pushMatrix();

    translate(ex, ey);
    fill(80);
    ellipse(0, 0, size, size);

    rotate(angle);
    fill(255);
    rect(0, 0, 1, size/2);

    rotate(angle2);
    fill(255);
    rect(0, 0, 3, size/2 - 10, 15);

    popMatrix();

  }

}