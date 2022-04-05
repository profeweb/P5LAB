
enum Pantalla {
  USUARI, INICI, SOMNI, GRAFICS, CERCA, RESULTATS
};
Pantalla pantalla = Pantalla.USUARI;

void setup() {
  //fullScreen();            // Pantalla completa
  size(1600, 1000);      // Pantalla HD
  noStroke();              // Sense bordes
  textAlign(CENTER);       // Alineació del text
  textSize(18); 
  connexioBBDD(); // Conexión a la BBDD
  setGUI();
  loadMedia();
}

void draw() {

  background(255);      
  switch(pantalla) {

  case USUARI: 
    dibuixaPantalla00(); 
    break;
  case INICI: 
    dibuixaPantalla01(); 
    break;
  case SOMNI: 
    dibuixaPantalla02(); 
    break;
  case GRAFICS: 
    dibuixaPantalla03(); 
    break;
  case CERCA: 
    dibuixaPantalla04(); 
    break;
  case RESULTATS: 
    dibuixaPantalla05(); 
    break;
  }


  updateCursor();
}

void mousePressed() {

  if (bLogo.mouseOverButton() && bLogo.enabled) {
    pantalla = Pantalla.INICI;
  }
  
  //ACCIONES DE MOUSE AL LOG IN
  if (pantalla==Pantalla.USUARI) {
    userText.isPressed();
    passText.isPressed();
    if (bEnter.mouseOverButton() && bEnter.enabled) {
      String user = userText.text;
      String pass = passText.text;
      boolean loginOK = testLogin(user, pass);
      if(loginOK){
        errorLogin=false;
        pantalla = Pantalla.INICI;
      }
      else {
        errorLogin = true;
      }
    }
  }

  // ESDEVENIMENTS DE MOUSE A PANTLLA INICI
  if (pantalla==Pantalla.INICI) {

    if (ib.mouseOverButton() && ib.enabled) {
      pantalla = Pantalla.SOMNI;
    }

    if (bSRecientes.mouseOverButton() &&  bSRecientes.enabled) {
      pantalla = Pantalla.SOMNI;
    }
    if (bRGrafico.mouseOverButton() &&  bRGrafico.enabled) {
      pantalla = Pantalla.GRAFICS;
    }
    if (bBElementos.mouseOverButton() &&  bBElementos.enabled) {
      pantalla = Pantalla.CERCA;
    }
  }

  // ESDEVENIMENTS DE MOUSE A PANTALLA SOMNI
  if (pantalla==pantalla.SOMNI) {

    areaText.isPressed();
    c.checkButtons();
    sfa.updateFilters();

    if (bFecha.mouseOverButton() && ib.enabled) {
      viewCalendar = !viewCalendar;
    }

    if (selCategoria.mouseOverSelect() && selCategoria.enabled) {
      if (!selCategoria.collapsed) {
        selCategoria.update();      // Actualitzar valor
      }
      selCategoria.toggle();        // Plegar o desplegar
    }
    if (selEmail.mouseOverSelect() && selEmail.enabled) {
      if (!selEmail.collapsed) {
        selEmail.update();      // Actualitzar valor
      }
      selEmail.toggle();        // Plegar o desplegar
    }
    if (b1.mouseOverButton()) {
      b1.toggle();
      if (b1.enabled) {
        bgColor = color(255);
      } else {
        bgColor = color(0);
      }
    }
    
    if (bGuardar.mouseOverButton() && bGuardar.enabled) {
      //Recollir dades
      String t = tittleDream.text; // titulo
      String d = areaText.text;    // descripcion
      String f = c.getSelectedDateYYYYMMDD();  // fecha
      String l = b1.enabled ? "S" : "N";
      String c = selCategoria.selectedValue;
      String e = "paco@gmail.com";
      
      // Insert del SUEÑO
      insertSomni(t,f, l, d, c, e);
      int ids = getMaxIdSueno();
      // Insert de ETIQUETAS - SUEÑO
      String[]es = sfa.getSelectedValues();
      for(String etiqueta : es){
        int ide = getIdEtiqueta(etiqueta);
        insertEtiquetaSueno(ids, ide);
      }
     // 
    }
    if (bEliminar.mouseOverButton() && bEliminar.enabled) {
      pantalla = Pantalla.GRAFICS;
    }
    tittleDream.isPressed();
  }

  // CLICKS EN PANTALLA DE GRAFICOS
  if (pantalla==pantalla.GRAFICS) {
    if (bVariables.mouseOverButton() && bVariables.enabled) {
      bVariablesShow  = !bVariablesShow;
    }

    if (selGrafico.mouseOverSelect() && selGrafico.enabled) {
      if (!selGrafico.collapsed) {
        selGrafico.update();      // Actualitzar valor
        tipoGrafico = selGrafico.selectedValue;
        initBarsDiagram();
      }
      selGrafico.toggle();        // Plegar o desplegar
    }
  }

  // CLICKS EN PANTALLA DE RESLTADOS
  if (pantalla==pantalla.RESULTATS) {

    if (br1.mouseOverButton() && br1.enabled) {
      pc.nextPage();
    } else if (br2.mouseOverButton() && br2.enabled) {
      pc.prevPage();
    }
  }
  //ACCIONES PANTALLA BÚSQUEDA
  if (pantalla==pantalla.CERCA) {
    cercaText.isPressed();
    sfc.updateFilters();
    if (bCerca.mouseOverButton()&& bCerca.enabled) {
      // AGAFAR VALORS
      String b = cercaText.text;
      String u = selUsuario.selectedValue;
      String c = s4.selectedValue;
      String f = sfc.getSelectedValuesIn();
      filterResults(u,c,f,b);
      pantalla=pantalla.RESULTATS;
    }
    if (selUsuario.mouseOverSelect() && selUsuario.enabled) {
      if (!selUsuario.collapsed) {
        selUsuario.update();      // Actualitzar valor
      }
      selUsuario.toggle();        // Plegar o desplegar
    }

    if (s4.mouseOverSelect() && s4.enabled) {
      if (!s4.collapsed) {
        s4.update();      // Actualitzar valor
      }
      s4.toggle();        // Plegar o desplegar
    }
  }
}

