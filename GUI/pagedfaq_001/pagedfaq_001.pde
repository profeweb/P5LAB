// Components de la GUI
float Ycapsa = 100;

// Botons
Button b1, b2;

// Dimensions dels botons
float buttonW = 60;
float buttonH = 60;

// Cards Paginats
PagedFAQ pc;

// Dimensions de la taula
float cardsW = 800, cardsH = 700;

// Número de files (capçalera inclosa) i columnes de la taula
int numCardsPage = 2;

// Dades de la taula
String[][] info = {
                     {"Títol 1", "Lloc 1"},
                     {"Títol 2", "Lloc 2"},
                     {"Títol 3", "Lloc 3"},
                     {"Títol 4", "Lloc 4"},
                     {"Títol 5", "Lloc 5"},
                     {"Títol 6", "Lloc 6"},
                     {"Títol 7", "Lloc 7"},
                  };

// Imatges de les cards
PImage img1, img2;

void setup(){
  
  size(1200, 800);      // Dimensions de la Pantalla
  
  // Imatges de les Categories
  img1 = loadImage("categoria1.png");
  img2 = loadImage("categoria2.png");
  
  // Creació de la taula
  pc = new PagedFAQ(numCardsPage);
  pc.setData(info);
  // float x, float y, float w, float h1, float h2, color c1, color c2
  pc.setCards(10, 100, 1900, 100, 170, color(277, 188, 208), color(255, 222, 226));
  
  // Creació dels botons
  b1 = new Button("NEXT", 100 + cardsW, 80, buttonW, buttonH);
  b2 = new Button("PREV", 100 + cardsW, 100 + buttonH, buttonW, buttonH);
  
}

void draw(){
 
  background(255);
  
  // Dibuixa les Cards paginades
  pc.display(50, 50, cardsW, cardsH);
  
  // Dibuixa els botons
  b1.display();
  b2.display();
  
  // Actualitza forma del cursor
  updateCursor();
  
}

// En cas de pitjar el ratolí
void mousePressed(){
  
  if(b1.mouseOverButton() && b1.enabled){
    pc.nextPage();
  }
  else if(b2.mouseOverButton() && b2.enabled){
    pc.prevPage();
  }
}

// Modifica el cursor
void updateCursor(){
  
  if((b1.mouseOverButton() && b1.enabled)||
     (b2.mouseOverButton() && b2.enabled)){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
