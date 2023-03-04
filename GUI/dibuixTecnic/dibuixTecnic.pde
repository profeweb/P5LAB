PGraphics alzat, planta , perfil;
Punt a, b;
Linia l1;

void setup() {
  size(1400, 600);
  Punt a = new Punt(100, 100, 50);
  Punt b = new Punt(0, 50, 180);
  Linia l1 = new Linia(a, b);
  
  alzat  = dibuixaPla("XY", 400, 400, l1, color(255, 0, 0));
  planta = dibuixaPla("XZ", 400, 400, l1, color(0, 255, 0));
  perfil = dibuixaPla("YZ", 400, 400, l1, color(0, 0, 255));
}

void draw() {
  background(255, 0, 0);
  image(alzat, 50, 50); 
  image(planta, 500, 50); 
  image(perfil, 950, 50); 
}

PGraphics dibuixaPla(String pla, int w, int h, Linia l, color c){
  PGraphics pg = createGraphics(w, h);
  pg.beginDraw();
    pg.rect(0, 0, w, h);
    pg.pushMatrix();
      pg.fill(0); pg.textSize(18); pg.textAlign(CENTER);
      pg.text(pla, 50, 50);
      pg.translate(w/2, h/2);
      pg.line(-w/3, 0, w/3, 0);
      pg.line(0, -w/3, 0, w/3);
      pg.fill(0); pg.textSize(18); pg.textAlign(CENTER);
      pg.stroke(c);
      pg.strokeWeight(2);

      if(pla.equals("XY")){
        pg.text("X", w/3 +5, 0);
        pg.text("Y", 0, -w/3 -5);
        pg.line(l.a.x, -l.a.y, l.b.x, -l.b.y);
      }
      else if(pla.equals("XZ")){
        pg.text("X", w/3 +5, 0);
        pg.text("Z", 0, -w/3 -5);
        pg.line(l.a.x, -l.a.z, l.b.x, -l.b.z);
      }
      else if(pla.equals("YZ")){
        pg.text("Y", w/3 +5, 0);
        pg.text("Z", 0, -w/3 -5);
        pg.line(l.a.y, -l.a.z, l.b.y, -l.b.z);
      }
    pg.popMatrix();
  pg.endDraw();
  
  return pg;
}
