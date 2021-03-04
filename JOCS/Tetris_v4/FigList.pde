class FigList {
 
  IntList figs;
  
  FigList(){
    figs = new IntList();
  }
  
  void addFigNumbers(){
    for(int f=1; f<=7; f++){
      figs.append(f);
    }
  }
  
  void shuffleFigs(){
    figs.shuffle();
  }
  
  //int get
  
}
