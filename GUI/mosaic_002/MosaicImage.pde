class MosaicImage {
    
  // Imatge
  PImage img;
  
  // Títol 
  String title;
  
  // Estats del botó
  boolean selected;
  
  // Constructor
  MosaicImage(String title){
    this.title = title;
    this.img = loadImage(title);
    this.selected = false;
  }
  
  // Setters
  
  void setSelected(boolean b){
    this.selected = b;
  }
  
  
  // Dibuixa
  void display(float x, float y, float w, float h){
    pushStyle();
    image(img, x, y, w, h);
    if(selected){
      
      noFill(); stroke(200, 100, 100); strokeWeight(4);
      rect(x+2, y+2, w-4, h-4);
      
      fill(200, 100, 100, 200); noStroke();
      ellipse(x + w/2, y+h/2, 80, 80);
    }
    
    popStyle();
  }  
  
}
