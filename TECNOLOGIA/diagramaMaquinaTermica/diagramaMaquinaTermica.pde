MaquinaTermica mt;
float sX=40, sY=35;
Slider slX, slY, sR;
boolean showSliders = true;
float stepX = 50;
float stepY = 2;

String nomActivitat = "Problema 2- Opció A. Juny 2016.";

void setup() {
  size(1800, 900);
  mt = new MaquinaTermica(100, height-80);

  mt.setPunt(200, 30, CICLE.ANADA);
  mt.setPunt(750, 20, CICLE.ANADA);
  mt.setPunt(950, 10, CICLE.ANADA);
  //mt.setPunt(400, 4, CICLE.ANADA);

  mt.setPunt(950, 2, CICLE.TORNADA);
  mt.setPunt(600, 2, CICLE.TORNADA);
  mt.setPunt(400, 14, CICLE.TORNADA);
  mt.setPunt(200, 14, CICLE.TORNADA);

  mt.updateMaxXY();
  mt.calculaArees();

  // Sliders
  slX = new Slider("SX", width - 600, 50, 300, 20, 0, 100, sX);
  slY = new Slider("SY", width - 600, 80, 300, 20, 0, 100, sY);
}

void draw() {
  background(255);
  mt.display(sX, sY);
  mt.displayArees(1200, 300);
  
  textSize(34); textAlign(LEFT);
  text(nomActivitat, 1200, 200);

  // Dibuixa els sliders
  if (showSliders) {
    slX.display();
    slY.display();
  }
}

void mousePressed() {
  // Comprova si pitjam sobre els Sliders
  slX.checkSlider();
  slY.checkSlider();
  if (sX != slX.v) {
    sX = slX.getValue();
  }
  if (sY != slY.v) {
    sY = slY.getValue();
  }
}

void mouseDragged() {
  mt.checkMouseDragged(sX, sY);
  mt.updateMaxXY();
  mt.calculaArees();

  // Comprova si arrossegam els Sliders
  slX.checkSlider();
  if (sX != slX.v) {
    sX = slX.getValue();
  }
  slY.checkSlider();
  if (sY != slY.v) {
    sY = slY.getValue();
  }
}

void keyPressed() {
  if (key=='p') {
    saveFrame("maquinatermica - "+nomActivitat+".png");
  } else if (key=='h') {
    showSliders = !showSliders;
  } else if (keyCode==UP) {
    sX+=0.01;
    slX.v = sX;
  } else if (keyCode==DOWN) {
    sX-=0.01;
    slX.v = sX;
  } else if (keyCode==RIGHT) {
    sY+=0.01;
    slY.v = sY;
  } else if (keyCode==LEFT) {
    sY-=0.01;
    slY.v = sY;
  }
}
