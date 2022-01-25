Estant e;
Llibre llibreSeleccionat = null;

String[][] info = {
  {"Quijote", "123", "Cervantes", "Caballeria", "portada00.jpg"}, 
  {"Patria", "123", "Armando Aramburu", "Drama", "portada01.jpg"}, 
  {"Celestina", "123", "Fernando de Rojas", "Clásico", "portada02.jpg"}, 
  {"La vida del Buscón", "123", "Francisco de Quevedo", "Clásico", "portada03.jpg"}, 
  {"El Italiano", "123", "Arturo Pérez Reverte", "Aventura", "portada04.jpg"}, 
  {"El Príncipe de la Niebla", "123", "Carlos Ruiz Zafón", "Novela", "portada05.jpg"}, 
  {"Destroza este Diario", "123", "Keri Smith", "Diseño", "portada06.jpg"}, 
  {"Nunca", "123", "Ken Follet", "Aventura", "portada07.jpg"}, 
  {"Marina", "123", "Carlos Ruiz Zafón", "Novela", "portada08.jpg"}, 
  {"Reina Roja", "123", "Juan Gómez", "Novela", "portada09.jpg"}, 
};

void setup() {
  size(1500, 800);

  e = new Estant(1, "Llegits", 150, 150, 800, 500, 3);
  e.afegirLlibres(info);
  e.setColor(color(200, 200, 100));
  e.setButtons("bPrev.png", "bNext.png");
}

void draw() {
  background(200, 100, 100);
  e.display();
  updateCursor();

  if (llibreSeleccionat!=null) {
    llibreSeleccionat.display(width-400, 150, 300, 500);
  }
}

void keyPressed() {
  if (keyCode==LEFT) {
    e.prev();
  } else if (keyCode==RIGHT) {
    e.next();
  }
}

void mousePressed() {
  if (!e.checkButtons()) {
    int nl = e.checkClickLlibre();
    if (nl!=-1) {
      llibreSeleccionat = e.llibres[nl];
    } else {
      llibreSeleccionat = null;
    }
  }
}

void updateCursor() {
  if (e.checkCursor()) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}
