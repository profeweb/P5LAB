
class PagedProducts {


  String[][] productsData;    // Dades dels Productes
  ProductCard[] products;       // Productes
  int numProducts;              // Número total de Productes
  int numProductsPage;        // Número de Productes en 1 Pàgina

  int numPage;
  int numTotalPages;
  float espai;

  float x, y, w, h;
  float wCard, hCard;

  // Botons
  Button b1, b2;

  // Dimensions dels botons
  float buttonW = 60, buttonH = 60;

  // Constructor
  PagedProducts(int ncp, float x, float y, float w, float h) {

    this.numProductsPage = ncp;
    this.numPage = 0;

    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    this.wCard = (w - espai*(numCardsRow-1)) / numCardsRow ;
    this.hCard = (h - espai) / 2.0;

    // Creació dels botons
    b1 = new Button("NEXT", 100 + cardsW, 80, buttonW, buttonH);
    b2 = new Button("PREV", 100 + cardsW, 100 + buttonH, buttonW, buttonH);
    
    this.espai = 20;
  }

  // Setters

  void setData(String[][] d) {
    this.productsData = d;
    this.numTotalPages = d.length / this.numProductsPage;
  }

  void setCards(PImage img1, PImage img2) {
    
    products = new ProductCard[this.productsData.length];
    
    int k=0;
    
    for (int i=0; i<products.length; i++) {
      
      float xc =  x + (i%numCardsRow)* (wCard + espai);
      float yc = (k%numProductsPage)<(numProductsPage/2)? y : y + hCard + espai;
      
      products[i] = new ProductCard(xc, yc, wCard, hCard, espai, productsData[i]);
      products[i].setButtons(img1, img2);
      k++;
    }
  }


  void nextPage() {
    if (this.numPage<this.numTotalPages) {
      this.numPage++;
    }
  }

  void prevPage() {
    if (this.numPage>0) {
      this.numPage--;
    }
  }

  // Dibuixa taula
  void display() {

    pushStyle();


    // Dibuixa Cards
    int firstCardPage = numCardsPage*numPage;
    int lastCardPage  = numCardsPage*(numPage+1) - 1;

    for (int i = firstCardPage; i <= lastCardPage; i++) {
      if (i<products.length) {
        boolean mouseOver = (numCardOver()==i);
        products[i].display(mouseOver);
      }
    }

    // Informació de la Pàgina
    fill(0); textSize(18); 
    text("Pag: "+(this.numPage+1)+" / "+(this.numTotalPages+1), x + w + 50, y+10);


    // Dibuixa els botons
    b1.display();
    b2.display();

    popStyle();
  }
  
  ProductCard ckechButtons(){
    
    int firstCardPage = numCardsPage*numPage;
    int lastCardPage  = numCardsPage*(numPage+1) - 1;
    for (int i = firstCardPage; i <= lastCardPage; i++) {
      if (i<products.length) {
        
        products[i].cQuantity.update();
        
        if(products[i].bShop.mouseOverButton()){
          return products[i];
        }
      }
    }
    
    if(b1.mouseOverButton()){
      nextPage();
    }
    else if(b2.mouseOverButton()){
      prevPage();
    }
    
    return null;
  }
  
  
  int numCardOver() {

    int firstCardPage = numCardsPage*numPage;
    int lastCardPage  = numCardsPage*(numPage+1) - 1;


    for (int i = firstCardPage; i <= lastCardPage; i++) {
      if (i<products.length) {
        
        float xc =  x + (i%numCardsRow)* (wCard + espai);
        float yc = ((i)%numProductsPage)<(numProductsPage/2)? y : y + hCard + espai;
        
        if (mouseX > xc && mouseX < xc + wCard && 
          mouseY > yc && mouseY < yc + hCard) {
          return i;
        }
      }
    }
    return -1;
  }

}
