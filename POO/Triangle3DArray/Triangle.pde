class Triangle {

  // Atributs
  Punt[] punts;

  //Constructor
  Triangle(Punt a, Punt b, Punt c){
    punts = new Punt[3];
    this.punts[0] = a;
    this.punts[1] = b;
    this.punts[2] = c;
  }

  // Getters

  Punt getPunt(int n){
    return this.punts[n];
  }

  // Setters

  void setPunt(int n, Punt p){
    this.punts[n] = p;
  }


  // Altres mètodes

  void print(){
    System.out.println("Triangle: ");
    for(int i=0; i<3; i++){
      this.punts[i].print();
    }
  }
  
  void display(){
    
    // Dibuixa la línia entre els punts i l'interior
    stroke(255,0,0); strokeWeight(3); fill(255,0,0,50);
    beginShape();
    for(int i=0; i<3; i++){
      vertex(this.punts[i].x, this.punts[i].y, this.punts[i].z);
    }
    endShape(CLOSE);
    
    // Dibuixa els punts (0, 1 i 2)
    for(int i=0; i<3; i++){
      this.punts[i].display();
    }
  }
}
