class MaquinaTermica {

  PressioVolum[] punts;
  int numPunts = 0;
  float x0, y0;

  float maxX = 0, maxY = 0;

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
    line(0, 0, 20*sX, 0);
    for (int i=1; i<=maxX; i++) {
      strokeWeight(1);
      line (i*sX, -sY/3, i*sX, sY/3); 
      fill(0); 
      textAlign(CENTER); 
      textSize(18);
      text(i, i*sX, sY);
    }

    text("Volum", 21*sX, 0);
  }

  void displayEixY(float sX, float sY) {
    stroke(0); 
    strokeWeight(2);
    line(0, 0, 0, -20*sY);
    for (int i=1; i<=maxY; i++) {
      strokeWeight(1);
      line (-sX/3, -i*sY, sX/3, -i*sY); 
      fill(0); 
      textAlign(CENTER); 
      textSize(18);
      text(i, -sX, -i*sY);
    }
    text("Pressió", 0, -20.5*sY);
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
    for (int i=0; i<numPunts; i++) {
      if (punts[i]!=null && punts[i+1]!=null && 
        punts[i].cicle==CICLE.ANADA && 
        punts[i+1].cicle == CICLE.ANADA ) {
        float y0 = punts[i].pressio;
        float y1 = punts[(i+1)].pressio;
        float dx = abs(punts[(i+1)].volum - punts[i].volum);
        float ai = 0;
        // Rectangle
        if (y0 == y1) {
          ai = y0 * dx;
        }
        // Trapezi
        else {
          float y2 = (y0 + y1)/2;
          ai = y2 * dx;
        }
        println("AREA ANADA "+i+": "+ai);
        a += ai;
      }
    }
    return a;
  }

  float calculaAreaTornada() {
    float a = 0;
    for (int i=0; i<numPunts; i++) {
      if (punts[i]!=null && punts[i+1]!=null && 
        punts[i].cicle==CICLE.TORNADA && 
        punts[i+1].cicle == CICLE.TORNADA ) {
        float y0 = punts[i].pressio;
        float y1 = punts[(i+1)].pressio;
        float dx = abs(punts[(i+1)].volum - punts[i].volum);
        float ai = 0;
        // Rectangle
        if (y0 == y1) {
          ai = y0 * dx;
        }
        // Trapezi
        else {
          float y2 = (y0 + y1)/2;
          ai = y2 * dx;
        }
        println("AREA TORNADA "+i+": "+ai);
        a += ai;
      }
    }
    return a;
  }
}
