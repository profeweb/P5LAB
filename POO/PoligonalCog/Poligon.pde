class Poligon {

  // Atributs
  Punt[] punts;
  int numPunts;

  //Constructor
  Poligon(int n){
    this.punts = new Punt[n];
    this.numPunts = n;
  }

  // Getters

  Punt getPunt(int i){
    return this.punts[i];
  }

  // Setters

  void setPunt(int i, Punt p){
    this.punts[i] = p;
  }


  // Altres mètodes

  void print(){
    System.out.println("Poligon: ");
    for(int i=0; i<numPunts; i++){
      if(this.punts[i]!=null){
        this.punts[i].print();
      }
    }
  }
  
  void display(){
    
    // Dibuixa la línia entre els punts i l'interior
    stroke(255,0,0); strokeWeight(3); fill(255,0,0,50);
    beginShape();
    for(int i=0; i<numPunts; i++){
      vertex(this.punts[i].x, this.punts[i].y, this.punts[i].z);
    }
    endShape(CLOSE);
    
    // Dibuixa els punts del poligon
    for(int i=0; i<numPunts; i++){
      this.punts[i].display();
    }
  }
}
