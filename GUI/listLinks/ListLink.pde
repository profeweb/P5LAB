class ListLink {

  // Posició i mida
  float x, y, w, h;
  
  // Array de links
  LinkItem[] links;
  
  // Altura de botó de link
  float hl = 80;

  // Constructor
  ListLink(float x, float y, float w, float h) {
    this.x = x; this.y = y;
    this.w = w; this.h = h;
  }

  // Asigna dades als links
  void setData(String[][] data) {
    links = new LinkItem[data.length];
    for (int i=0; i<data.length; i++) {
      links[i] = new LinkItem(data[i][0], data[i][1]);
      links[i].setLocation(x, y + hl*i, w, hl);
    }
  }

  // Dibuixa Llista de Links
  void display() {
    pushStyle();
    fill(200, 200, 200);
    rect(x, y, w, h, 5);
    for (LinkItem li : links) {
      boolean mouseOver = li.mouseOverButton();
      li.display(mouseOver);
    }
    popStyle();
  }

  // Comprova click sobre links
  void checkClicks() {
    for (LinkItem li : links) {
      if (li.mouseOverButton()) {
        li.openWeb();
        break;
      }
    }
  }
  
  // Comprova mouse sobre links
  boolean mouseOver(){
    for (LinkItem li : links) {
      if (li.mouseOverButton()) {
        return true;
      }
    }
    return false;
  }
}
