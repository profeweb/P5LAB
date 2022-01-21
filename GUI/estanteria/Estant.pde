class Estant {

  float x, y, w, h;

  int pos;
  String nom;
  color cFons = color(200, 100, 100);

  int currentLlibre=0;
  int numLlibres = 0;
  int numLlibresVisibles = 3;
  Llibre[] llibres;

  float llibreW;
  float margeH = 15;

  RoundButton bPrev, bNext;

  Estant(int p, String n, float x, float y, float w, float h, int nv) {
    this.pos = p;
    this.nom = n;
    this.llibres = new Llibre[100];
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.numLlibresVisibles = nv;
    this.llibreW = w / (float) nv;
  }

  void afegirLlibre(Llibre l) {
    if (numLlibres < this.llibres.length) {
      this.llibres[numLlibres] = l;
      numLlibres++;
    }
  }

  void afegirLlibres(Llibre[] ls) {
    for (Llibre l : ls) {
      afegirLlibre(l);
    }
  }
  
  void afegirLLibre(String[] info){
    Llibre l = new Llibre(info[0], info[1], info[2], info[3], info[4] );
    afegirLlibre(l);
  }
  
  void afegirLlibres(String[][] info){
    for(int f=0; f<info.length; f++){
      afegirLLibre(info[f]);
    }
  }

  void setButtons(String img1, String img2) {
    PImage imgPrev = loadImage(img1);
    bPrev = new RoundButton(imgPrev, x, y + h/2, 30);

    PImage imgNext = loadImage(img2);
    bNext = new RoundButton(imgNext, x + w + 30, y + h/2, 30);
  }
  
  void setColor(color c){
    this.cFons = c;
  }

  void next() {
    if (this.currentLlibre<this.numLlibres - this.numLlibresVisibles) {
      this.currentLlibre+=this.numLlibresVisibles;
      this.currentLlibre = constrain(this.currentLlibre, 0,this.numLlibres-1); 
    }
  }

  void prev() {
    if (this.currentLlibre>0) {
      this.currentLlibre-=this.numLlibresVisibles;
      this.currentLlibre = constrain(this.currentLlibre, 0,this.numLlibres-1); 
    }
  }

  void display() {
    pushStyle();
    fill(cFons); stroke(0); strokeWeight(2);
    rectMode(CORNER);
    rect(x-5, y-5, w+10 + margeH*2, h+10, 5);
    
    rect(x+w-200+ margeH*2+5, y -40, 200, 40, 5);
    noStroke();
    rect(x+w-200+ margeH*2+6, y -39, 198, 44, 5);
    
    fill(0); textAlign(CENTER); textSize(24);
    text("("+this.numLlibres+") "+this.nom, x+w-100+ margeH*2+10, y -10);

    for (int i=0; i<this.numLlibresVisibles; i++) {

      int index = i + this.currentLlibre;

      if (index<this.numLlibres) {
        
        // Posició dins l'estant
        float xPos = x + i*(this.llibreW + this.margeH);

        // Llibre a mostrar
        Llibre l= llibres[index];
        l.display(xPos, y, this.llibreW, h);

        // Número del llibre
        fill(cFons); noStroke(); rectMode(CENTER);
        rect(xPos + 40, y + 40, 40, 40, 10);
        fill(0); textAlign(CENTER);
        text(index+1, xPos + 40, y + 48);
      }
    }

    if (bNext!=null && (this.currentLlibre + this.numLlibresVisibles)<this.numLlibres) {
      bNext.display();
      bNext.setEnabled(true);
    }
    else {
      bNext.setEnabled(false);
    }
    if (bPrev!=null && this.currentLlibre > 0) {
      bPrev.display();
      bPrev.setEnabled(true);
    }
    else {
      bPrev.setEnabled(false);
    }
    
    popStyle();
  }
  
  void checkButtons(){
    if(bNext.mouseOverButton() && bNext.enabled){
      this.next();
    }
    else if(bPrev.mouseOverButton() && bPrev.enabled){
      this.prev();
    }
  }
  
  boolean checkCursor(){
    if(bNext.mouseOverButton() && bNext.enabled){
      return true;
    }
    else if(bPrev.mouseOverButton() && bPrev.enabled){
      return true;
    }
    return false;
  }
}
