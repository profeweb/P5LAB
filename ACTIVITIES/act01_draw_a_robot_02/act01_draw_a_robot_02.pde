float x, y;                              // Reference
float shoulderW = 200, shoulderH = 60;   // Shoulder
float stomachW = 160, stomachH = 100;    // Stomach
float armW = 20, armH = 160;             // Arms
float legW = 30, legH = 90;              // Legs
float headR = 100;                       // Head
float eyeR = 30;                         // Eyes
float footR = legW;                      // Feet
float handR = armW;                      // Hands

color colFH = color(20);            // Color Feet & Hands
color colAL = color(220);           // Color Arms & Legs
color colSS = color(200, 100, 100); // Color Shoulder & Stomach

void setup(){
 size(800,800);
 rectMode(CENTER);
 x = width/2;
 y = height/2 - 100;
}

void draw(){
  background(255);
  drawDaisy();
}

void drawDaisy(){
  drawBody();
  drawHead();
  drawArms();
  drawLegs();
}

void drawBody(){
 fill(colSS);
 rect(x, y, shoulderW, shoulderH, 15, 15, 0, 0);
 rect(x, y + shoulderH/2 + stomachH/2 , stomachW, stomachH);
}

void drawArms(){
  fill(colFH);
  ellipse(x - shoulderW/2 + armW/2, y + shoulderH/2 + armH, handR, handR);
  ellipse(x + shoulderW/2 - armW/2, y + shoulderH/2 + armH, handR, handR);
  fill(colAL);
  rect(x - shoulderW/2 + armW/2, y + shoulderH/2 + armH/2, armW, armH);
  rect(x + shoulderW/2 - armW/2, y + shoulderH/2 + armH/2, armW, armH);
}

void drawLegs(){
  fill(colFH);
  ellipse(x - stomachW/2 + legW/2, y + shoulderH/2 + stomachH + legH, footR, footR);
  ellipse(x + stomachW/2 - legW/2, y + shoulderH/2 + stomachH + legH, footR, footR);
  fill(colAL);
  rect(x - stomachW/2 + legW/2, y + shoulderH/2 + stomachH + legH/2, legW, legH);
  rect(x + stomachW/2 - legW/2, y + shoulderH/2 + stomachH + legH/2, legW, legH);
}

void drawHead(){
 ellipse(x, y- shoulderH/2 - headR/2, headR, headR);
 ellipse(x - headR/4, y - shoulderH/2 - headR/2 - eyeR/2, eyeR, eyeR);
 ellipse(x + headR/4, y - shoulderH/2 - headR/2 - eyeR/2, eyeR, eyeR);
 ellipse(x - headR/4, y - shoulderH/2 - headR/2 - eyeR/2, eyeR/2, eyeR/2);
 ellipse(x + headR/4, y - shoulderH/2 - headR/2 - eyeR/2, eyeR/2, eyeR/2);
 arc(x, y - shoulderH/2 - headR/3, headR/2, headR/2, PI/4, 3*PI/4);
 triangle(x, y - shoulderH/2 - headR/2, 
          x + headR/5, y - shoulderH/2 - headR/4, 
          x - headR/5, y - shoulderH/2 - headR/4);
 line(x, y - shoulderH/2 - headR, x + headR/2 , y - shoulderH/2 - headR*1.5);
 ellipse(x + headR/2 , y - shoulderH/2 - headR*1.5, 10, 10);
}


void mousePressed(){
  
  shoulderW = random(180, 250);
  shoulderH = random(40, 80);
  stomachW  = random(60, shoulderW/1.5); 
  stomachH  = random(80, 200);
  armW = random((shoulderW - stomachW)/3, (shoulderW - stomachW)/2);
  armH = random(100, 200);
  legW = random(30, stomachW/2);
  legH = random(60, 120);
  headR = random(80, 150);
  eyeR = random(10, headR/3);                    
  footR = legW;                     
  handR = armW; 
}
