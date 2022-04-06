PImage img;

boolean colorselected= false;
boolean errorLogin = false;
boolean comprovaLogin;
boolean logged = false;
float cardsW = 1100, cardsH = 800;
Result rs = null;
int numCardsPage = 4;
PagedResults pc;

PopUp pop;             // PopUp
// Dimensions del PopUp
float popW = 600, popH = 340;
// Textos del PopUp
String title = "Informació!";
String message = "S'ha actualitzat la Base de Dades.";

String titol="fitxer.txt";
String ruta ="C:\\Users\\tonim\\Documents\\CODE\\P5LAB\\GUI\\textfileSave_001\\data\\";

Button bGuardar, bSRecientes, bRGrafico, bBElementos, bFecha, bVariables, bCerca, bEnter, bEliminar;
Button br1, br2;
boolean bVariablesShow = false;
TextField textDream, cercaText, tittleDream;
TextArea areaText;
ImageButton ib, bLogo, bDelete;
Calendari c;
SwitchButton b1, b2;
Select selCategoria, selGrafico, selUsuario, selEmail, s4;
BarsDiagram diagrama;
SwitchFilterArray sfa, sfc;
TextField userText, passText;
String tipoGrafico="Etiquetas";

int sfW = 800;
int sfH = 40;

String[][] inforesults = {
  {"1", "Títol 1", "10/03/2022", "Descripció 1", "S", "pesadilla", "paco@gmail.com", "Label1,Label2,Label3,Label4"}, 
  {"2", "Títol 2", "10/03/2022", "Descripció 2", "S", "pesadilla", "paco@gmail.com", "Label1,Label2,Label3"}, 
  {"3", "Títol 3", "10/03/2022", "Descripció 3", "N", "pesadilla", "paco@gmail.com", "Label1,Label3"}, 
  {"4", "Títol 4", "10/03/2022", "Descripció 4", "S", "pesadilla", "paco@gmail.com", "Label2,Label3"}, 
  {"5", "Títol 5", "10/03/2022", "Descripció 5", "N", "pesadilla", "paco@gmail.com", "Label1,Label2,Label3,Label4"}, 
  {"6", "Títol 6", "10/03/2022", "Descripció 6", "S", "pesadilla", "paco@gmail.com", "Label1,Label3"}, 
  {"7", "Títol 7", "10/03/2022", "Descripció 7", "N", "pesadilla", "paco@gmail.com", "Label1,Label2,Label3"}, 
};


boolean viewCalendar = false;
PImage img1, img2, img3, img4, img5, img6;

// Dimensions dels botons
float buttoniW = 50;
float buttoniH = 50;


// Botons del Menú Principal

// Creació dels elements de la GUI
void setGUI() {
  initButtons();
  initTextField();
  initTextArea();
  initCalendari();
  initSelect();
  initBarsDiagram();
  initFilter();
  initTextFieldlogin();
  pagedResults();
  //initPopUp();
}

// Creació dels botons de la GUI
void initButtons() {
  // Dimensions dels botons
  int buttonH = 60, buttonW = 100;
  int buttonH1= 60, buttonW1 =320;
  int buttonH2= 30, buttonW2=200;

  bGuardar    = new Button("Guardar", width-buttonW-width/15, height/10*7, buttonW2, buttonH2);
  bSRecientes   = new Button("SUEÑOS RECIENTES", 2*marginH + logoWidth, marginV, buttonW1, buttonH1);
  bRGrafico= new Button("REGISTRO GRAFICO", 2*marginH + logoWidth+ banner1Width +margeseparacio, marginV, buttonW1, buttonH1);
  bBElementos= new Button("BÚSQUEDA POR ELEMENTOS", 2*marginH + logoWidth+ 2*banner1Width +2*margeseparacio, marginV, buttonW1, buttonH1);
  bFecha= new Button("Fecha", width/2+textAreaWidth/2+30, height/8, buttonW2, buttonH2);
  b1 = new SwitchButton(1200, 200, buttonW3, buttonH3);
  bCerca    = new Button("Buscar", width/5*3, height/10*7, buttonW, buttonH);
  bEliminar = new Button("Eliminiar", width/2+textAreaWidth/2+30, height/10*7, buttonW, buttonH);


  bVariables= new Button ("Grafico", logoWidth+pageWidth/11, pageHeight/15, 100, 40);
  bEnter = new Button("Entrar", width/2-buttonW/2, height/2+100, buttonW, buttonH);

  img1 = loadImage("../data/imgs/Afegir.png");
  img2 = loadImage("../data/imgs/Afegir.png");
  img3 = loadImage("../data/imgs/Afegir.png");
  PImage[] buttonImages = {img1, img2, img3};
  ib = new ImageButton(buttonImages, W/2-15, H-190, buttoniW, buttoniH);

  img4 = loadImage("../data/imgs/Logo.PNG");
  PImage[] buttonLogo = {img4, img4, img4};
  bLogo = new ImageButton (buttonLogo, marginH, marginV, logoWidth, logoHeight);
}


