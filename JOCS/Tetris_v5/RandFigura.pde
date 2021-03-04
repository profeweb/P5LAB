
Figura creaFiguraRandom(){
  int n  = (int) random(0, 7);
  return creaFigura(n);
}


Figura creaFigura(int n){
  
  int f = 0;
  int rc = (int)random(0, t.numCols-4);
  
  Figura fig;
  switch(n){
    case 0:  fig = new FiguraL();  break;  
    case 1:  fig = new FiguraT();  break;
    case 2:  fig = new FiguraS();  break;
    case 3:  fig = new FiguraO();  break;
    case 4:  fig = new FiguraI();  break;
    case 5:  fig = new FiguraLI(); break;
    case 6:  fig = new FiguraSI(); break;
    default: fig = new FiguraO();  break;
  }
  
  fig.setPosicio(f, rc);
  return fig;
}