void keyPressed() {


  if (key=='0') {
    pantalla = Pantalla.USUARI;
  } else if (key=='1') {
    pantalla = Pantalla.INICI;
  } else if (key=='2') {
    pantalla = Pantalla.SOMNI;
  } else if (key=='3') {
    pantalla = Pantalla.GRAFICS;
  } else if (key=='4') {
    pantalla = Pantalla.CERCA;
  } else if (key=='5') {
    pantalla = Pantalla.RESULTATS;
  }
  
  if(pantalla==pantalla.USUARI){
    userText.keyPressed(key, (int)keyCode);
    passText.keyPressed(key, (int)keyCode);
  }

  if (pantalla==pantalla.CERCA) {
    cercaText.keyPressed(key, (int)keyCode);
  }

  if (pantalla==pantalla.SOMNI) {
    textDream.keyPressed(key, (int)keyCode);
    tittleDream.keyPressed(key, (int)keyCode);
    if (keyCode==LEFT) {
      c.prevMonth();
      println("PREV MONTH");
    }
    // Anar un mes endavant
    else if (keyCode==RIGHT) {
      c.nextMonth();
      println("PREV MONTH");
    }
  }



  if (key=='0') {
    pantalla = Pantalla.USUARI;
  } else if (key=='1') {
    pantalla = Pantalla.INICI;
  } else if (key=='2') {
    pantalla = Pantalla.SOMNI;
  } else if (key=='3') {
    pantalla = Pantalla.GRAFICS;
  }
  if (pantalla==pantalla.SOMNI) {
    areaText.keyPressed(key, (int)keyCode);
    if (keyCode==LEFT) {
      c.prevMonth();
      println("PREV MONTH");
    }
    // Anar un mes endavant
    else if (keyCode==RIGHT) {
      c.nextMonth();
      println("PREV MONTH");
    }
  }
}

// Modifica el cursor
void updateCursor() {

  if ((pantalla==Pantalla.INICI && ib.mouseOverButton() && ib.enabled)) {
    cursor(HAND);
  } else if (b1.mouseOverButton()) {
    cursor(HAND);
  } else if ((selCategoria.mouseOverSelect() && selCategoria.enabled)) {
    cursor(HAND);
  } else if (sfa.updateCursor()) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}
