// Classe Botó

class FaveButton {

  // Propietats d'un botó:
  float x, y, r;  // Posició i dimensions

  PImage iconaFave, iconaNoFave;       // Icones del botó
  boolean favorite;                  // Favorit / No Favorit

  // Mètode Constructor
  FaveButton(PImage icona1, PImage icona2, float x, float y, float r, boolean fave) {
    this.iconaFave = icona1;
    this.iconaNoFave = icona2;
    this.x = x;
    this.y = y;
    this.r = r;
    this.favorite = fave;
  }

  // Setters

  void setFavorite(boolean b) {
    this.favorite = b;
  }

  void toggleFavorite() {
    this.favorite = !this.favorite;
  }

  // Dibuixa el botó
  void display() {
    pushStyle();   
    imageMode(CENTER);
    if (this.favorite) {
      image(iconaFave, this.x, this.y, 2*this.r, 2*this.r);
    } else {
      image(iconaNoFave, this.x, this.y, 2*this.r, 2*this.r);
    }
    popStyle();
  }

  // Indica si el cursor està sobre el botó
  boolean mouseOverButton() {
    return dist(mouseX, mouseY, this.x, this.y)<= this.r;
  }
  
  // Canvia l'estat de favorit en fer click a sobre
  void checkMouseClick(){
    if(mouseOverButton()){
      toggleFavorite();
    }
  }
}
