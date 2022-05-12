class Poligon {

  // Atributs
  Punt[] punts;
  int numPunts;
  color c;

  //Constructor
  Poligon(int num, float xc, float yc, float r) {
    this.punts = new Punt[num];
    this.numPunts = num;
    float a = 0;
    float stepA = TWO_PI / num;
    int n = 65;
    for (int i=0; i<num; i++) {
      float x = xc  + r*cos(a);
      float y = yc + r*sin(a);
      char lletra = (char) n;
      Punt pi = new Punt(String.valueOf(lletra), x, y, 0);
      this.setPunt(i, pi);
      a += stepA;
      n++;
    }
  }

  // Getters

  Punt getPunt(int i) {
    return this.punts[i];
  }

  // Setters

  void setPunt(int i, Punt p) {
    this.punts[i] = p;
  }
  
  void setColor(color c){
    this.c = c;
  }


  // Altres mètodes

  void print() {
    System.out.println("Poligon: ");
    for (int i=0; i<numPunts; i++) {
      if (this.punts[i]!=null) {
        this.punts[i].print();
      }
    }
  }

  void display(color c) {

    // Dibuixa la línia entre els punts i l'interior
    stroke(255, 0, 0); 
    strokeWeight(3); 
    fill(c, 50);
    beginShape();
    for (int i=0; i<punts.length; i++) {
      vertex(this.punts[i].x, this.punts[i].y, this.punts[i].z);
    }
    endShape(CLOSE);

    // Dibuixa els punts del poligon
    for (int i=0; i<numPunts; i++) {
      this.punts[i].display();
    }
  }
  
  void display(){
    display(this.c);
  }
}
