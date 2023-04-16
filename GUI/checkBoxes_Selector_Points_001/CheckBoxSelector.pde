class CheckBoxSelector {

  // Propietats (posició i dimensions)
  float x, y, w, h;
  float margeV = 15;

  // Propietats(informació i checkboxes)
  String[] info;
  CheckBoxText[] cbs;
  int numMaxChecked = 2;

  // Constructor
  CheckBoxSelector(String[] info, float x, float y, float w, float h) {
    this.x = x; 
    this.y = y;
    this.w = w; 
    this.h = h;

    this.info = info;
    this.cbs = new CheckBoxText[ info.length ];
    for (int i=0; i<info.length; i++) {
      cbs[i] = new CheckBoxText(info[i], x, y + (h+margeV)*i, w, h);
    }
  }

  // Actualitzam la informació del checkboxlist
  void setInfo(String[] info) {
    this.info = info;
    this.cbs = new CheckBoxText[ info.length ];
    for (int i=0; i<info.length; i++) {
      cbs[i] = new CheckBoxText(info[i], x, y + h*i, w, h);
    }
  }

  // Defineix el màxim d'elements marcats
  void setNumMaxChecked(int n) {
    this.numMaxChecked = n;
  }

  // Dibuixam el checkboxlist
  void display() {
    for (CheckBoxText cb : cbs) {
      cb.display();
    }
  }

  // Comprova si feim click sobre algun checkbox
  void checkMouse() {
    for (CheckBoxText cb : cbs) {
      if (cb.onMouseOver()) {
        if (!cb.checked && getNumSelected()<numMaxChecked) {
          cb.checked = true;
        } else if (cb.checked) {
          cb.checked = false;
        }
        break;
      }
    }
  }

  // Retorna si el checkBox n està seleccionat
  boolean isChecked(int n) {
    return cbs[n].checked;
  }

  // Retorna si el checkBox amb texte s està seleccionat
  boolean isChecked(String s) {
    for (CheckBoxText cb : cbs) {
      if (cb.texte.equals(s)) {
        return cb.checked;
      }
    }
    return false;
  }

  // Retorna true si el mouse està sobre algun checkbox
  boolean checkCursor() {
    for (CheckBoxText cb : cbs) {
      if (cb.onMouseOver()) {
        return true;
      }
    }
    return false;
  }

  // Retorna el número d'elements seleccionats
  int getNumSelected() {
    int n = 0;
    for (CheckBoxText cb : cbs) {
      if (cb.checked) {
        n++;
      }
    }
    return n;
  }

  // Retorna un array amb el nom dels elements seleccionats
  String[] getSelectedItems() {
    int n = getNumSelected();
    String[] items = new String[n];
    int i=0;
    for (CheckBoxText cb : cbs) {
      if (cb.checked) {
        items[i] = cb.texte;
        i++;
      }
    }
    return items;
  }
}
