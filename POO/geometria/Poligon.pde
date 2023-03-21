public class Poligon {

  boolean displayPoints = true;

  Punt[] punts;

  String[] noms = {"A", "B", "C", "D", "E", "F", "G", "H"};

  Poligon(Punt ... ps) {
    punts = new Punt[ps.length];
    for (int i=0; i<punts.length; i++) {
      punts[i] = ps[i];
    }
  }

  Poligon(Punt centre, float radi, int numPunts) {
    punts = new Punt[numPunts];
    float angle = 0;
    for (int i=0; i<punts.length; i++) {
      double x = centre.x + radi*Math.cos(angle);
      double y = centre.y + radi*Math.sin(angle);
      punts[i] = new Punt(noms[i], (float)x, (float)y);
      angle += 2*Math.PI / numPunts;
    }
  }


  int getNumPunts() {
    return punts.length;
  }

  void print() {
    System.out.printf("Polígon format per %d punts:\n", getNumPunts());
    for (int i=0; i<punts.length; i++) {
      punts[i].print();
    }
  }

  void display(color c) {

    if (displayPoints) {
      for (int i=0; i<punts.length; i++) {
        punts[i].display();
      }
    }

    fill(c);
    stroke(0); 
    strokeWeight(3);
    beginShape();
    for (int i=0; i<punts.length; i++) {
      vertex(punts[i].x, punts[i].y, punts[i].z);
    }
    endShape(CLOSE);
  }
}
