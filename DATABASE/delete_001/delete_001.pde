// Llibreria de MySQL i Processing
import de.bezier.data.sql.*;

// Components de la GUI
Button b1, b2, b3;   // Botons
Select s;            // Seleccionable
PopUp p;             // PopUp
DataTable t;            // Taula de BD

// Dimensions de la taula
float tableW = 950, tableH = 300;

// Número de files (capçalera inclosa) i columnes de la taula
int files = 5, columnes = 2;

// Títols de les columnes 
String[] headers = {"Número", "Unitat"};

// Amplades de les columnes
float[] colWidths = {20, 80};

// Dimensions dels components
int compW = 200, compH = 80;

// Dimensions del PopUp, Botons
float popW = 600, popH = 340;
float buttonW = 60, buttonH = 60;

// Textos del PopUp
String title = "Informació!";
String message = "S'ha actualitzat la Base de Dades.";

void setup(){
  
  size(1200, 800);      // Dimensions de la Pantalla
  
  connexioBBDD();
  
  // Creació de la Taula
  String[][]info = getInfoTaulaUnitat();
  t = new DataTable(files, columnes);
  t.setHeaders(headers);
  t.setData(info);
  t.setColumnWidths(colWidths);
  
  
  // Creació del Select
  String[][] selectValues = getInfoTaulaUnitat();
  s = new Select(selectValues, width/8, height/12, 3*compW, compH);
  
   
  // Creació dels Botons
  b1 = new Button("Eliminar", 3*width/4, height/12, compW, compH);
  b2 = new Button("NEXT", 25 + tableW/2 + buttonW/1.5, tableH + 80, buttonW, buttonH);
  b3 = new Button("PREV", 25 + tableW/2 - buttonW/1.5, tableH + 80, buttonW, buttonH);
  
  // Creació del PopUp
  p = new PopUp(title, message, 250, 250, popW, popH);
  p.setVisible(false);

}

void draw(){
 
  background(255);
  
  // Dibuixa la Taula
  t.display(width/8,200, tableW, tableH);
  
  // Dibuixa els botons
  b1.display();
  b2.display();
  b3.display();
  
  // Dibuixa el select
  s.display();
  
  // Dibuixa el popup
  p.display();
  
  // Actualitza el cursor
  updateCursor();
  
}

// Mira si pitjam sobre els botons
void mousePressed() {
   
   if(b1.mouseOverButton() && b1.enabled){
     
     // Agafar els valor Id del Select
     String id = s.getSelectedId();
     
    // Actualitza la BBDD
    deleteInfoTaulaUnitat(id);
   
    
    // Recarregar informació al select
    String[][] selectValues = getInfoTaulaUnitat();
    s.setData(selectValues);
    s.reset();
    
    // Mostra el Popup
    p.setVisible(true);
  }
  else if(b2.mouseOverButton() && b2.enabled){
    t.nextPage();
  }
  else if(b3.mouseOverButton() && b3.enabled){
    t.prevPage();
  }
  else if(p.bAceptar.mouseOverButton() && p.bAceptar.enabled){
    p.setVisible(false);
  }
  
  // Si pitjam sobre el select s
  if(s.mouseOverSelect() && s.enabled){
    if(!s.collapsed){
      // Actualitzar valor
      s.update();      
      println("Sel: "+s.selectedIndex+", "+s.selectedValue);
    }
    // Plegar o desplegar
    s.toggle();        
  }
}


// Modifica el cursor
void updateCursor(){
  
  if(b1.mouseOverButton()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
