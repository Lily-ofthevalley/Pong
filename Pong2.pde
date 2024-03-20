

//paddle position
int left_y = 200;
int right_y = 200;

//scores
int left_score = 0;
int right_score = 0;
boolean scored_point = false;

//game on or off
boolean game_on = false;
boolean chaos_on = false;

//start screen visible or not
boolean start_screen = true;

//winner screen
boolean left_win_screen = false;
boolean right_win_screen = false;

Ball2[] bal;
Ball ball;

void setup() {
  size(700, 500);
  keyPressed();
  bal = new Ball2[8];
  for (int i = 0; i < bal.length; i++) {
    bal[i] = new Ball2();
  }
  ball = new Ball();
}

void draw() {
  background(0, 0, 0);

  //start screen on or off
  if (start_screen == true) {

    //text on screen
    textSize(175);
    text("PONG", 130, 250);
    textSize(50);
    text("[Press SPACE to start]", 135, 380);
    textSize(15);
    text("[Press C for CHAOS]", 290, 420);
  }

  //left player win screen
  if (left_win_screen == true) {
    textSize(75);
    text("Left player won!!!", 80, 200);
    textSize(25);
    text("[Press SPACE to continue]", 225, 380);
  }

  //right player win screen
  if (right_win_screen == true) {
    textSize(75);
    text("Right player won!!!", 65, 200);
    textSize(25);
    text("[Press SPACE to continue]", 225, 380);
  }

  //game screen on or off
  if (game_on == true) {

    ball.display();

    ball.update();

    paddleBorderCheck();

    ball.score();

    gameEnd();

    //text on screen
    textSize(50);
    text(left_score, 50, 50);
    text(right_score, 630, 50);
    textSize(15);
    text("[Press R to reset scores]", 20, 480);

    //paddles
    rect(50, left_y, 20, 80);
    rect(630, right_y, 20, 80);

    //screen split line
    stroke(255);
    strokeWeight(10);
    line(350, 0, 350, 500);
  }

  //game chaos on or off
  if (chaos_on == true) {

    for (int i = 0; i < bal.length; i++) {
      bal[i].display();

      bal[i].update();

      paddleBorderCheck();

      bal[i].score();

      gameEnd();
    }

    //text on screen
    textSize(50);
    text(left_score, 50, 50);
    text(right_score, 630, 50);
    textSize(15);
    text("[Press R to reset scores]", 20, 480);

    //paddles
    rect(50, left_y, 20, 80);
    rect(630, right_y, 20, 80);

    //screen split line
    stroke(255);
    strokeWeight(10);
    line(350, 0, 350, 500);
  }
}

void keyPressed() {
  if (keyCode == 87) {
    left_y = left_y - 6;
  } else if (keyCode == 83) {
    left_y = left_y + 6;
  } else if (keyCode == 38) {
    right_y = right_y - 6;
  } else if (keyCode == 40) {
    right_y = right_y + 6;
  } else if (keyCode == 82) {
    right_score = 0;
    left_score = 0;
  } else if (keyCode == 32) {
    if (start_screen == true) {
      start_screen = false;
      game_on = true;
    } else if (left_win_screen == true || right_win_screen == true) {
      left_win_screen = false;
      right_win_screen = false;
      start_screen = true;
    }
  } else if (keyCode == 67) {
    if (start_screen == true) {
      start_screen = false;
      chaos_on = true;
    }
  }
}

void paddleBorderCheck() {
  if (left_y < 0) {
    left_y = 0;
  } else if (left_y > 420) {
    left_y = 420;
  } else if (right_y < 0) {
    right_y = 0;
  } else if (right_y > 420) {
    right_y = 420;
  }
}

void gameEnd() {
  if (left_score == 10) {
    game_on = false;
    right_score = 0;
    left_score = 0;
    left_win_screen = true;
    chaos_on = false;
  } else if (right_score == 10) {
    game_on = false;
    right_score = 0;
    left_score = 0;
    right_win_screen = true;
    chaos_on = false;
  }
}
