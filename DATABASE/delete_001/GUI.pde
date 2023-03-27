
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
