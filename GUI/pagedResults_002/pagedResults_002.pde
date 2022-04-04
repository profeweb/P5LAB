// Components de la GUI

// Botons
Button b1, b2;

// Dimensions dels botons
float buttonW = 60;
float buttonH = 60;

// Resultats Paginats
PagedResults pc;

// Resultat Seleccionat
Result rs = null;

// Dimensions de la taula
float cardsW = 800, cardsH = 700;

// Número de files (capçalera inclosa) i columnes de la taula
int numCardsPage = 4;

// Dades de la taula
String[][] info = {
                     {"1", "Títol 1", "10/03/2022","Descripció 1", "S", "pesadilla", "paco@gmail.com", "Label1,Label2,Label3,Label4"},
                     {"2", "Títol 2", "10/03/2022","Descripció 2", "S", "pesadilla", "paco@gmail.com","Label1,Label2,Label3"},
                     {"3", "Títol 3", "10/03/2022","Descripció 3", "N", "pesadilla", "paco@gmail.com","Label1,Label3"},
                     {"4", "Títol 4", "10/03/2022","Descripció 4", "S", "pesadilla", "paco@gmail.com","Label2,Label3"},
                     {"5", "Títol 5", "10/03/2022","Descripció 5", "N", "pesadilla", "paco@gmail.com","Label1,Label2,Label3,Label4"},
                     {"6", "Títol 6", "10/03/2022","Descripció 6", "S", "pesadilla", "paco@gmail.com","Label1,Label3"},
                     {"7", "Títol 7", "10/03/2022","Descripció 7", "N", "pesadilla", "paco@gmail.com","Label1,Label2,Label3"},
                  };

// Imatges de les cards
PImage img1, img2;

void setup(){
  
  size(1200, 800);      // Dimensions de la Pantalla
    
  // Creació de la taula
  pc = new PagedResults(numCardsPage);
  pc.setData(info);
  pc.setCards();
  
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
  
  // Indica el Resultat seleccionat
  if(rs!=null){
    fill(0); textSize(18);
    text("SELECCIONAT:", 900, 300);
    text(rs.title, 900, 350);
    text(rs.description, 900, 380);
    text(rs.joinLabels(","), 900, 410);
  }
  
}

// En cas de pitjar el ratolí
void mousePressed(){
  
  if(b1.mouseOverButton() && b1.enabled){
    pc.nextPage();
  }
  else if(b2.mouseOverButton() && b2.enabled){
    pc.prevPage();
  }
  
  rs = pc.checkCardClick(50, 50, cardsW, cardsH);
}

// Modifica el cursor
void updateCursor(){
  
  if((b1.mouseOverButton() && b1.enabled)||
     (b2.mouseOverButton() && b2.enabled)){
      cursor(HAND);
  }
  else if(pc.numCardOver(50, 50, cardsW, cardsH)!=-1){
    cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
