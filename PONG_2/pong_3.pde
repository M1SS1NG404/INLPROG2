int barX;
int barY;
int barWidth = 100;
int barHeight = 20;
int barSpeed = 5;

float ballX, ballY;
float ballSpeedX = 3;
float ballSpeedY = 3;
float ballSize = 20;

int score = 0;
int highScore = 0;
boolean isPaused = false;
boolean isGameOver = false;

void setup() {
  size(400, 400);
  barY = height - barHeight - 10;
  barX = width / 2 - barWidth / 2;
  ballX = width / 2;
  ballY = height / 2;
}

void draw() {
  background(0, 0, 255);

  if (isGameOver) {
    displayGameOver();
  } else {
    drawBar();
    moveBar();
    drawBall();
    if (!isPaused) {
      moveBall();
    }
    displayScore();
  }
}

void displayScore() {
  fill(255);
  textSize(20);
  text("Score: " + score, 10, 30);

  if (isPaused) {
    textSize(40);
    text("PAUSED", width / 2 - 70, height / 2);
  }
}

void drawBar() {
  fill(0);
  rect(barX, barY, barWidth, barHeight);
}

void moveBar() {
  if (keyPressed) {
    if (keyCode == LEFT) {
      barX -= barSpeed;
    } else if (keyCode == RIGHT) {
      barX += barSpeed;
    }
  }

  if (barX < 0) {
    barX = 0;
  } else if (barX + barWidth > width) {
    barX = width - barWidth;
  }
}

void drawBall() {
  fill(0, 0, 0);
  ellipse(ballX, ballY, ballSize, ballSize);
}

void moveBall() {
  ballX += ballSpeedX;
  ballY += ballSpeedY;

  if (ballX < 0 || ballX > width) {
    ballSpeedX *= -1;
  }

  if (ballY < 0) {
    ballSpeedY *= -1;
  }

  if (ballY + ballSize / 2 >= barY && ballX > barX && ballX < barX + barWidth) {
    ballSpeedY *= -1;
    ballY = barY - ballSize / 2;
    score++;
    increaseBallSpeed(); // Call to increase ball speed when a point is scored
  }

  if (ballY > height) {
    isGameOver = true;
    if (score > highScore) {
      highScore = score;
    }
  }
}

void increaseBallSpeed() {
  ballSpeedX *= 1.1; // Increase the horizontal speed by 10%
  ballSpeedY *= 1.1; // Increase the vertical speed by 10%
}

void resetGame() {
  score = 0;
  isGameOver = false;
  ballX = width / 2;
  ballY = height / 2;
  ballSpeedX = random(-3, 3);
  ballSpeedY = 3;
}

void displayGameOver() {
  fill(255);
  textSize(40);
  text("GAME OVER", width / 2 - 100, height / 2 - 20);
  textSize(20);
  text("Score: " + score, width / 2 - 50, height / 2 + 10);
  text("High Score: " + highScore, width / 2 - 70, height / 2 + 40);
  text("Press any key to restart", width / 2 - 120, height / 2 + 70);
}

void keyPressed() {
  if (key == ENTER) {
    isPaused = !isPaused;
  } else if (isGameOver) {
    resetGame();
  }
}
