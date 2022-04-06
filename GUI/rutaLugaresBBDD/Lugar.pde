class Lugar {

  String id, nombre, descripcion, resumen;
  String ciudad;
  String lat, lon;
  String url;
  String foto;

  PImage img;
  float x, y, w, h;

  Lugar(String[] data) {
    this.id = data[0];
    this.nombre = data[1];
    this.descripcion = data[2];
    this.resumen = this.descripcion.substring(0, 10)+"...";
    this.ciudad = data[3];
    this.lat = data[4];
    this.lon = data[5];
    this.foto = data[6];

    this.img = loadImage(this.foto);
    this.url = "https://www.google.com/maps/search/?api=1&query="+lat+","+lon;
  }

  void setFoto(String f) {
    this.img = loadImage(f);
  }

  // Setter de posició i mida
  void setLocation(float x, float y, float w, float h) {
    this.x = x; 
    this.y = y;
    this.w = w; 
    this.h = h;
  }

  void display(boolean mouseOver) {
    pushStyle();
    if (mouseOver) {
      fill(200, 100, 100); 
      noTint();
    } else {
      tint(255, 126);
      fill(200, 200, 200);
    }
    stroke(0); 
    strokeWeight(3);
    rect(x, y, w, h, 5);
    image(this.img, x, y, h, h);
    fill(0); 
    textAlign(LEFT); 
    textSize(24);
    text(this.nombre, x + h +10, y + 40);

    fill(100); 
    textAlign(LEFT); 
    textSize(18);
    text(this.resumen, x + h +10, y + 60, w - h - 20, h - 60);

    fill(100); 
    textAlign(LEFT); 
    textSize(16);
    text(this.ciudad, x+ h +10, y + h - 30);

    if (mouseOver) {
      fill(255); 
      stroke(0);
      ellipse(x + w - 30, y + 30, 50, 50);
      fill(0); 
      textSize(24); 
      textAlign(CENTER);
      text(this.id, x + w - 30, y + 30 + 8);
    } else {
      fill(0); 
      stroke(255);
      ellipse(x + w - 30, y + 30, 50, 50);
      fill(255); 
      textSize(24); 
      textAlign(CENTER);
      text(this.id, x + w - 30, y + 30 + 8);
    }

    noFill(); 
    stroke(0); 
    strokeWeight(3);
    line(x +h, y, x+h, y + h);
    rect(x, y, w, h, 5);
    popStyle();
  }

  // Determina si mouse sobre el Link
  boolean mouseOverButton() {
    return (mouseX >= this.x) && 
      (mouseX<=this.x + this.w) && 
      (mouseY>= this.y) && 
      (mouseY<= this.y + this.h);
  }


  // Obri la URL amb el navegador
  void openWeb() {
    openWebPage(this.url);
  }


  float mappedLat(float minLat, float maxLat, float y, float h) {
    float lat1 = Float.parseFloat(this.lat);
    return map(lat1, minLat, maxLat, y, y+h);
  }

  float mappedLon(float minLon, float maxLon, float x, float w) {
    float lon1 = Float.parseFloat(this.lon);
    return map(lon1, minLon, maxLon, x, x+w);
  }
}
