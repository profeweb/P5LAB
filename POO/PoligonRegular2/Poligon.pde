class Poligon {

  // Atributs
  Punt[] punts;
  int numPunts;

  //Constructor
  Poligon(int num) {
    this.punts = new Punt[num];
    this.numPunts = num;
    float r = 300, a = 0;
    float stepA = TWO_PI / num;
    int n = 65;
    for (int i=0; i<num; i++) {
      float x = width/2  + r*cos(a);
      float y = height/2 + r*sin(a);
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


  // Altres mètodes

  void print() {
    System.out.println("Poligon: ");
    for (int i=0; i<numPunts; i++) {
      if (this.punts[i]!=null) {
        this.punts[i].print();
      }
    }
  }

  void display() {

    // Dibuixa la línia entre els punts i l'interior
    stroke(255, 0, 0); 
    strokeWeight(3); 
    fill(255, 0, 0, 50);
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
}
