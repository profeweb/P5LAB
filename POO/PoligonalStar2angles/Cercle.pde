class Cercle {

  // Atributs
  Punt centre;
  float radi;

  //Constructor
  Cercle(Punt c, float r){
    this.centre = c;
    this.radi = r;
  }

  // Getters

  Punt getCentre(){
    return this.centre;
  }

  float getRadi(){
    return this.radi;
  }

  // Setters

  void setCentre(Punt p){
    this.centre = p;
  }

  void setRadi(float r){
    this.radi = r;
  }


  // Altres mètodes

  void print(){
    System.out.println("Cercle: ");
    System.out.print("\tCentre: ");
    this.centre.print();
    System.out.print("\tRadi: "+this.radi);
  }
  
  void display(){
    // Dibuixa el cercle
    pushMatrix();
      translate(this.centre.x, this.centre.y, this.centre.z);
      ellipseMode(CENTER); fill(255, 0, 0, 50); stroke(0);
      ellipse(0,0,this.radi*2, this.radi*2);
    popMatrix();
    // Dibuixa el punt del centre del cercle
    centre.display();
  }
}
