PGraphics alçat, planta , perfil;
void setup() {
  size(100, 100);
  alçat = createGraphics(100, 100);
  planta = createGraphics(100, 100);
  perfil = createGraphics(100, 100);
}

void draw() {
  background(255, 0, 0);
  pg.beginDraw();
  //pg.background(100);
  pg.stroke(255);
  pg.line(20, 20, mouseX, mouseY);
  pg.endDraw();
  image(pg, 9, 30); 
  image(pg, 51, 30);
}

void dibuixaAlçat(
