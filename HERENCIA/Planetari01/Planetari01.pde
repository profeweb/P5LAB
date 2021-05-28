// Tipus enumerat
static enum Tipus {ESTRELLA, PLANETA, SATELIT, COMETA};

// Variables de classe CosAtronomic
CosAstronomic c1, c2, c3, c4;

void setup(){
    size(500,500);
    // Instanciació d'objectes CosAstronomic
    c1 = new CosAstronomic("Sol", Tipus.ESTRELLA, "2609");
    c2 = new CosAstronomic("Terra", Tipus.PLANETA, "2641");
    c3 = new CosAstronomic("Lluna", Tipus.SATELIT, "263D");
    c4 = new CosAstronomic("Haley", Tipus.COMETA, "2604");
}

void draw(){
    background(255);
    // Dibuixa els objectes CosAstronomic
    c1.display(width/2, 100);
    c2.display(width/2, 200);
    c3.display(width/2, 300);
    c4.display(width/2, 400);
}
