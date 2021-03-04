
enum Pantalla {MENU, JOC};
Pantalla pantalla = Pantalla.MENU;

Tauler t;
Figura figActual;
FigList figs;
boolean gameOver = false;
int numLinies = 0;

void setup(){
  
  size(800, 800);
  frameRate(5);
  
  t = new Tauler(10,20, 200, 0, 400, 800);
  figs = new FigList();
  figActual = figs.nextFigura();
}


void draw(){
  
  switch(pantalla){
    case MENU:  pantallaMenu(); break;
    case JOC:   pantallaJoc(); break;
  }
  
}
