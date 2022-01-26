int x, y;
int bW = 200, bH = 300;
int dH = 150, dE = 30;

void setup(){
 size(800,800); 
 x = width/2; y = height/2;
}

void draw(){
  //x = mouseX; y = mouseY;
  background(255, 100, 100);
  dibuixaRobot();
}

void dibuixaRobot(){
  fill(255);
  rect(x - bW/2, y - bH/2, bW, bH);
  dibuixaCap();
  dibuixaPeus();
  ellipse(x, y, 25, 25);
}

void dibuixaCap(){
  int yc = y - bH/2 - dH/2;
  fill(0);
  ellipse(x, yc, dH, dH); //Cap
  fill(255, 0, 0);
  ellipse(x - dH/4, yc - 10, dE, dE); // Ull Esq
  ellipse(x + dH/4, yc - 10, dE, dE); // Ull Dret
  triangle(x, yc, x- 10, yc + 30, x+ 10, yc + 30);
  noFill();
  stroke(255); strokeWeight(3);
  arc(x,yc,dH/1.2,dH/1.2,radians(45),radians(135)); 
}

void dibuixaPeus(){
  int yp = y + bH/2;
  triangle(x - bW/2,yp, x-bW/2-60, yp+60,x-bW/2,yp+60);
  triangle(x + bW/2,yp, x+bW/2+60, yp+60,x+bW/2,yp+60);
}
