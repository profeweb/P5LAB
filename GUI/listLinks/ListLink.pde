class ListLink {

  // Posició i mida
  float x, y, w, h;
  
  // Array de links
  LinkItem[] links;
  
  // Altura de botó de link
  float hl = 80;
  
  int numLinks;
  int numLinksPage;
  int numPage;
  int numTotalPages;
  

  // Constructor
  ListLink(int nlp, float x, float y, float w, float h) {
    this.x = x; this.y = y;
    this.w = w; this.h = h;
    
    this.numLinksPage = nlp;
    this.numPage = 0;
  }

  // Asigna dades als links
  void setData(String[][] data) {
    numLinks = data.length;
    numTotalPages = numLinks / numLinksPage;
    links = new LinkItem[data.length];
    
    for (int np=0; np<=numTotalPages; np++) {
      
      int firstLinkPage = numLinksPage*np;
      int lastLinkPage  = numLinksPage*(np+1) - 1;
      float yCard = y;
      float b = 10;

      for (int i = firstLinkPage; i <= lastLinkPage; i++) {
        if (i<data.length) {
          links[i] = new LinkItem(data[i][0], data[i][1]);
          links[i].setLocation(x, yCard, w, hl);
          yCard += hl + b;
        }
      }
    }
  }

  // Dibuixa Llista de Links
  void display() {
    pushStyle();
    
    fill(200, 100, 100);
    rect(x, y, w, h, 5);

    // Dibuixa Cards corresponent a la Pàgina
    int firstLinkPage = numLinksPage*numPage;
    int lastLinkPage  = numLinksPage*(numPage+1) - 1;
    for (int i = firstLinkPage; i <= lastLinkPage; i++) {
      if (i<links.length && links[i]!=null) {
        boolean mouseOver = links[i].mouseOverButton();
        links[i].display(mouseOver);
      }
    }

    // Informació de la Pàgina
    fill(0);
    text("Pag: "+(this.numPage+1)+" / "+(this.numTotalPages+1), x + w/2, y-10);

  }

  // Comprova click sobre links
  void checkClicks() {
    int firstLinkPage = numLinksPage*numPage;
    int lastLinkPage  = numLinksPage*(numPage+1) - 1;
    for (int i = firstLinkPage; i <= lastLinkPage; i++) {
      if (i<links.length && links[i]!=null && links[i].mouseOverButton()) {
        links[i].openWeb();
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
  
  // Pàgina anterior
  void nextPage() {
    if (this.numPage<this.numTotalPages) {
      this.numPage++;
    }
  }

  // Següent pàgina
  void prevPage() {
    if (this.numPage>0) {
      this.numPage--;
    }
  }

}
