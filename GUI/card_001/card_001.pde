// Components de la GUI

// Card
Card c1, c2;

// Dimensions de la Card
float cardW = 750;
float cardH = 360;

// Dades de la card ()
String[] info1 = { "Titol Esdeveniment 1", 
                  "Lloc 1", "Data 1", 
                  "Secció 1", 
                  "Descripció 1 bla bl bla bla bl bla bla bl blabla bl bla bla bl bla bla bl bla bla bl bla bla bl bla"};
                  
String[] info2 = { "Titol Esdeveniment 2", 
                  "Lloc 2", "Data 2", 
                  "Secció 2", 
                  "Descripció 2  bla bl bla bla bl bla bla bl bla bla bl blabla bl bla bla bl bla bla bl bla bla bl bla bla bl bla"};

// Imatge de la card
PImage img1, img2;

void setup(){
  
  size(800, 800);      // Dimensions de la Pantalla
  
  // Imatges de les Categories
  img1 = loadImage("categoria1.png");
  img2 = loadImage("categoria2.png");
  
  // Creació de les Cards
  c1 = new Card(info1);
  c1.setImage(img1);
  
  c2 = new Card(info2);
  c2.setImage(img2);
  
}

void draw(){
 
  background(255);
  
  // Dibuixa les cards
  c1.display(20, 20, cardW, cardH, 10);
  c2.display(20, 40 + cardH, cardW, cardH, 10);
  
}
