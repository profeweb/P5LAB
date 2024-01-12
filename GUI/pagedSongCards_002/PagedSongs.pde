
class PagedSongs {


  String[][] resultsData;    // Dades de les Cards
  SongCard[] songs;              // Cançons
  int numSongs;              // Número total de Cançons
  int numSongsPage;        // Número de Cançons en 1 Pàgina

  int numPage;
  int numTotalPages;

  float x, y, w, h;

  // Botons
  Button b1, b2;

  // Dimensions dels botons
  float buttonW = 60, buttonH = 60;

  // Constructor
  PagedSongs(int ncp, float x, float y, float w, float h) {

    this.numSongsPage = ncp;
    this.numPage = 0;

    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    // Creació dels botons
    b1 = new Button("NEXT", 100 + cardsW, 80, buttonW, buttonH);
    b2 = new Button("PREV", 100 + cardsW, 100 + buttonH, buttonW, buttonH);
  }

  // Setters

  void setData(String[][] d) {
    this.resultsData = d;
    this.numTotalPages = d.length / this.numSongsPage;
  }

  void setCards(PImage img1, PImage img2, PImage img3) {
    songs = new SongCard[this.resultsData.length];
    float hc = h / (float) numCardsPage;
    int k=0;
    for (int i=0; i<songs.length; i++) {
      float yc = y +(k%numSongsPage)*(hc + 10);
      songs[i] = new SongCard(x, yc, w, hc, 10, resultsData[i]);
      songs[i].setButtons(img1, img2, img3);
      k++;
    }
  }


  void nextPage() {
    if (this.numPage<this.numTotalPages) {
      this.numPage++;
    }
  }

  void prevPage() {
    if (this.numPage>0) {
      this.numPage--;
    }
  }

  // Dibuixa taula
  void display() {

    pushStyle();


    // Dibuixa Cards
    int firstCardPage = numCardsPage*numPage;
    int lastCardPage  = numCardsPage*(numPage+1) - 1;

    for (int i = firstCardPage; i <= lastCardPage; i++) {
      if (i<songs.length) {
        boolean mouseOver = (i==numCardOver());
        songs[i].display(mouseOver);
      }
    }

    // Informació de la Pàgina
    fill(0);
    text("Pag: "+(this.numPage+1)+" / "+(this.numTotalPages+1), x + w + 50, y+10);


    // Dibuixa els botons
    b1.display();
    b2.display();

    popStyle();
  }


  int numCardOver() {

    int firstCardPage = numCardsPage*numPage;
    int lastCardPage  = numCardsPage*(numPage+1) - 1;
    float hCard = h / (float) numCardsPage;
    float yCard = y;
    float b = 10;

    for (int i = firstCardPage; i <= lastCardPage; i++) {
      if (i<songs.length) {

        if (mouseX > x && mouseX < x + w && 
          mouseY > yCard && mouseY < yCard + hCard) {
          return i;
        }
        yCard += hCard + b;
      }
    }
    return -1;
  }


  SongCard checkCardClick() {

    int firstCardPage = numCardsPage*numPage;
    int lastCardPage  = numCardsPage*(numPage+1) - 1;

    for (int i = firstCardPage; i <= lastCardPage & i<songs.length; i++) {
      SongCard sc = songs[i].checkButtons();
      if (sc!= null) {
        return sc;
      }
    }
    return null;
  }

  void checkButtons() {
    if (b1.mouseOverButton() && b1.enabled) {
      ps.nextPage();
    } else if (b2.mouseOverButton() && b2.enabled) {
      ps.prevPage();
    }
  }
}
