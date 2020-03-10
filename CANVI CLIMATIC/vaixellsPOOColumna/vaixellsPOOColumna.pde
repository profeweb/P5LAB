import processing.pdf.*;
import java.util.*;

// Array amb nom dels Mesos
String[] mes = {"Gener", "Febrer", "Març", "Abril", "Maig", "Juny", "Juliol", "Agost", "Setembre", "Octubre", "Novembre", "Desembre"};
// Array on guardar les imatges dels Vaixells
PShape[] img;

// Array de Vaixells
Vaixell[] vaixells;
int numVaixells;

// Número de Mes actual
int numMes = 1;

// Guardar en PDF
boolean recordPDF = false;

void setup(){
  
  size(1884,980);
  
  // Carregar les imatges dins l'Array
  img = new PShape[8];
  for(int i=0; i<=7; i++){
    img[i] = loadShape("barca"+i+".svg");
  }
  
  // Crea un Array amb les línies del fitxer CSV
  String[] csv = loadStrings("vaixellsPalma2019.csv");
  
  // Crea Array per guardar la informació dels Vaixells
  vaixells = new  Vaixell[csv.length];
  
  // Crea un Array per a carregar les dades de les columnes del fitxer CSV
  String[][] data = new String[csv.length][12];
  
  // Emplena Array de Vaixells amb la informació dels Vaixells
  for(int i=1; i<csv.length; i++){
    
    data[i] = csv[i].split(",");
    
    // Llegir la informació de les columnes
    String vaixell = data[i][0];
    String origen = data[i][1];
    String desti  = data[i][1];
    String entrada = data[i][3];
    Data dataEntrada = new Data(entrada);
    String sortida = data[i][4];
    Data dataSortida = new Data(sortida);
    String empresa = data[i][6];
    int gt = int(data[i][7]);
    String bandera = data[i][9];
    
    // Crea un objecte Vaixell amb la Informació corresponent
    Vaixell v = new Vaixell(vaixell, origen, desti, dataEntrada, dataSortida, empresa, bandera, gt);
    vaixells[numVaixells] = v;
    // Incrementar el número de vaixells
    numVaixells++;

  }
  
  fill(0); textSize(14); textAlign(CENTER);

}


void draw(){
  
  // Començar a guardar en PDF
  if(recordPDF){
    beginRecord(PDF, mes[(numMes-1)]+" 2019.pdf");
  }
  
  background(0, 187, 255);
  
  
  int nv=0; 
  int gtTotal = 0;
  
  // Pels 31 dies del mes
  for(int nd=1; nd<=31; nd++){
    
    fill(0);
    text(nd, 50 + (nd-1)*60, 50);
    
    int nf=0;
    
    // Cercar els vaixells
    for(int i=0; i<numVaixells; i++){
      Vaixell v = vaixells[i];
      // Que arriben aquest mes i aquest dia
      if(v.entrada.mes==numMes && v.entrada.dia==nd){
        pushMatrix();
          translate(50 + 60*(nd-1) , 100 + 60*nf);
          shapeMode(CENTER);
          shape(img[v.numImatge], 0,0);
        popMatrix();
        // Sumar el seu GT
        gtTotal+=v.gt;
        // Actualitzar el número de vaixells i el número de files
        nv++; nf++;
      }
    }
  }
  
  // Mostrar el mes, número de vaixells i GT total.
  text(mes[(numMes-1)]+" 2019", width/4, 20);
  text("Num. Vaixells:"+nv, 2*width/4, 20);
  text("GT Total:"+gtTotal, 3*width/4, 20);
  
  // Tancar el PDF i sortir
  if(recordPDF){
    endRecord();
    exit();
  }
 
}


void keyPressed(){
  // Passar al següent mes
  if(keyCode==UP && numMes<12){
    numMes++;
  }
  // Passar al mes anterior
  else if(keyCode==DOWN && numMes>1){
    numMes--;
  }
  // Activar guardar en PDF
  else if(key=='p' || key=='P'){
    recordPDF=true;
  }
}
