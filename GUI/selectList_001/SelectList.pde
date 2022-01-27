class SelectList {

  float x, y, w, h;
  Select s;
  Button bAdd;
  Button bRemove;

  String[] selItems;
  int numItems = 0;
  int numMaxItems = 3;

  SelectList(String[] info, float x, float y, float w, float h) {
    
    this.x = x; this.y = y;
    this.w = w; this.h = h;

    s = new Select(info, x, y, w, h);
    this.selItems = new String[info.length]; 

    bAdd = new Button("ADD", x + w, y, 50, h);
    bRemove = new Button("DEL", x + w +50, y, 50, h);
    bRemove.setEnabled(false);
  }

  void addItem() {
    if (numItems<numMaxItems) {
      boolean repeat = false;
      for (int i=0; i<numItems; i++) {
        if (selItems[i].equals(s.selectedValue)) {
          repeat = true;
          break;
        }
      }
      if (!repeat) {
        this.selItems[numItems] = s.selectedValue;
        numItems++;
      }
    }
  }

  void removeItem() {
    if (numItems>0) {
      numItems--;
    }
  }

  void display() {
    displayItems();
    s.display();
    bAdd.display();
    bRemove.display();
  }

  void displayItems() {
    pushStyle();
    if (numItems>0) {
      fill(240, 240, 100);
      rect(x, y + 1.15*h, w, h*numItems);
      for (int i=0; i<numItems; i++) {
        textSize(18); 
        fill(0);
        text((i+1)+") "+selItems[i], x+5, y + 1.75*h + h*i);
      }
    }
    popStyle();
  }

  void checkMouse() {
    if (s.mouseOverSelect() && s.enabled) {
      if (!s.collapsed) {
        s.update();      // Actualitzar valor
      }
      s.toggle();        // Plegar o desplegar
    }
    checkButtons();
  }

  void checkButtons() {
    if (bAdd.mouseOverButton() && bAdd.enabled) {
      addItem();
      setButtonsState();
    } else if (bRemove.mouseOverButton() && bRemove.enabled) {
      removeItem();
      setButtonsState();
    }
  }

  void setButtonsState() {
    if (numItems==0) {
      bAdd.setEnabled(true);
      bRemove.setEnabled(false);
    } else if (numItems==numMaxItems) {
      bAdd.setEnabled(false);
      bRemove.setEnabled(true);
    } else {
      bAdd.setEnabled(true);
      bRemove.setEnabled(true);
    }
  }

  boolean checkCursor() {
    return (sList.s.mouseOverSelect() && sList.s.enabled) ||
      (sList.bAdd.mouseOverButton() && sList.bAdd.enabled) ||
      (sList.bRemove.mouseOverButton() && sList.bRemove.enabled);
  }
}
