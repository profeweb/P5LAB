class Poligon {
  
  // Atributs
  Punt2D[] punts;
  
  // Constructor
  Poligon(int n){
    punts = new Punt2D[n];
  }
  
  // Setter
  void setPuntAt(int i, Punt2D p){
    punts[i] = p;
  }
  
  // Getter
  Punt2D getPuntAt(int i){
    return punts[i];
  }
  
  // Altres
  void imprimir(){
    println("El polígon està format pels punts:");
    for(int i=0; i<punts.length; i++){
      punts[i].imprimir();
    }
  }
  
  void display(color c){
    
    fill(c);
    beginShape();
    for(int i=0; i<punts.length; i++){
      vertex(punts[i].x, punts[i].y);
    }
    endShape(CLOSE);
    
    for(int i=0; i<punts.length; i++){
      punts[i].display();
    }
  }
  
}
