MaquinaTermica mt;
float sX=40, sY=35;
Slider slX, slY, sR;

void setup(){
  size(1800, 900);
  mt = new MaquinaTermica(100, height-80);
  
  mt.setPunt(3, 12, CICLE.ANADA);
  mt.setPunt(6, 12, CICLE.ANADA);
  mt.setPunt(7, 9, CICLE.ANADA);
  mt.setPunt(13, 7, CICLE.ANADA);
  
  mt.setPunt(13, 3, CICLE.TORNADA);
  mt.setPunt(9, 3, CICLE.TORNADA);
  mt.setPunt(5, 5, CICLE.TORNADA);
  mt.setPunt(3, 10, CICLE.TORNADA);
  
  mt.updateMaxXY();
  mt.calculaArees();
  
  // Sliders
  slX = new Slider("SX", width - 200, 50, 150, 40, 0, 100, sX);
  slY = new Slider("SY", width - 200, 100, 150, 40, 0, 100, sY);

}

void draw(){
  background(255);
  mt.display(sX, sY);
  mt.displayArees(1000, 100);
  
  // Dibuixa els sliders
  slX.display();
  slY.display();
}

void mousePressed(){
  // Comprova si pitjam sobre els Sliders
  slX.checkSlider();
  slY.checkSlider();
  if(sX != slX.v){
    sX = slX.getValue();
  }
  if(sY != slY.v){
    sY = slY.getValue();
  }
}

void mouseDragged(){
  mt.checkMouseDragged(sX,sY);
  mt.updateMaxXY();
  mt.calculaArees();
  
  // Comprova si arrossegam els Sliders
  slX.checkSlider();
  if(sX != slX.v){
    sX = slX.getValue();
  }
  slY.checkSlider();
  if(sY != slY.v){
    sY = slY.getValue();
  }
}

void keyPressed(){
  if(key=='p'){
    saveFrame("maquinatermica - #####.png");
  }
}
