class FAQ {
  
  String pregunta, resposta;
  float x, y, w, h1, h2;
  color c1, c2;
  
  FAQ(String p, String r,float x, float y, float w, float h1, float h2, color c1, color c2){
    this.pregunta = p;
    this.resposta = r;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h1 = h1;
    this.h2=h2;
    this.c1=c1;
    this.c2 = c2;
  }
  
  void display(){
    pushStyle();
    rectMode(CORNER);
    fill(this.c1);
    rect(this.x, this.y, this.w, this.h1);
    textAlign(LEFT); fill(0); text(this.pregunta, this.x+5, this.y+this.h1/2);
    fill(this.c2);
    rect(this.x, this.y+this.h1, this.w, this.h2);
    textAlign(LEFT); fill(0); text(this.resposta, this.x+5+h2, this.y+this.h2);
    popStyle();
  }
}
  
