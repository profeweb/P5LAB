class Triangle {

  // Atributs
  Punt[] punts;

  //Constructor
  Triangle(Punt a, Punt b, Punt c){
    this.punts = new Punt[3];
    this.punts[0] = a;
    this.punts[1] = b;
    this.punts[2] = c;
  }

  // Getters

  Punt getPuntA(){
    return this.punts[0];
  }

  Punt getPuntB(){
    return this.punts[1];
  }

  Punt getPuntC(){
    return this.punts[2];
  }

  // Setters

  void setPuntA(Punt p){
    this.punts[0] = p;
  }

  void setPuntB(Punt p){
    this.punts[1] = p;
  }

  void setPuntC(Punt p){
    this.punts[2] = p;
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
    
    // Dibuixa els punts del triangle
    for(int i=0; i<3; i++){
      this.punts[i].display();
    }
  }
}
