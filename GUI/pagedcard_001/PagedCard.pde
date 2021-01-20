
class PagedCard {
  

  String[][] cardsData;    // Dades de les Cards
  Card[] cards;            // Cards
  int numCards;            // Número total de Cards
  int numCardsPage;        // Número de Cards en 1 Pàgina
  
  int numPage;
  int numTotalPages;
  
  // Constructor
  PagedCard(int ncp){
    this.numCardsPage = ncp;
    this.numPage = 0;
  }
  
  // Setters
  
  void setData(String[][] d){
    this.cardsData = d;
    this.numTotalPages = d.length / this.numCardsPage;
  }
  
  void setCards(){
    cards = new Card[this.cardsData.length];
    for(int i=0; i<cards.length; i++){
      cards[i] = new Card(cardsData[i]);
    }
  }
  
  void setImages(PImage img1, PImage img2){
    PImage img;
    for(int i=0; i<cards.length; i++){
      if(cards[i].section=="Secció 1"){
        img = img1;
      }
      else {
        img = img2;
      }
      cards[i].setImage(img);
    }
  }
  
  void nextPage(){
    if(this.numPage<this.numTotalPages){
      this.numPage++;
    }
  }
  
  void prevPage(){
    if(this.numPage>0){
      this.numPage--;
    }
  }
  
  // Dibuixa taula
  void display(float x, float y, float w, float h){
    
    pushStyle();
    
    //fill(200, 50); stroke(0);strokeWeight(3);
    //rect(x, y, w, h);
    
    // Dibuixa Cards
    int firstCardPage = numCardsPage*numPage;
    int lastCardPage  = numCardsPage*(numPage+1) - 1;
    float hCard = h / (float) numCardsPage;
    float yCard = y;
    float b = 10;
    int nc = 0;
    for(int i = firstCardPage; i <= lastCardPage; i++){
      if(i<cards.length){
        cards[i].display(x, yCard, w, hCard, b);
        nc++;
        yCard += hCard + b;
      }
    }
    
    // Informació de la Pàgina
    fill(0);
    text("Pag: "+(this.numPage+1)+" / "+(this.numTotalPages+1), x + w + 50, y+10);
    
    popStyle();
  }
  
  
}
