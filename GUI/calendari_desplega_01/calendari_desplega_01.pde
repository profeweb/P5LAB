
// Variable de Calendari
Calendari c;

// Botó de visiblitat del calendari
Button b;

void setup(){
  size(800,800);
  // Crea el Calendari
  c = new Calendari(50,200,700,550);
  
  // Crea el Botó
  b= new Button("Calendari", 10, 10, 150, 50);
}

void draw(){
  
  background(200, 100, 100);
  
  // Dibuixa el calendari
  c.display();
  
  // Dibuixa el botó
  b.display();
}


void mousePressed(){
  // Comprovar si clicam sobre botons del Calendari
  c.checkButtons();
  
  // Si pitja el botó, canvia la visibilitat del calendari.
  if(b.mouseOverButton()&&b.enabled){
    c.visible = !c.visible;
  }
}
