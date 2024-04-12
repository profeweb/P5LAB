import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class pagedtable_002 extends PApplet {

// Components de la GUI

// Botons
Button b1, b2;

// Dimensions dels botons
float buttonW = 60;
float buttonH = 60;

// Taula Paginada
PagedTable t;

// Dimensions de la taula
float tableW = 800, tableH = 300;

// Número de files (capçalera inclosa) i columnes de la taula
int files = 5, columnes = 5;

// Títols de les columnes 
String[] headers = {"Id", "Nom", "Llinatges", "Edat", "Sexe"};

// Amplades de les columnes
float[] colWidths = {10, 20, 40, 10, 20};

// Número lletres de les columnes
int[] maxChars = {10, 10, 20, 10, 10};

// Dades de la taula
String[][] info = {
                     {"1", "Pere", "Soler Miralles De las Mercedes", "33", "Home"},
                     {"2", "Maria", "Garcia Lopez", "25", "Dona"},
                     {"3", "Joan Jose Maria", "Melis Cabrer", "47", "Home"},
                     {"4", "Bel", "Riera Mates", "52", "Dona"},
                     {"5", "Jose", "Perez Galdós", "37", "Home"},
                     {"6", "Pere", "Soler Miralles", "33", "Home"},
                     {"7", "Maria", "Garcia Lopez", "25", "Dona"},
                     {"8", "Joan", "Melis Cabrer", "47", "Home"},
                     {"9", "Bel", "Riera Mates", "52", "Dona"},
                     {"10", "Jose", "Perez Galdós", "37", "Home"},
                     {"11", "Pere", "Soler Miralles", "33", "Home"},
                     {"12", "Maria", "Garcia Lopez", "25", "Dona"},
                     {"13", "Joan", "Melis Cabrer", "47", "Home"},
                     {"14", "Bel", "Riera Mates", "52", "Dona"},
                     {"15", "Jose", "Perez Galdós", "37", "Home"},
                  };

public void setup(){
  
        // Dimensions de la Pantalla
  
  // Creació de la taula
  t = new PagedTable(files, columnes);
  t.setHeaders(headers);
  t.setData(info);
  t.setColumnWidths(colWidths);
  t.setColumnMaxChars(maxChars);
  
  
  // Creació dels botons
  b1 = new Button("NEXT", 25 + tableW/2 + buttonW/1.5f, tableH + 80, buttonW, buttonH);
  b2 = new Button("PREV", 25 + tableW/2 - buttonW/1.5f, tableH + 80, buttonW, buttonH);
  
}

public void draw(){
 
  background(255);
  
  // Dibuixa la taula
  t.display(50, 50, tableW, tableH);
  
  // Dibuixa els botons
  b1.display();
  b2.display();
  
  // Actualitza forma del cursor
  updateCursor();
  
}

// En cas de pitjar el ratolí
public void mousePressed(){
  
  if(b1.mouseOverButton() && b1.enabled){
    t.nextPage();
  }
  else if(b2.mouseOverButton() && b2.enabled){
    t.prevPage();
  }
}

// Modifica el cursor
public void updateCursor(){
  
  if((b1.mouseOverButton() && b1.enabled)||
     (b2.mouseOverButton() && b2.enabled)){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}

public void keyPressed(){
  if(keyCode==LEFT){
    t.prevPage();
  }
  else if(keyCode==RIGHT){
    t.nextPage();
  }
}
// Classe Botó

class Button {
  
 // Propietats d'un botó:
 float x, y, w, h;  // Posició i dimensions
 // Colors de contorn, farciment, actiu i desactiu
 int fillColor, strokeColor;
 int fillColorOver, fillColorDisabled;
 String textBoto;  // Text
 boolean enabled;  // Abilitat / desabilitat
 
 // Mètode Constructor
 Button(String text, float x, float y, float w, float h){
   this.textBoto = text;
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   this.enabled = true;
   fillColor = color(200, 100, 100);
   fillColorOver = color(255, 55, 155);
   fillColorDisabled = color(150);
   strokeColor = color(0);
 }
 
 // Setters
 
 public void setEnabled(boolean b){
   this.enabled = b;
 }
 
 // Dibuixa el botó
 public void display(){
   
   pushStyle();
   
   if(!enabled){
     fill(fillColorDisabled);  // Color desabilitat
   }
   else if(mouseOverButton()){
     fill(fillColorOver);      // Color quan ratolí a sobre
   }
   else{
     fill(fillColor);          // Color actiu però ratolí fora
   }
   stroke(strokeColor); strokeWeight(2);        //Color i gruixa del contorn
   rect(this.x, this.y, this.w, this.h, 10);    // Rectangle del botó
   
   // Text (color, alineació i mida)
   fill(0); textAlign(CENTER); textSize(16);
   text(textBoto, this.x + this.w/2, this.y + this.h/2 + 10);
   
   popStyle();
 }
 
 // Indica si el cursor està sobre el botó
 public boolean mouseOverButton(){
   return (mouseX >= this.x) && 
          (mouseX<=this.x + this.w) && 
          (mouseY>= this.y) && 
          (mouseY<= this.y + this.h); 
 }
  
}

class PagedTable {

  String[] tableHeaders;   // Títols de les columnes
  String[][] tableData;    // Dades de la taula
  float[] columnWidths;    // Amplades de les columnes
  int[] maxCaracters;    // Maxim de lletres de les columnes
  
  int numCols, numRows;  // Número de files i columnes
  
  int numPage;
  int numTotalPages;
  
  // Constructor
  PagedTable(int nr, int nc){
    this.numRows = nr;
    this.numCols = nc;
    this.numPage = 0;
  }
  
  // Setters
  
  public void setHeaders(String[] h){
    this.tableHeaders = h;
  }
  
  public void setData(String[][] d){
    this.tableData = d;
    if(d.length % (this.numRows-1)==0){
      this.numTotalPages = (d.length / (this.numRows-1)) -1;
    }
    else {
      this.numTotalPages = (d.length / (this.numRows-1)) ;
    }
  }
  
  public void setValueAt(String value, int nr, int nc){
    this.tableData[nr][nc] = value;
  }
  
  public void setColumnWidths(float[] w){
    this.columnWidths = w;
  }
  
  public void setColumnMaxChars(int[] c){
    this.maxCaracters = c;
  }
  
  public void nextPage(){
    if(this.numPage<this.numTotalPages){
      this.numPage++;
    }
  }
  
  public void prevPage(){
    if(this.numPage>0){
      this.numPage--;
    }
  }
  
  // Dibuixa taula
  public void display(float x, float y, float w, float h){
    
    pushStyle();
    
    fill(200, 50); stroke(0);strokeWeight(3);
    rect(x, y, w, h);
    
    float rowHeight = h / numRows;
    fill(200, 100, 100); stroke(0);strokeWeight(3);
    rect(x, y, w, rowHeight);
    
    // Dibuixa files
    stroke(0);
    for(int r = 1; r <numRows; r++){
      if(r==1){ strokeWeight(3); }
      else {    strokeWeight(1); }
      line(x, y + r*rowHeight, x + w, y + r*rowHeight);
    }
    
    // Dibuixa Columnes
    float xCol = x;
    for(int c = 0; c<numCols; c++){
      xCol += w*columnWidths[c]/100.0f;
      line(xCol, y, xCol, y + h);
    }
    
    // Dibuixa textos
    fill(0); textSize(24);
    for(int r = 0; r < numRows; r++){
      xCol = x;
      for(int c = 0; c< numCols; c++){
        if(r==0){
          text(tableHeaders[c], xCol + 10, y + (r+1)*rowHeight - 10);
        }
        else{
          int k = (numRows-1)*numPage + (r-1);
          if(k<tableData.length){
            String t = retallaText(tableData[k][c], maxCaracters[c]);
            text(t, xCol + 10, y + (r+1)*rowHeight - 10);
          }
        }
        xCol += w*columnWidths[c]/100.0f;
      }
    }
    
    // Informació de la Pàgina
    fill(0);
    text("Pag: "+(this.numPage+1)+" / "+(this.numTotalPages+1), x, y + h + 50);
    
    popStyle();
  }
  
  
  public String retallaText(String allText, int maxLength){
    String t = allText.substring(0, min(maxLength, allText.length()));
    if(!allText.equals(t)){
       t+="...";
    }
    return t;
  }
  
  
}
  public void settings() {  size(1200, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "pagedtable_002" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
