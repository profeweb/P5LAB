class Triangle {

  // Atributs
  Punt a , b, c;

  //Constructor
  Triangle(Punt a, Punt b, Punt c){
    this.a = a;
    this.b = b;
    this.c = c;
  }

  // Getters

  Punt getPuntA(){
    return this.a;
  }

  Punt getPuntB(){
    return this.b;
  }

  Punt getPuntC(){
    return this.c;
  }

  // Setters

  void setPuntA(Punt p){
    this.a = p;
  }

  void setPuntB(Punt p){
    this.b = p;
  }

  void setPuntC(Punt p){
    this.c = p;
  }


  // Altres mètodes

  void print(){
    System.out.println("Triangle: ");
    this.a.print();
    this.b.print();
    this.c.print();
  }
  
  void display(){
    
    // Dibuixa la línia entre els punts a, b i c
    /*
    stroke(255,0,0); strokeWeight(3);
    line(this.a.x, this.a.y, this.a.z, this.b.x, this.b.y, this.b.z);
    line(this.c.x, this.c.y, this.c.z, this.b.x, this.b.y, this.b.z);
    line(this.a.x, this.a.y, this.a.z, this.c.x, this.c.y, this.c.z);
    */
    
    // Dibuixa la línia entre els punts i l'interior
    stroke(255,0,0); strokeWeight(3); fill(255,0,0,50);
    beginShape();
      vertex(this.a.x, this.a.y, this.a.z);
      vertex(this.b.x, this.b.y, this.b.z);
      vertex(this.c.x, this.c.y, this.c.z);
    endShape(CLOSE);
    
    // Dibuixa els punts a, b i c
    this.a.display();
    this.b.display();
    this.c.display();
  }
}
