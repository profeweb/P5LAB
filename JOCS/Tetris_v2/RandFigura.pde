
Figura creaFiguraRandom(){
  
  int f = 0;
  int rc = (int)random(0, t.numCols-4);
  FiguraZ fig = new FiguraZ();
  fig.setPosicio(f, rc);
  return fig;
}
