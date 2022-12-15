
class PagedFAQ {
  

  String[][] cardsData;    // Dades de les Cards
  FAQ[] faqs;            // Cards
  int numCards;            // Número total de Cards
  int numCardsPage;        // Número de Cards en 1 Pàgina
  
  int numPage;
  int numTotalPages;
  
  // Constructor
  PagedFAQ(int ncp){
    this.numCardsPage = ncp;
    this.numPage = 0;
  }
  
  // Setters
  
  void setData(String[][] d){
    this.cardsData = d;
    this.numTotalPages = d.length / this.numCardsPage;
  }
  
  void setCards(float x, float y, float w, float h1, float h2, color c1, color c2){
    faqs = new FAQ[this.cardsData.length];
    for(int i=0; i<faqs.length; i++){
      // FAQ(String p, String r,float x, float y, float w, float h1, float h2, color c1, color c2){
      float yy = i%2==0? Ycapsa :Ycapsa+300;
      faqs[i] = new FAQ(cardsData[i][0], cardsData[i][1], x, yy, w, h1, h2, c1, c2);
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
        
    // Dibuixa Cards
    int firstCardPage = numCardsPage*numPage;
    int lastCardPage  = numCardsPage*(numPage+1) - 1;
    float hCard = h / (float) numCardsPage;
    float yCard = y;
    float b = 10;
    int nc = 0;
    for(int i = firstCardPage; i <= lastCardPage; i++){
      if(i<faqs.length){
        faqs[i].display();
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
