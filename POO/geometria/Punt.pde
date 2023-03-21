public class Punt {

  String nom;
  float x;
  float y;

  Punt() {
    this.nom ="P";
    this.x = 0;
    this.y = 0;
  }

  Punt(String n, float x, float y) {
    this.nom = n;
    this.x = x;
    this.y = y;
  }

  void setX(float x) {
    this.x = x;
  }

  void setY(float y) {
    this.y = y;
  }

  void setXY(float x, float y) {
    this.x = x;
    this.y = y;
  }

  float getX() {
    return this.x;
  }

  float getY() {
    return this.y;
  }

  float[] getXY() {
    float[] xy = new float[2];
    xy[0] = this.x;
    xy[1] = this.y;
    return xy;
  }

  double distancia(Punt altre) {
    double x =  Math.pow((this.x - altre.x), 2);
    double y = Math.pow((this.y - altre.y), 2);
    return  Math.sqrt(x+y);
  }
  
  String getInfo(){
    return this.nom+"("+this.x+", "+this.y+")";
  }

  void print() {
    System.out.printf("Punt:(%f, %f).\n", this.x, this.y);
  }
  
  void display(){
    pushStyle();
    fill(0); stroke(0);
    circle(this.x, this.y, 20);
    textSize(24);
    textAlign(CENTER);
    text(getInfo(), this.x, this.y - 15);
    popStyle();
  }
}
