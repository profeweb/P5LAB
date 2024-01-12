// Components de la GUI
// Cançons Paginades
PagedSongs ps;

// Cançó Seleccionada
SongCard cs = null;

// Dimensions de la taula
float cardsW = 800, cardsH = 600;

// Número de cançons per pàgina
int numCardsPage = 8;

// Dades de la taula
String[][] info = {
                     {"1", "Títol Cançó 1", "POP", "true"},
                     {"2", "Títol Cançó 2", "ROCK", "false"},
                     {"3", "Títol Cançó 3", "CLASSIC", "true"},
                     {"4", "Títol Cançó 4", "POP", "true"},
                     {"5", "Títol Cançó 5", "POP", "false"},
                     {"6", "Títol Cançó 6", "ROCK", "true"},
                     {"7", "Títol Cançó 7", "DANCE", "true"},
                     {"8", "Títol Cançó 8", "CLASSIC", "true"},
                     {"9", "Títol Cançó 9", "POP", "false"},
                     {"10", "Títol Cançó 10", "ROCK", "true"},
                     };

// Icones dels botons
PImage imgFave, imgNoFave, imgPlay;

void setup(){
  
  size(1200, 800);      // Dimensions de la Pantalla
    
  // Carregar de les imatges (icones);
  imgFave = loadImage("Fave.png");
  imgNoFave = loadImage("noFave.png");
  imgPlay = loadImage("play.png");
  
  // Creació de la taula
  ps = new PagedSongs(numCardsPage, 50, 50, cardsW, cardsH);
  ps.setData(info);
  ps.setCards(imgFave, imgNoFave, imgPlay);
  
}

void draw(){
 
  background(255);
  
  // Dibuixa les Cards paginades
  ps.display();
  
  // Actualitza forma del cursor
  updateCursor();
  
  // Indica el Resultat seleccionat
  if(cs!=null){
    fill(0); textSize(18);
    text("PLAY:", 900, 300);
    text(cs.title, 900, 350);
    text(cs.category, 900, 380);
  }
  
}

// En cas de pitjar el ratolí
void mousePressed(){
  
  ps.checkButtons();
  cs = ps.checkCardClick();
}

// Modifica el cursor
void updateCursor(){
  
  if(ps.b1.mouseOverButton() || ps.b2.mouseOverButton()){
      cursor(HAND);
  }
  else if(ps.numCardOver()!=-1){
    cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
