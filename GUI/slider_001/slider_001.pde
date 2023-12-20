
// Variables de classe Slider
Slider sX, sY, sR;

void setup() {
  size(800, 800);
  smooth(10);

  // Sliders
  sX = new Slider("X_POS", 50, 50, 300, 50, 0, width, width/2);
  sY = new Slider("Y_POS", 50, 150, 300, 50, 0, height, height/2);
  sR = new Slider("R_SIZE", 50, 250, 300, 50, 5, 50, 10);
}

void draw() {
  background(255);

  // Dibuixa els sliders
  sX.display();
  sY.display();
  sR.display();

  // Actualitza posició i mida del cercle
  updateCercle();
}

void updateCercle() {

  // Agafam el valor dels Sliders
  float x = sX.getValue();
  float y = sY.getValue();
  float r = sR.getValue();

  // Dibuixam el cercle
  fill(200, 100, 100); 
  strokeWeight(3);
  ellipse(x, y, 2*r, 2*r);
}

void mousePressed() {
  // Comprova si pitjam sobre els Sliders
  sX.checkSlider();
  sY.checkSlider();
  sR.checkSlider();
}

void mouseDragged() {
  // Comprova si arrossegam els Sliders
  sX.checkSlider();
  sY.checkSlider();
  sR.checkSlider();
}
