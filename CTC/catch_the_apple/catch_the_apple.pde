
import processing.sound.*;

SoundFile file;

String[] imFiles = {"fondo.png", "manzana.png", "newton1.png", "newton2.png"};
PImage[] im= new PImage[4];


int nX = 0, nY = 0;
float aY = 0, aX = 15;
float aV = 3, aA = 0.05;
int p = 0;
int win = 5;
boolean pCount = true;
long t = 0;

void setup(){
  size(600, 600);
  
  nY = height - 135;
  t = millis();
  
  for(int i = 0; i<4; i++){
    im[i] = loadImage(imFiles[i]);
  }
  
  file = new SoundFile(this,"apple.wav");
  
}
void draw(){
  background(0, 200, 0);
  image(im[0], 0, 0, width, height);
  
  aV = aV + aA;
  aY = aY + aV;
  if(aY > height){
    aY = 15;
    aX = int(random(width - 20));
    aV = 0;
    pCount = true;
  }
  
  fill(255);
  
  if(aY + 50 > nY && aY < nY + 135){
    if(aX + 40 > nX && aX < nX + 128 ){
      fill(255, 0, 0);
      if(pCount){ 
      p = p + 1;
      file.play();
      }
      pCount = false;
    }
  }
  
    
  image(im[1], aX, aY);
  
   if(pCount){
    image(im[2], nX, nY);
   }
   else{
     tint(255, 0, 0);
     image(im[3], nX, nY);
   }
  noTint();
  
  float timer = (millis() - t) / 1000;
  
  if(timer >= 30){
    text("GAME OVER", width/2, height/2);
    noLoop();
  }
  
  if(p==win){
    text("CONGRATULATIONS", width/2, height/2);
    noLoop();
  }
  
  
  fill(0);
  textSize(20);
  text("Punts: "+p, 3 * width / 4, 20);
  text("Temps: " + (30 - timer), 10, 20);
}

void keyPressed(){
  if(keyCode == RIGHT){
    nX = nX + 30;
    
    if(nX>width){
      nX=width-20;
    }
  }
  
  if(keyCode == LEFT){
    nX = nX - 20;
    
    if(nX<0){
      nX=0;
    }
  }
}
