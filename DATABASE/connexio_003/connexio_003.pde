// Llibreria de MySQL i Processing
import de.bezier.data.sql.*;

// Components de la GUI
// Select
Select s;

// Valors dels Select
String [] selectValues;

// Dimensions del select
float selectW = 300;
float selectH = 30;

void setup(){
  
  size(1200, 800);      // Dimensions de la Pantalla
  
  connexioBBDD();
  
  selectValues = getNomsTaulaUnitat();
  
  // Creació de la taula
  s = new Select(selectValues, width/3, height/5, selectW, selectH);
}

void draw(){
 
  background(255);
  
  // Dibuixa el select
  s.display();
  
}

// En cas de pitjar el ratolí
void mousePressed(){
  
  // Si pitjam sobre el select 1
  if(s.mouseOverSelect() && s.enabled){
    if(!s.collapsed){
      s.update();      // Actualitzar valor
      println("Seleccionat: "+s.selectedValue);
    }
    s.toggle();        // Plegar o desplegar
  }
  
}
