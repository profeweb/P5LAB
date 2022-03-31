class LinkItem {

  // Nom i URL del link
  String name;
  String url;

  // Posició i dimensions
  float x, y, w, h;

  // Constructor
  LinkItem(String n, String u) {
    this.name = n;
    this.url = u;
  }

  // Setter de posició i mida
  void setLocation(float x, float y, float w, float h) {
    this.x = x; this.y = y;
    this.w = w; this.h = h;
  }

  // Dibuixa botó de Link
  void display(boolean mouseOver) {
    pushStyle();
    rectMode(CORNER);
    if (mouseOver) {
      fill(255, 200, 200);
    } else {
      fill(255);
    }
    rect(x +5, y + 5, w-10, h - 10, 5);
    textAlign(CENTER); 
    fill(0);
    fill(0); 
    textSize(24);
    text(this.name, x + w/2, y + h/3 + 10);
    fill(255, 0, 0); 
    textSize(18);
    text(this.url, x + w/2, y + 2*h/3 +10);
  }

  // Determina si mouse sobre el Link
  boolean mouseOverButton() {
    return (mouseX >= this.x) && 
      (mouseX<=this.x + this.w) && 
      (mouseY>= this.y) && 
      (mouseY<= this.y + this.h);
  }

  // Obri la URL amb el navegador
  void openWeb() {
    openWebPage(this.url);
  }
}
