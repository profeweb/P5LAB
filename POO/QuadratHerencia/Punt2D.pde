class Punt2D {

    // Atributs
    float x, y;
    String nom;

    // Constructor
    Punt2D(String n, float x, float y){
        this.nom = n;
        this.x = x;
        this.y = y;
    }

    Punt2D(float x, float y){
        this.nom = "A";
        this.x = x;
        this.y = y;
    }

    public float getX() {
        return x;
    }

    public void setX(float x) {
        this.x = x;
    }

    public float getY() {
        return y;
    }

    public void setY(float y) {
        this.y = y;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setXY(float x, float y){
        this.x = x;
        this.y = y;
    }

    void imprimir(){
        System.out.printf("Punt %s(%f, %f).%n", nom, x, y);
    }
    
    void display(){
      fill(255, 0, 0); circle(x, y, 10);
      textSize(18);
      fill(0); text(nom + "("+x+","+y+")", x + 10, y + 5);
    }
}
