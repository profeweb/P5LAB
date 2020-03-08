class Sector {
  
  float x, y;  //Coordenada de posició
  float r;    // Radi del sector
  color c;    // Color
  float val;  // Valor (%)
  float ang0, ang1;  // Angles d'inici i fi del Sector
  
  Sector (float x, float y, float r, color c, float val, float ang0, float ang1){
    this.x = x;
    this.y = y;
    this.r = r;
    this.c = c;
    this.val = val;
    this.ang0 = ang0;
    this.ang1 = ang1;
  }
  
  // Dibuixa el sector
  void display(){
    fill(c);
    stroke(255);
    arc(x, y, 2*r, 2*r, ang0, ang1);
    strokeWeight(4); stroke(255);
    line(x, y, x+r*cos(ang0), y + r*sin(ang0));
    float  angLabel = (ang0 + ang1) / 2.0;
    fill(0);
    text(nf(val, 2,2)+"%", x + r*1.05*cos(angLabel), y + r*1.05*sin(angLabel));
  }
}
