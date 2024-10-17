int barX;      
int barY;       
int barWidth = 100;
int barHeight = 20; 
int barSpeed = 5;    

float ballX, ballY;   
float ballSpeedX = 3; 
float ballSpeedY = 3; 
float ballSize = 20;  

void setup() {
  size(400, 400);    

  
  barY = height - barHeight - 10; 
  barX = width / 2 - barWidth / 2; 
  
  
  ballX = width / 2;
  ballY = height / 2;
}

void draw() {
  background(0, 0, 255);  

  
  drawBar();          
  moveBar();         


  drawBall();        
  moveBall();        
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
  fill(0,0,0);  
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
  }

  
  if (ballY > height) {
    resetBall();
  }
}

void resetBall() {
 
  ballX = width / 2;
  ballY = height / 2;
  ballSpeedX = random(-3, 3);  
  ballSpeedY = 3;
}

//Wanted to write something here lol
// so hi :)
