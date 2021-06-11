class Boto {
  
  // Imatges del botó en els 2 casos
  PShape imgOut, imgOn;
  
  // Posició del botó
  float x, y;
  
  // Dimensions del botó
  float radi;
  
  // Constructor
  Boto(String img1, String img2, float x, float y, float r){
    this.imgOut = loadShape(img1);
    this.imgOn  = loadShape(img2);
    this.x = x;
    this.y = y;
    this.radi = r;
  }
  
  // Setters
  
  void setImages(String img1, String img2){
    this.imgOut = loadShape(img1);
    this.imgOn  = loadShape(img2);
  }
  
  void setPosicio(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void setRadi(float r){
    this.radi = r;
  }
  
  
  // Getters
  
  PShape getImageOn(){
    return this.imgOn;
  }
  
  PShape getImageOut(){
    return this.imgOut;
  }
  
  float getX(){
    return this.x;
  }
  
  float getY(){
    return this.y;
  }
  
  float getRadi(){
    return this.radi;
  }
  
  // Altres
  
  boolean mouseDinsBoto(){
    return dist(mouseX, mouseY, x, y)<radi;
  }
  
  void display(){

    pushMatrix();
      translate(this.x, this.y);
      shapeMode(CENTER);
      if(mouseDinsBoto()){
        cursor(HAND);
        shape(this.imgOn, 0, 0, this.radi*2, this.radi*2);
      }
      else {
        shape(this.imgOut, 0, 0, this.radi*2, this.radi*2);
      }
    popMatrix();
    
  }
  
  
  
}
