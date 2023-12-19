class Ornament {
  
  float x, y;
  float mida;
  color c;
  
  Ornament(float x, float y, float m, color c){
    this.x = x; this.y = y;
    this.mida = m;
    this.c = c;
  }
  
  void setPosicio(float x, float y){
    this.x = x; this.y = y;
  }
  
  boolean mouseOver(){
    return true;
  }
  
}
