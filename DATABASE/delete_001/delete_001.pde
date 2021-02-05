// Llibreria de MySQL i Processing
import de.bezier.data.sql.*;

// Components de la GUI
Button b1, b2, b3;   // Botons
Select s;            // Seleccionable
PopUp p;             // PopUp
Confirm c;           // Confirmació
DataTable t;         // Taula de BD

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

// Dimensions del PopUp, Confirm i Botons
float popW = 600, popH = 340;
float confW = 600, confH = 340;
float buttonW = 120, buttonH = 60;

// Textos del PopUp
String title = "Informació!";
String message1 = "S'ha actualitzat la Base de Dades.";
String message2 = "Vols eliminar aquesta informació?";

void setup(){
  
  size(1200, 900);      // Dimensions de la Pantalla
  
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
  b2 = new Button("NEXT", 25 + tableW, 240 + tableH, buttonW, buttonH);
  b3 = new Button("PREV", 25 + tableW - buttonW*1.5, 240 + tableH, buttonW, buttonH);
  
  
  // Creació del PopUp
  p = new PopUp(title, message1, 250, 250, popW, popH);
  p.setVisible(false);
  
  // Creació del Confirm
  c = new Confirm(title, message2, 250, 250, confW, confH);
  c.setVisible(false);
}

void draw(){
 
  background(205);
  
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
  
  // Dibuixa el confirm
  c.display();
  
  // Actualitza el cursor
  updateCursor();
  
}

// Mira si pitjam sobre els botons
void mousePressed() {
   
  // Pitjam sobre el botó de BORRAR
   if(b1.mouseOverButton() && b1.enabled){
     
     // Mostra el Confirm
     c.setVisible(true);
   }
   // Pitjam sobre el botó de ACEPTAR del Confirm
   else if(c.bAceptar.mouseOverButton()){
     
     // Amagam el Confirm
     c.setVisible(false);
     
     // Agafar el valor Id del Select
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
  // Pitjam sobre el botó de CANCELAR del Confirm
  else if(c.bCancelar.mouseOverButton()){
    
    // Amagam el Confirm
    c.setVisible(false);
    
  }
  // Si pitjam el botó NEXT
  else if(b2.mouseOverButton() && b2.enabled){
    t.nextPage();
  }
  // Si pitjam el botó PREVIOUS
  else if(b3.mouseOverButton() && b3.enabled){
    t.prevPage();
  }
  // Si pitjam el botó ACEPTAR del PopUp
  else if(p.bAceptar.mouseOverButton() && p.bAceptar.enabled){
    p.setVisible(false);
  }
  // Si pitjam sobre el select s
  else if(s.mouseOverSelect() && s.enabled){
    if(!s.collapsed){
      // Actualitzar valor
      s.update();      
      println("Index: "+s.selectedIndex+",Id: "+s.selectedId+", Text:"+s.selectedValue);
    }
    // Plegar o desplegar
    s.toggle();        
  }
}


// Modifica el cursor
void updateCursor(){
  
  if(b1.mouseOverButton() || b2.mouseOverButton() || b3.mouseOverButton() ||
      p.mouseOverButton() || c.mouseOverButtons()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
