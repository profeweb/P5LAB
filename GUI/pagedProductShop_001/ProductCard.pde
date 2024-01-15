class ProductCard {

  // Propietats
  String id;
  String title;
  String category;
  String description;
  float price;
  boolean favorite;
  PImage photo;

  float x, y, w, h, b;

  Counter cQuantity;
  Button bShop;

  // Constructor

  ProductCard(float x, float y, float w, float h, float b, String[] data) {
    this.id = data[0];
    this.title = data[1];
    this.category = data[2];
    this.description = data[3];
    this.price = Float.parseFloat(data[4]);
    this.favorite = Boolean.parseBoolean(data[5]);
    this.photo = loadImage(data[6]);

    this.x = x; this.y = y; this.w = w; this.h = h; this.b = b;
  }
  
  void setButtons(PImage imgMes, PImage imgMenys){
    
    float xC = x + 5;
    float yCB = y + 5*h/6;
    float xB = x + w - w/4 -5;
    float hCB = h/6 - 5;

    this.cQuantity = new Counter(imgMes, imgMenys, xC, yCB, 1*w/4, hCB);
    this.cQuantity.setInitialValue(0);
    this.cQuantity.setValues(0, 10);
    this.bShop = new Button("SHOP", xB, yCB, w/4, hCB);
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
    
    // Imatge
    image(this.photo, x+10, y+10, w-20, 3*h/4 -20);

    // Títol
    fill(0); 
    textSize(24); 
    textAlign(LEFT);
    text(title, x + 10, y + 3*h/4 + 20);
    
    // Preu
    fill(0); 
    textSize(24); 
    textAlign(RIGHT);
    text(nf(price, 1, 2)+"€", x + w -10, y + 3*h/4 + 20);


    // Categoria
    fill(100, 100, 200); 
    noStroke();
    rect(x + w - 80, y + 8, 80, 30);
    fill(0);  
    textAlign(RIGHT); 
    textSize(14);
    text(category, x + w - 10, y + 25);
    
    this.cQuantity.display();
    this.bShop.display();

    popStyle();
  }
 

}
