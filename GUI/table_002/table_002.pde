// Components de la GUI
// Taula
Table t;

// Dimensions de la taula
float tableW = 800, tableH = 650;

// Número de files (capçalera inclosa) i columnes de la taula
int files = 6, columnes = 5;

// Títols de les columnes 
String[] headers = {"Id", "Producte", "Observacions", "Quants", "Preu"};

// Amplades de les columnes
float[] colWidths = {10, 20, 40, 15, 15};

// Dades de la taula
String[][] info = {
                     {"1", "Paper", "Paper amb propietats secants.", "33", "44 €"},
                     {"2", "Metall", "Propietats oxidatives i tèrmiques.", "25", "22.5 €"},
                     {"3", "Pedra", "Pes i ressistència al pas del corrent elèctric.", "47", "110 €"},
                     {"4", "Plata", "Duresa i conductivitat elèctrica considerables.", "52", "425 €"},
                     {"5", "Alumini", "Propietats conductives altes. Maleabilitat i lleugeresa.", "37", "891 €"},
                  };

void setup(){
  
  size(1200, 800);      // Dimensions de la Pantalla
  
  // Creació de la taula
  t = new Table(files, columnes);
  t.setHeaders(headers);
  t.setData(info);
  t.setColumnWidths(colWidths);
  
}

void draw(){
 
  background(255);
  
  // Dibuixa la taula
  t.display(50, 50, tableW, tableH);
  
}