// Activar els botons del menú
void enableButtons() {
  bGuardar.setEnabled(true);
}

void initTextField() {
  tittleDream=new TextField(250, height/30*2, width/6*2, 50);
  textDream= new TextField(200, 200, 200, 30);
  cercaText= new TextField(width/5, height/10, 400, 50);
}
void initTextArea() {
  areaText = new TextArea(250, height/30*5, textAreaWidth, height-300, 70, 13);// col. fil
}
void initCalendari() {
  c = new Calendari(1200, 250, 250, 250);
}

void initSelect() {
  String[] valoresCategorias = getNomsCategories();
  String[] valoresGraficos = { "Etiquetas", "Categorias", "Lucidez"};
  String[] valoresEmails = getEmailsUsuaris();

  float selectW = 200;
  float selectH = 30;
  float selectW2 = 200;
  float selectH2= 30;

  selCategoria = new Select(valoresCategorias, 1250, 275, selectW, selectH);
  selGrafico= new Select(valoresGraficos, logoWidth+pageWidth/11, pageHeight/10+20, selectW2, selectH2);
  selUsuario= new Select(valoresEmails, width/5, height/10*2, selectW2, selectH2);
  selEmail = new Select(valoresEmails, 1250, 400, selectW2, selectH2);
  s4= new Select(valoresCategorias, width/5*3, height/10*2, selectW2, selectH2);
}


void initBarsDiagram() {

  String[] textos;
  float[] values;
  
  if (tipoGrafico=="Etiquetas") {
    textos = getNomsEtiquetes();
    values = getNumSomnisEtiquetas(textos);
  } else if (tipoGrafico=="Categorias") {
    textos = getNomsCategories();
    values = getNumSomnisCategorias(textos);
  } else {
    textos = new String[2];
    textos[0] = "Lúcido";
    textos[1]="No Lúcido";
    
    values = new float[2];
    values[0] = getNumSomnisLucidos();
    values[1] = getNumSomnisNoLucidos();
  }

  color[] colors = {color(0, 0, 255), color(50, 50, 200), 
    color(255, 0, 0), color(0, 255, 0)};

  diagrama = new BarsDiagram(50, 50, width/1.2, height/1.2);
  diagrama.setTexts(textos);
  diagrama.setValues(values);
  diagrama.setColors(colors);
}
void initFilter() {
  sfa = new SwitchFilterArray(width/5, height-100, sfW, sfH);
  // Establim les etiquetes (noms) dels filtres
  String[] info = getNomsEtiquetes();
  sfa.setData(info);

  sfc = new SwitchFilterArray(width/5, height/5*3, sfW, sfH);
  // Establim les etiquetes (noms) dels filtres
  sfc.setData(info);
}

void initTextFieldlogin() {
  userText = new TextField(width/2-100, height/2, 200, 35);
  passText = new TextField(width/2-100, height/2+50, 200, 35);
}

void pagedResults() {
  pc = new PagedResults(numCardsPage);
  String[][] inforesults = todosSuenos();
  printArray2D(inforesults);
  for(int i=0; i<inforesults.length; i++){
    int ids = Integer.valueOf(inforesults[i][0]);
    inforesults[i][7]=array2String(getEtiquetasSueno(ids));
  }
  pc.setData(inforesults);
  pc.setCards();

  // Creació dels botons
  float buttonW = 60;
  float buttonH = 60;

  br1 = new Button("NEXT", 100 + cardsW, 80, buttonW, buttonH);
  br2 = new Button("PREV", 100 + cardsW, 100 + buttonH, buttonW, buttonH);
}

void filterResults(String email, String categoria, String etiquetas, String buscar) {
  pc = new PagedResults(numCardsPage);
  String[][] inforesults = filtraSuenos(email,categoria, etiquetas, buscar);
  for(int i=0; i<inforesults.length; i++){
    int ids = Integer.valueOf(inforesults[i][0]);
    inforesults[i][7]=array2String(getEtiquetasSueno(ids));
  }
  pc.setData(inforesults);
  pc.setCards();
}

void initPopup(){
  // Creació del PopUp
  pop = new PopUp(title, message, 250, 250, popW, popH);
  pop.setVisible(false);
}
