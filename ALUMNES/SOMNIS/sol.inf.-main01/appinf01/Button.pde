
class Button {

  // Propietats d'un botó
  float x, y, w, h;
  color fillColor, strokeColor;
  color fillColorOver, fillColorDisabled;
  String textBoto;
  boolean enabled;

  // Mètode Constructor
  Button(String text, float x, float y, float w, float h) {
    this.textBoto = text;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.enabled = true;
    fillColor = color(255);
    fillColorOver = color(colorA);
    fillColorDisabled = color(150);
    strokeColor = color(0);
  }

  // Setters

  void setEnabled(boolean b) {
    this.enabled = b;
  }

  // Dibuixa el botó
  void display() {
    pushStyle();
    if (!enabled) {
      fill(fillColorDisabled);
    } else if (mouseOverButton()) {
      fill(fillColorOver);
    } else {
      fill(fillColor);
    }
    stroke(strokeColor); 
    strokeWeight(2);
    rect(this.x, this.y, this.w, this.h, 10);

    fill(0); 
    textAlign(CENTER); 
    textSize(20); 
    ;
    text(textBoto, this.x + this.w/2, this.y + this.h/2 + 10);
    popStyle();
  }

  // Indica si el cursor està sobre el botó
  boolean mouseOverButton() {
    return (mouseX >= this.x) && 
      (mouseX<=this.x + this.w) && 
      (mouseY>= this.y) && 
      (mouseY<= this.y + this.h);
  }
}
