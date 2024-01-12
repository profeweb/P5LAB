class SongCard {

  // Propietats
  String id;
  String title;
  String category;
  boolean favorite;

  float x, y, w, h, b;

  FaveButton bFavorite;
  RoundButton bPlay;

  // Constructor

  SongCard(float x, float y, float w, float h, float b, String[] data) {
    this.id = data[0];
    this.title = data[1];
    this.category = data[2];
    this.favorite = Boolean.parseBoolean(data[3]);

    this.x = x; this.y = y; this.w = w; this.h = h; this.b = b;
  }
  
  void setButtons(PImage imgFave, PImage imgNoFave, PImage imgPlay){
    float xB1 = x + w - 250;
    float xB2 = x + w - 150;
    float yB = this.y + this.h/2;
    float rB = 30;
    this.bFavorite = new FaveButton(imgFave, imgNoFave, xB1, yB, rB, this.favorite);
    this.bPlay = new RoundButton(imgPlay, xB2, yB, rB);
  }


  // Dibuixa la Card

  void display(boolean mouseOver) {

    pushStyle();

    // Rectangle inferior
    stroke(0); 
    fill(220);
    if (mouseOver) {
      fill(220, 100, 100);
    }
    rect(x, y, w, h, b/2);

    // Títol
    fill(0); 
    textSize(24); 
    textAlign(LEFT);
    text(title, x + 10, y + h/2 + 10);


    // Categoria
    fill(100, 100, 200); 
    noStroke();
    rect(x + w - 100, y + 8, 100, 25);
    fill(0);  
    textAlign(RIGHT); 
    textSize(14);
    text(category, x + w - 10, y + 25);
    
    this.bFavorite.display();
    this.bPlay.display();

    popStyle();
  }
  
  
  SongCard checkButtons(){
    
    this.bFavorite.checkMouseClick();
    
    if(this.bPlay.mouseOverButton()){
      return this;
    }
    
    return null;
  }

}
