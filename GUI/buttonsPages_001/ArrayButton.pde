class ArrayButtons {

  Button[] buttons;

  int currentButton = 0;

  ArrayButtons(int n, float x, float y, float r, float s) {
    buttons = new Button[n];
    for (int i=0; i<buttons.length; i++) {
      buttons[i] = new Button(Integer.toString(i+1), x + (s+r)*i, y, r, r);
    }
    buttons[currentButton].enabled = false;
  }

  void display() {
    pushStyle();
    for (int i=0; i<buttons.length; i++) {
      buttons[i].display();
    }
    popStyle();
  }

  int getCurrentButton() {
    return (this.currentButton + 1);
  }

  void updateButtons() {
    for (int i=0; i<buttons.length; i++) {
      buttons[i].enabled = (currentButton != i);
    }
  }

  void checkMousePressed() {
    for (int i=0; i<buttons.length; i++) {
      if (buttons[i].mouseOverButton() && buttons[i].enabled) {
        currentButton = i;
        updateButtons();
        break;
      }
    }
  }
  
  boolean checkMouseOver() {
    for (int i=0; i<buttons.length; i++) {
      if (buttons[i].mouseOverButton() && buttons[i].enabled) {
        return true;
      }
    }
    return false;
  }
}
