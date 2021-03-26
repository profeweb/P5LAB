class PagedSelectImage {

  // Dimensions
  float x, y, w, h;

  // Imatge
  PImage img;
  String title;
  int numPage = 0;

  // Estats del botó
  boolean selected, enabled;

  // Constructor
  PagedSelectImage(String title, float x, float y, float w, float h, int np, boolean b) {
    this.x = x; 
    this.y=y; 
    this.w = w; 
    this.h = h;
    this.title = title;
    this.img = loadImage(title);
    this.selected = false;
    this.enabled = b;
    this.numPage = np;
    println(b);
  }

  // Setters

  void setSelected(boolean b) {
    this.selected = b;
  }

  void setEnabled(boolean b) {
    this.enabled = b;
  }


  // Dibuixa
  void display() {
    if (this.enabled) {
      pushStyle();
      image(img, x, y, w, h);
      if (selected) {
        noFill(); 
        stroke(200, 100, 100); 
        strokeWeight(4);
        rect(x+2, y+2, w-4, h-4);

        fill(200, 100, 100, 200); 
        noStroke();
        ellipse(x + w/2, y+h/2, 80, 80);
      }
      popStyle();
    }
  }

  // Ratolí sobre el botó
  boolean mouseOver() {
    return mouseX>=this.x && mouseX<=this.x+this.w &&
      mouseY>=this.y && mouseY<=this.y+this.h;
  }
}
