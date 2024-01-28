class MaquinaTermica {

  PressioVolum[] punts;
  int numPunts = 0;
  float x0, y0;

  float maxX = 0, maxY = 0;
  float areaAnada, areaTornada, areaTotal;

  String[] textAreesSuperiors, textAreesInferiors;

  MaquinaTermica(float x0, float y0) {
    this.x0 = x0; 
    this.y0 = y0;
    this.punts = new PressioVolum[10];
  }

  void setPunt(float pressio, float volum, CICLE cicle) {
    this.punts[numPunts] = new PressioVolum(numPunts+1, pressio, volum, cicle);
    numPunts++;
  }

  void setPunt(int i, float pressio, float volum, CICLE cicle) {
    this.punts[i] = new PressioVolum(i+1, pressio, volum, cicle);
  }

  void updateMaxXY() {

    maxX = 0; 
    maxY = 0;

    for (PressioVolum pv : punts) {

      if (pv!=null) {
        float pressio = pv.pressio;
        float volum = pv.volum;

        if (volum > maxX) {
          maxX = volum;
        }

        if (pressio > maxY) {
          maxY = pressio;
        }
      }
    }
  }

  void display(float sX, float sY) {
    pushMatrix();
    translate(x0, y0);
    displayLines(sX, sY);
    displayEixX(sX, sY);
    displayEixY(sX, sY);
    displayHelpers(sX, sY);
    displayPunts(sX, sY);
    popMatrix();

    checkMouseOver(sX, sY);
  }

  void displayPunts(float sX, float sY) {
    for (PressioVolum pv : punts) {
      if (pv != null) {
        pv.display(sX, sY);
      }
    }
  }

  void displayLines(float sX, float sY) {
    stroke(255, 0, 0);
    fill(255, 0, 0, 50);
    beginShape();
    for (PressioVolum pv : punts) {
      if (pv!=null) {
        vertex(pv.volum*sX, -pv.pressio*sY);
      }
    }
    endShape(CLOSE);
  }

  void displayHelpers(float sX, float sY) {
    for (PressioVolum pv : punts) {
      if (pv !=null) {
        stroke(255, 0, 0, 50);
        line(pv.volum*sX, -pv.pressio*sY, pv.volum*sX, 0);
        stroke(0, 0, 255, 50);
        line(pv.volum*sX, -pv.pressio*sY, 0, -pv.pressio*sY);
      }
    }
  }

  void displayEixX(float sX, float sY) {
    stroke(0); 
    strokeWeight(2);
    line(0, 0, width-200, 0);
    for (int i=0; i<=maxX; i+=stepX) {
      strokeWeight(1);
      line (i*sX, -sY/3, i*sX, sY/3); 
      fill(0); 
      textAlign(CENTER); 
      textSize(18);
      text(i, i*sX, sY);
    }

    text("Volum", width-200, 50);
  }

  void displayEixY(float sX, float sY) {
    stroke(0); 
    strokeWeight(2);
    line(0, 0, 0, -height + 120);
    for (int i=0; i<=maxY; i+=stepY) {
      strokeWeight(1);
      line (-10, -i*sY, 10, -i*sY); 
      fill(0); 
      textAlign(RIGHT); 
      textSize(18);
      text(i, -20, -i*sY);
    }
    textAlign(RIGHT);
    text("Pressió", -25, -height + 150);
  }

  void checkMouseOver(float sX, float sY) {
    for (PressioVolum pv : punts) {
      if (pv != null) {
        pv.mouseOver = pv.mouseOver(x0, y0, sX, sY);
      }
    }
  }

  void checkMouseDragged(float sX, float sY) {
    for (PressioVolum pv : punts) {
      if (pv!=null) {
        pv.mouseOver = pv.mouseOver(x0, y0, sX, sY);
        if (pv.mouseOver) {
          pv.pressio = floor((y0 - mouseY) / sY);
          pv.volum = floor((mouseX - x0) / sX);
        }
      }
    }
  }


  int numPuntsCicle(CICLE c) {
    int n = 0;
    for (int i=0; i<punts.length; i++) {
      if (punts[i]!=null && punts[i].cicle == c) {
        n++;
      }
    }
    return n;
  }


  float calculaAreaAnada() {
    float a = 0;
    textAreesSuperiors = new String[numPuntsCicle(CICLE.ANADA)-1];
    for (int i=0; i<numPunts; i++) {
      if (punts[i]!=null && punts[i+1]!=null && 
        punts[i].cicle==CICLE.ANADA && 
        punts[i+1].cicle == CICLE.ANADA ) {
        float y0 = punts[i].pressio;
        float y1 = punts[(i+1)].pressio;
        float dx = abs(punts[(i+1)].volum - punts[i].volum);
        float ai = 0;
        // Rectangle
        String textTipus = "rectangle";
        String calcul = "";
        if (y0 == y1) {
          ai = y0 * dx;
          calcul = y0 + " x " + dx;
        }
        // Trapezi
        else {
          textTipus = "trapezi";
          float y2 = (y0 + y1)/2;
          ai = y2 * dx;
          calcul = "(" + y0 +" + "+y1+")/2  x " + dx;
        }
        textAreesSuperiors[i] = "Area Sup. "+(i+1)+" ("+textTipus+"): "+calcul + " = " +ai;
        println(textAreesSuperiors[i]);
        a += ai;
      }
    }
    return a;
  }

  float calculaAreaTornada() {
    float a = 0;
    textAreesInferiors = new String[numPuntsCicle(CICLE.TORNADA)-1];
    int k = 0;
    for (int i=0; i<numPunts; i++) {
      if (punts[i]!=null && punts[i+1]!=null && 
        punts[i].cicle==CICLE.TORNADA && 
        punts[i+1].cicle == CICLE.TORNADA ) {
        float y0 = punts[i].pressio;
        float y1 = punts[(i+1)].pressio;
        float dx = abs(punts[(i+1)].volum - punts[i].volum);
        float ai = 0;
        String textTipus = "rectangle";
        String calcul = "";
        // Rectangle
        if (y0 == y1) {
          ai = y0 * dx;
          calcul = y0 + " x " + dx;
        }
        // Trapezi
        else {
          float y2 = (y0 + y1)/2;
          ai = y2 * dx;
          textTipus = "trapezi";
          calcul = "(" + y0 +" + "+y1+")/2  x " + dx;
        }
        textAreesInferiors[k] = "Area Inf. "+(k+1)+" ("+textTipus+"): "+calcul + " = " +ai;
        println(textAreesInferiors[k]);
        k++;
        a += ai;
      }
    }
    return a;
  }

  void calculaArees() {
    areaAnada = mt.calculaAreaAnada();
    areaTornada = mt.calculaAreaTornada();
    areaTotal = areaAnada - areaTornada;
  }

  void displayCalculsSuperior(float x, float y) {
    pushStyle();
    fill(0); textAlign(LEFT); textSize(24);
    text("AREA SUPERIOR:", x, y);
    stroke(0);
    line(x, y+5, x+ 200, y+5);
    textSize(18);
    for (int i=0; i<textAreesSuperiors.length; i++) {
      text(textAreesSuperiors[i], x, y + (i+1)*30);
    }
    textSize(20);
    text("TOTAL AREA SUPERIOR: "+ areaAnada, x, y + (textAreesSuperiors.length + 1.5)*30);
    popStyle();
  }
  
  void displayCalculsInferior(float x, float y) {
    pushStyle();
    fill(0); textAlign(LEFT); textSize(24);
    text("AREA INFERIOR:", x, y);
    stroke(0);
    line(x, y+5, x+ 200, y+5);
    textSize(18);
    for (int i=0; i<textAreesInferiors.length; i++) {
      text(textAreesInferiors[i], x, y + (i+1)*30);
    }
    textSize(20);
    text("TOTAL AREA INFERIOR: "+ areaTornada, x, y + (textAreesInferiors.length + 1.5)*30);
    popStyle();
  }

  void displayArees(float x, float y) {
    pushStyle();
    displayCalculsSuperior(x, y);
    displayCalculsInferior(x, y+200);
    textAlign(LEFT); fill(255, 0, 0);
    textSize(24);
    float yr = 400;
    text("DIFERÈNCIA D'ÀREES: "+ areaTotal, x, y+yr);
    stroke(255, 0, 0);
    line(x, y + yr + 5, x + 200, y + yr + 5);
    textSize(18);
    text("Area Superior - Area Inferior = " + areaAnada +" - " + areaTornada + " = "+ areaTotal,x, y + yr + 30);
    popStyle();
  }
}
