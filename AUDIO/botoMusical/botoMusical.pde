ButtonMusic b1;

void setup(){
  size(800,800);
  
  b1 = new ButtonMusic(width/2, height/2, 200, "saxo.wav", 
               this, color(255, 0, 0), color(100,100, 100)); ;
}

void draw(){
  background(255);
  b1.display();
}

void mousePressed(){
  if(b1.mouseOver()){
    b1.play();
  }
}
