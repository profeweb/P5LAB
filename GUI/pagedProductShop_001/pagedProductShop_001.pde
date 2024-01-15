// Components de la GUI
// Productes Paginats
PagedProducts ps;

// Producte Seleccionat
ProductCard cs = null;

// Dimensions de la taula
float cardsW = 1200, cardsH = 800;

// Número de productes per pàgina
int numCardsPage = 6;
int numCardsRow = 3;

// Dades de la taula
String[][] info = {
      {"1", "Producte 1", "A", "Descripció 1", "15.25", "true", "imatge1.png"},
      {"2", "Producte 2", "A", "Descripció 2", "9.75", "false", "imatge2.png"},
      {"3", "Producte 3", "B", "Descripció 3", "120.50" , "true", "imatge3.png"},
      {"4", "Producte 4", "C", "Descripció 4", "74.49", "true", "imatge4.png"},
      {"5", "Producte 5", "C", "Descripció 5", "49.95", "false", "imatge5.png"},
      {"6", "Producte 6", "A", "Descripció 6", "3.25", "true", "imatge6.png"},
      {"7", "Producte 7", "D", "Descripció 7", "10.15", "true", "imatge7.png"},
      {"8", "Producte 8", "B", "Descripció 8", "25.95", "true", "imatge8.png"},
      {"9", "Producte 9", "B", "Descripció 9", "4.75", "false", "imatge9.png"},
      {"10","Producte 10","A", "Descripció 10","3.05", "true", "imatge10.png"},
};

// Icones dels botons
PImage imgMes, imgMenys;

void setup(){
  
  size(1600, 900);      // Dimensions de la Pantalla
    
  // Carregar de les imatges (icones);
  imgMes = loadImage("mes.png");
  imgMenys = loadImage("menys.png");
  
  // Creació de la taula
  ps = new PagedProducts(numCardsPage, 50, 50, cardsW, cardsH);
  ps.setData(info);
  ps.setCards(imgMes, imgMenys);
  
}

void draw(){
 
  background(255);
  
  // Dibuixa les Cards paginades
  ps.display();
  
  if(cs!=null){
    fill(0); textSize(24); textAlign(LEFT);
    text(cs.title, width - 280, height/2);
    text(cs.price+"€", width - 280, height/2 + 30);
    text(cs.cQuantity.value, width - 280, height/2 + 60);
  }
  
}

// En cas de pitjar el ratolí
void mousePressed(){
  cs = ps.ckechButtons();
}
