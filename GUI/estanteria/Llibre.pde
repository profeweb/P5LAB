class Llibre {
  
  PImage portada;
  String titol;
  String isbn;
  String autor;
  String genere;
  
  color c = color(200);
  
  float marge = 10;
  
  Llibre(String t, String i, String a, String g, String p){
    this.titol = t;
    this.isbn = i;
    this.autor = a;
    this.genere = g;
    setPortada(p);
  }
  
  void setPortada(String imgName){
    this.portada = loadImage(imgName);
  }
  
  void setColor(color c){
    this.c = c;
  }
  
  void display(float x, float y, float w, float h){
    pushStyle();
      rectMode(CORNER);fill(c);
      stroke(0); strokeWeight(2);
      rect(x, y, w, h, 5);
      // Dibuixa portada del llibre
      if(portada!=null){
        imageMode(CORNER);
        image(portada, x+ marge, y + marge, w - 2*marge, 3*h/4);
      }
      else {
        fill(0);
        rect(x+ marge, y + marge, w - 2*marge, 3*h/4);
      }
      // Mostra el text informatiu del Llibre
      textAlign(LEFT); textSize(24); fill(0);
      text(this.titol, marge + x, y + 3*h/4 + 50);
      textSize(18);
      text(this.autor, marge + x, y + 3*h/4 + 80);
      text(this.genere, marge + x, y + 3*h/4 + 110);
    popStyle();
  }
  
  boolean mouseOver(float x, float y, float w, float h){
    return mouseX>x && mouseX<x+w &&
           mouseY>y && mouseY<y+h;
  }
}
