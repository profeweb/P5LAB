
class Poliedre {
  
  color[] colors = {color(255, 0, 0), color(0, 255, 0), 
                    color(0, 0, 255), color(255, 255, 0),
                    color(0, 255, 255), color(255, 0, 255)
                  };
  
  Poligon[] poligons;
  
  Poliedre(int n){
    this.poligons = new Poligon[n];
  }
  
  void setPoligon(int i, Poligon p){
    this.poligons[i] = p;
  }
  
  void display(){
    for(int i=0; i<poligons.length; i++){
      poligons[i].display(colors[i%colors.length]);
    }
  }
  
}
