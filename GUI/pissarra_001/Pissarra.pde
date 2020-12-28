class Pissarra {
  
  // Propietats de la Pissarra
  float x, y, w, h;
  
  // Col·leccions de Pins
  Pin[] pins1, pins2;
  
  // Constructor
  Pissarra(float x, float y, float w, float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    // Crea 5 pins (Equip 1)
    pins1 = new Pin[5];
    for(int i=0; i<pins1.length; i++){
      String txt = (i+1)+"";
      pins1[i] = new Pin( x + 50 , y + 50 + 80*i, 30, txt, color(255, 0, 0));
    }
    
    // Crea 5 pins (Equip 2)
    pins2 = new Pin[5];
    for(int i=0; i<pins2.length; i++){
      String txt = (i+1)+"";
      pins2[i] = new Pin( x + w - 50 , y + 50 + 80*i, 30, txt, color(0, 0, 255));
    }
  }
  
  // Resetea la posició de tots els Pins
  void resetPinPositions(){
    for(int i=0; i<pins2.length; i++){
      pins1[i].setPosition( x + 50 , y + 50 + 80*i);
      pins2[i].setPosition( x + w - 50 , y + 50 + 80*i);
    }
  }
  
  // Dibuixa la Pissarra
  void display(){
    pushStyle();
      
      // Rectangle
      stroke(0); strokeWeight(3); fill(0,200,200);
      rect(x, y, w, h);
      
      // Texte
      textSize(24); textAlign(LEFT); fill(0); 
      text("Press R to reset", x, y + w + 24);
      
    popStyle();
  }
  
  // Dibuixa els Pins
  void displayPins(){
    for(Pin p : pins1){
      p.display();
    }
    
    for(Pin p : pins2){
      p.display();
    }
  }
  
  // Comprova si el cursor està sobre la Pissarra
  boolean mouseOver(){
    return mouseX >= this.x && mouseX <= this.x + this.w &&
           mouseY >= this.y && mouseY <= this.y + this.h;
  }
  
  // Comprova si cal moure algun Pin
  void checkPinsMotion(){
    if(mouseOver()){
      
      // Comprova els pins de l'Equip 1
      for(Pin p : pins1){
        if(p.mouseOver()){
          p.setPosition(mouseX, mouseY);
          break;
        }
      }
      
      // Comprova els pins de l'Equip 2
      for(Pin p : pins2){
        if(p.mouseOver()){
          p.setPosition(mouseX, mouseY);
          break;
        }
      }
      
    }
  }
  
}
