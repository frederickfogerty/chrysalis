void setup()

{

  size(1850, 900);
  background(0);
  smooth();
  noStroke();
  drawCircles();
}


void update(int mx, int my) {

    angle = atan2(my-ey, mx-ex) - HALF_PI;
    angle2 = atan2(my-ey, mx-ex)
  }

void drawCircles()
{   float angle = 0.0;
    float angle2 = 0.0;

    int q = 1;

    int x = y = 100;
    for (int i=1; i <= 128; i++) {

        //fill(80);
        //ellipse(x, y, 80, 80);

        pushMatrix();

        translate(x, y);
        fill(80);
        ellipse(0, 0, 80, 80);

        rotate(angle);
        fill(255);
        rect(0, 0, 1, 80/2);

        rotate(angle2);
        fill(255);
        rect(0, 0, 3, 80/2 - 10, 15);

        i.update(mouseX, mouseY);

        popMatrix();

       if (y == 800 && ( (x === 400) || (x===850) || (x===1300) ) ) {
            y = 100;
            x = x+150;
        } else if (y == 800) {
            y = 100;
            x = x+100;
        } else {
            y = y+100;
        }
    }

}







