// Components de la GUI

// Botons
Button b1, b2;

// Dimensions dels botons
float buttonW = 60;
float buttonH = 60;

// Cards Paginats
PagedCard pc;

// Dimensions de la taula
float cardsW = 800, cardsH = 700;

// Número de files (capçalera inclosa) i columnes de la taula
int numCardsPage = 2;

// Dades de la taula
String[][] info = {
                     {"Títol 1", "Lloc 1", "Data 1", "Secció 1", "Descripció 1"},
                     {"Títol 2", "Lloc 2", "Data 2", "Secció 2", "Descripció 2"},
                     {"Títol 3", "Lloc 3", "Data 3", "Secció 1", "Descripció 3"},
                     {"Títol 4", "Lloc 4", "Data 4", "Secció 1", "Descripció 4"},
                     {"Títol 5", "Lloc 5", "Data 5", "Secció 2", "Descripció 5"},
                     {"Títol 6", "Lloc 6", "Data 6", "Secció 2", "Descripció 6"},
                     {"Títol 7", "Lloc 7", "Data 7", "Secció 1", "Descripció 7"},
                  };

// Imatges de les cards
PImage img1, img2;

void setup(){
  
  size(1200, 800);      // Dimensions de la Pantalla
  
  // Imatges de les Categories
  img1 = loadImage("categoria1.png");
  img2 = loadImage("categoria2.png");
  
  // Creació de la taula
  pc = new PagedCard(numCardsPage);
  pc.setData(info);
  pc.setCards();
  pc.setImages(img1, img2);
  
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
