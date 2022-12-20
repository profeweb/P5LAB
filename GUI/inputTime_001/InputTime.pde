class InputTime {
  
  PImage foto;
  String entreno;
  String alumne;
  TimeField tf;
  Button bSave;
  
  float x, y, w, h;
  
  InputTime(float x, float y, float w, float h, String entreno, String alumne){
    this.x = x; this.y = y; this.w = w; this.h = h;
    this.entreno = entreno;
    this.alumne = alumne;
    this.foto = loadImage(this.alumne+".png");
    
    tf = new TimeField(x + w/4, y + h/1.5, w/2, h/8);
    bSave = new Button("SAVE", x + w/4, y + 4*h/5, w/2, h/8);
  }
  
  void display(){
    
    pushStyle();
    rectMode(CORNER);
    rect(x, y, w, h, 10);
    
    imageMode(CENTER);
    image(foto, x + w/2, y + h/6, w/3, w/3);
    fill(0); textAlign(CENTER); textSize(28);
    text(this.entreno, x + w/2, y + h/2);
    text(this.alumne, x + w/2, y + 2*h/6);
    tf.display();
    bSave.display();
    popStyle();
  }
  
  void isPressed(){
    tf.isPressed();
    if(bSave.mouseOverButton()){
      //
    }
  }
  
  void keyPressed(char key, int keyCode) {
      tf.keyPressed(key, keyCode);
   }
}
