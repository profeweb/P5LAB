class Quadrat extends Poligon {

  // Constructor
  Quadrat(Punt2D c, float d) {
    super(4);
    setPuntAt(0, c);
    setPuntAt(1, new Punt2D(c.x + d, c.y));
    setPuntAt(2, new Punt2D(c.x + d, c.y + d));
    setPuntAt(3, new Punt2D(c.x, c.y + d));
  }

  // Altres
  @Override   
    void imprimir() {
    System.out.println("El quadrat està format pels punts:");
    for (int i=0; i<punts.length; i++) {
      punts[i].imprimir();
    }
  }
}
