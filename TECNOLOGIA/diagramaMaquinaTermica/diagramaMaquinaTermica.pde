MaquinaTermica mt;
float sX=40, sY=35;

void setup(){
  
  size(1800, 900);
  mt = new MaquinaTermica(100, height-80);
  
  mt.setPunt(0, 3, 12);
  mt.setPunt(1, 6, 12);
  mt.setPunt(2, 7, 9);
  mt.setPunt(3, 13, 7);
  mt.setPunt(4, 13, 3);
  mt.setPunt(5, 9, 3);
  mt.setPunt(6, 5, 5);
  mt.setPunt(7, 3, 10);
  
}

void draw(){
  background(255);
  mt.display(sX, sY);
  mt.checkMouseDragged(sX,sY);
  println(mouseX, mouseY);
}


void mouseDragged(){
  mt.checkMouseDragged(sX,sY);
}
