class FigList {
 
  IntList figs;
  
  FigList(){
    figs = new IntList();
    addFigNumbers();
    shuffleFigs();
  }
  
  void addFigNumbers(){
    for(int f=0; f<7; f++){
      figs.append(f);
    }
  }
  
  void shuffleFigs(){
    figs.shuffle();
  }
  
  Figura nextFigura(){
    int nf = figs.get(0);
    figs.remove(0);
    println("CREA FIGURA "+nf);
    return creaFigura(nf);
  }
  
  boolean isEmpty(){
    return figs.size()==0;
  }
  
}
