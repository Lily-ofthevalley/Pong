class Ball {
  //variabelen
  float x;
  float y;
  float dx;
  float dy;
  int diameter;

  //constructor
  Ball() {
    x = 340;
    y = 240;
    diameter = 20;
    dx = 3;
    dy = 3;
  }

  //methodes
  void display() {
    fill(255, 255, 255);
    ellipse(x, y, diameter, diameter);
  }

  void update() {
    //Movement and top bounce
    x = x + dx;
    y = y + dy;
    if (y > 480 || y < 10) {
      dy = dy * -1;
      println("kaas");
    }
    //paddle bounce
    if (x < 70) {
      if (y > left_y) {
        if (y < (left_y + 80)) {
          dx = dx * -1;
        }
      }
    }
    if (x > 610) {
      if (y > right_y) {
        if (y < (right_y + 80)) {
          dx = dx * -1;
        }
      }
    }
  }

  void score() {
    if (x > 680) {
            scored_point = true;
      left_score = left_score + 1;
      x = 340;
      y = 240;
    }
    if (x < 0) {
            scored_point = true;
      right_score = right_score + 1;
      x = 340;
      y = 240;
    }
  }
}
