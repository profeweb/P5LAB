
// Variable de CalendariPlus
CalendariPlus c;
String dataCalendari="";

// Botó de visiblitat del calendari
Button b;

void setup(){
  size(800,800);
  // Crea el Calendari
  c = new CalendariPlus(50,200,700,550);
  
  // Crea el Botó
  b= new Button("Calendari", 10, 10, 150, 50);
}

void draw(){
  
  // Fons
  background(200, 100, 100);
  
  // Rectangle
  fill(255); rect(180, 10, 200, 50, 5);
  
  // Text amb data seleccionada
  fill(0); textAlign(LEFT); textSize(24);
  text(dataCalendari, 190, 45);
  
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
  
  if(c.bNext.mouseOverButton()){
    c.nextMonth();
  }
  
  if(c.bPrev.mouseOverButton()){
    c.prevMonth();
  }
  
  if(c.bOK.mouseOverButton() && c.dateSelected){
    dataCalendari = c.selectedDay +"/"+ c.selectedMonth + "/"+ c.selectedYear;
    c.visible = false;
  }
}
