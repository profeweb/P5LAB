class Ruta {

  String id, nombre, descripcion, tipo, temporada;

  // Posició i mida
  float x, y, w, h;

  // Array de lugares
  Lugar[] lugares;

  // Valores min i max de latitud i longitud
  float minLat, maxLat, minLon, maxLon;

  // Altura de botó de link
  float hl = 200;

  int numLinks;
  int numLinksPage;
  int numPage;
  int numTotalPages;


  // Constructor
  Ruta(String[] data) {
    this.id = data[0];
    this.nombre = data[1];
    this.descripcion = data[2];
    this.tipo = data[3];
    this.temporada = data[4];

    this.numLinksPage = 3;
    this.numPage = 0;
  }

  void setLocation(float x, float y, float w, float h) {
    this.x = x; 
    this.y = y;
    this.w = w; 
    this.h = h;
  }

  // Asigna dades als links
  void setLugares(String[][] data) {
    numLinks = data.length;
    numTotalPages = numLinks / numLinksPage;
    lugares = new Lugar[data.length];

    for (int np=0; np<=numTotalPages; np++) {

      int firstLinkPage = numLinksPage*np;
      int lastLinkPage  = numLinksPage*(np+1) - 1;
      float yCard = y;
      float b = 10;

      for (int i = firstLinkPage; i <= lastLinkPage; i++) {
        if (i<data.length) {
          lugares[i] = new Lugar(data[i]);
          lugares[i].setLocation(x, yCard, w, hl);
          yCard += hl + b;
        }
      }
    }

    setMinMaxLatLon();
  }

  // Dibuixa Llista de Links
  void display() {
    pushStyle();

    // Nombre Ruta
    fill(0); 
    textSize(36); 
    textAlign(LEFT);
    text(this.nombre, x, y - 20);

    // Temporada Ruta
    fill(0, 0, 255); 
    textSize(28); 
    textAlign(RIGHT);
    text(this.temporada, x + w, y - 50);

    // Tipo Ruta
    fill(255, 0, 0); 
    textSize(24); 
    textAlign(RIGHT);
    text(this.tipo, x + w, y - 20);

    // Dibuixa Cards corresponent a la Pàgina
    int firstLinkPage = numLinksPage*numPage;
    int lastLinkPage  = numLinksPage*(numPage+1) - 1;
    for (int i = firstLinkPage; i <= lastLinkPage; i++) {
      if (i<lugares.length && lugares[i]!=null) {
        boolean mouseOver = lugares[i].mouseOverButton();
        lugares[i].display(mouseOver);
      }
    }

    // Informació de la Pàgina
    fill(0);
    String infoPagina = "Pag: "+(this.numPage+1)+" / "+(this.numTotalPages+1);
    textAlign(RIGHT); 
    textSize(18);
    text(infoPagina, x + w, y + h + 50);

    String infoNum = "Lugares: "+lugares.length;
    textAlign(LEFT);
    text(infoNum, x + 10, y + h + 50);
    popStyle();
  }

  // Comprova click sobre links
  void checkClicks() {
    int firstLinkPage = numLinksPage*numPage;
    int lastLinkPage  = numLinksPage*(numPage+1) - 1;
    for (int i = firstLinkPage; i <= lastLinkPage; i++) {
      if (i<lugares.length && lugares[i]!=null && lugares[i].mouseOverButton()) {
        lugares[i].openWeb();
        break;
      }
    }
  }

  // Comprova mouse sobre links
  boolean mouseOver() {
    for (Lugar li : lugares) {
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

  void setMinMaxLatLon() {
    float minimumLat = Float.MAX_VALUE;
    float maximumLat = Float.MIN_VALUE;
    float minimumLon = Float.MAX_VALUE;
    float maximumLon = Float.MIN_VALUE;
    for (Lugar l : lugares) {
      float lat = Float.parseFloat(l.lat);
      float lon = Float.parseFloat(l.lon);
      if (lat> maximumLat) { 
        maximumLat = lat;
      }
      if (lat< minimumLat) { 
        minimumLat = lat;
      }
      if (lon> maximumLon) { 
        maximumLon = lon;
      }
      if (lon< minimumLon) { 
        minimumLon = lon;
      }
    }

    this.minLat = minimumLat;
    this.maxLat = maximumLat;
    this.minLon = minimumLon;
    this.maxLon = maximumLon;
  }



  // Display Mapa
  void displayMapa(float x, float y, float w, float h) {
    pushStyle();

    for (int i=0; i<lugares.length - 1; i++) {
      Lugar l1 = lugares[i];
      float yl1 = l1.mappedLat(this.minLat, this.maxLat, y, h);
      float xl1 = l1.mappedLon(this.minLon, this.maxLon, x, w);

      Lugar l2 = lugares[i+1];
      float yl2 = l2.mappedLat(this.minLat, this.maxLat, y, h);
      float xl2 = l2.mappedLon(this.minLon, this.maxLon, x, w);

      stroke(255, 0, 0); 
      strokeWeight(4);
      line(xl1, yl1, xl2, yl2);
    }

    for (Lugar l : lugares) {
      float yl = l.mappedLat(this.minLat, this.maxLat, y, h);
      float xl = l.mappedLon(this.minLon, this.maxLon, x, w);
      fill(255); 
      stroke(0); 
      strokeWeight(2);
      ellipse(xl, yl, 25, 25);

      fill(0);
      textAlign(CENTER);
      text(l.id, xl, yl +5); 
      textAlign(LEFT); 
      textSize(18);
      text(l.nombre, xl + 15, yl + 20);

      // LAT - LON
      textSize(12);
      String latlon = "LAT: "+l.lat+", LON: "+l.lon;
      text(latlon, xl + 15, yl + 35);
    }
    popStyle();
  }
}
