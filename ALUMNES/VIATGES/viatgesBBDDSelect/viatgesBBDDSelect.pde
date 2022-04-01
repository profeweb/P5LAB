// Select amb dades de la BBDD
Select s;

// Continent seleccionat
String continent = "";

void setup(){
  size(800,800);
  
  // Connexió
  connexioBBDD();
 
  // Dades d'una columna (nombre) d'una taula (continente)
  String[] info = getNomsContinents();
  println("\nNoms Continents:");
  printArray(info);
  
  // Constructor del select
  s = new Select(info, width/4, height/2, 300, 40);
}

void draw(){
  background(255);
  
  // Dibuixa el select
  s.display();
  
  // Continent seleccionat
  fill(0); textSize(24); textAlign(CENTER);
  text(continent, width/2, 200);
}

// En cas de pitjar el ratolí
void mousePressed(){
  
  // Si pitjam sobre el select
  if(s.mouseOverSelect() && s.enabled){
    if(!s.collapsed){
      s.update();      // Actualitzar valor
      continent = s.selectedValue;  // Asssigna valor
    }
    s.toggle();        // Plegar o desplegar
  }
}
