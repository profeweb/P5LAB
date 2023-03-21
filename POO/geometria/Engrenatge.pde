class Engrenatge extends Poligon {
  
  Engrenatge(Punt c, float r1, float r2, int np, int m){
    punts = new Punt[np];
    float angleStep = TWO_PI / np;
    float angle = 0;
    float radi = r1;
    for(int i=0; i<np; i++){
      if(i%m<m/2){
        radi = r1;
      }
      else {
        radi = r2;
      }
      float x = c.x + radi*cos(angle);
      float y = c.y + radi*sin(angle);
      float z = 0;
      punts[i] = new Punt("",x, y, z);
      angle += angleStep;
    }
  }
}
