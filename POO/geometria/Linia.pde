public class Linia {

  Punt a, b;

  public Linia(Punt a, Punt b) {
    this.a = a;
    this.b = b;
  }

  public Punt getA() {
    return a;
  }

  public Punt getB() {
    return b;
  }

  public void setA(Punt a) {
    this.a = a;
  }

  public void setB(Punt b) {
    this.b = b;
  }

  double llargada() {
    return this.a.distancia(this.b);
  }

  void print() {
    System.out.println("Línia formada per:");
    this.a.print();
    this.b.print();
  }
  
  void display(color c){
    pushStyle();
      stroke(c);
      strokeWeight(3);
      line(this.a.x, this.a.y, this.b.x, this.b.y);
    popStyle();
  }
}
