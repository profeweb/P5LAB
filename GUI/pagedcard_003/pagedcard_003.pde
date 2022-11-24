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
int numCardsPage = 4;

// Dades de la taula
String[][] info = {
                     {"Títol 1", "Descripció 1 Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"},
                     {"Títol 2", "Descripció 2"},
                     {"Títol 3", "Descripció 3"},
                     {"Títol 4", "Descripció 4"},
                     {"Títol 5", "Descripció 5"},
                     {"Títol 6", "Descripció 6"},
                     {"Títol 7", "Descripció 7"},
                     {"Títol 8", "Descripció 8"},
                     {"Títol 9", "Descripció 9"},
                     {"Títol 0", "Descripció 0"},
                  };

// Imatges de les cards
PImage img1, img2;

boolean cursorHand = false;

void setup(){
  
  size(1200, 800);      // Dimensions de la Pantalla
  
  // Creació de la taula
  pc = new PagedCard(numCardsPage);
  pc.setDimensions(50, 50, cardsW, cardsH);
  pc.setData(info);
  pc.setCards();
  
  // Creació dels botons
  b1 = new Button("NEXT", 100 + cardsW, 80, buttonW, buttonH);
  b2 = new Button("PREV", 100 + cardsW, 100 + buttonH, buttonW, buttonH);
  
}

void draw(){
 
  background(255);
  
  // Dibuixa les Cards paginades
  pc.display();
  pc.printSelectedCard();
  
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
  else {
    pc.checkCardSelection();
  }
}

// Modifica el cursor
void updateCursor(){
  
  if((b1.mouseOverButton() && b1.enabled)||
     (b2.mouseOverButton() && b2.enabled)){
       cursorHand = true;
  }
  else {
    cursorHand = pc.checkMouseOver();
  }
     
      
  if(cursorHand){
    cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
