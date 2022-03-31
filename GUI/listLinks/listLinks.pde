// Llista de Links
ListLink l;

// Dades de la llista de links
String[][] info = { {"Google", 
                     "http://www.google.com"},
                    {"IES Manacor", 
                     "http://www.iesmanacor.cat"},
                     {"Diari ElPais", 
                     "http://www.elpais.es"},
                     {"Diari Marca", 
                     "http://www.marca.com"},
                  };

void setup(){
  size(800, 800);
  
  // Constructor de la Llista de Link
  l = new ListLink(100, 100, 300, 600);
  l.setData(info);
  
  // Creació de Link a navegador
  desktop = Desktop.getDesktop();
}

void draw(){
  background(255, 200, 200);
  
  // Dibuix de la llista de Links
  l.display();
  
  // Actualitza el cursor
  updateCursor();
}

// Comprova clicks de mouse
void mousePressed(){
  l.checkClicks();
}

// Actualitza el cursor
void updateCursor(){
  if(l.mouseOver()){
    cursor(HAND);
  }
  else {
    cursor(ARROW);
  }
}
