public class Punt {

  String nom;
  float x, y, z;

  Punt() {
    this.nom ="P";
    this.x = 0;
    this.y = 0;
    this.z = 0;
  }

  Punt(String n, float x, float y) {
    this.nom = n;
    this.x = x;
    this.y = y;
    this.z = 0;
  }
  
  Punt(String n, float x, float y, float z) {
    this.nom = n;
    this.x = x;
    this.y = y;
    this.z = z;
  }

  void setX(float x) {
    this.x = x;
  }

  void setY(float y) {
    this.y = y;
  }
  
  void setZ(float z) {
    this.z = z;
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
  
  float getZ() {
    return this.z;
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
    double z = Math.pow((this.z - altre.z), 2);
    return  Math.sqrt(x+y+z);
  }
  
  String getInfo(){
    return this.nom+"("+this.x+", "+this.y+", "+this.z+")";
  }

  void print() {
    System.out.printf("Punt:(%f, %f, %f).\n", this.x, this.y, this.z);
  }
  
  void display(){
    pushMatrix();
      translate(this.x, this.y, this.z);
      pushStyle();
        fill(0); stroke(0);
        circle(0,0, 20);
        textSize(24);
        textAlign(CENTER);
        text(getInfo(), 0, - 15);
      popStyle();
    popMatrix();
  }
}
