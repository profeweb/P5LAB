
class PagedResults {
  

  String[][] resultsData;    // Dades de les Cards
  Result[] results;          // Resultats
  int numResults;            // Número total de Resultats
  int numResultsPage;        // Número de Resultats en 1 Pàgina
  
  int numPage;
  int numTotalPages;
  
  // Constructor
  PagedResults(int ncp){
    this.numResultsPage = ncp;
    this.numPage = 0;
  }
  
  // Setters
  
  void setData(String[][] d){
    this.resultsData = d;
    this.numTotalPages = d.length / this.numResultsPage;
  }
  
  void setCards(){
    results = new Result[this.resultsData.length];
    for(int i=0; i<results.length; i++){
      results[i] = new Result(resultsData[i]);
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

    for(int i = firstCardPage; i <= lastCardPage; i++){
      if(i<results.length){
        boolean mouseOver = (i==numCardOver(x, y, w, h));
        results[i].display(x, yCard, w, hCard, b, mouseOver);
        yCard += hCard + b;
      }
    }
    
    // Informació de la Pàgina
    fill(0);
    text("Pag: "+(this.numPage+1)+" / "+(this.numTotalPages+1), x + w + 50, y+10);
    
    popStyle();
  }
  
  
  int numCardOver(float x, float y, float w, float h){
    
    int firstCardPage = numCardsPage*numPage;
    int lastCardPage  = numCardsPage*(numPage+1) - 1;
    float hCard = h / (float) numCardsPage;
    float yCard = y;
    float b = 10;

    for(int i = firstCardPage; i <= lastCardPage; i++){
      if(i<results.length){

        if(mouseX > x && mouseX < x + w && 
           mouseY > yCard && mouseY < yCard + hCard){
             return i;
           }
        yCard += hCard + b;
      }
    }
    return -1;
  }
  
  
  Result checkCardClick(float x, float y, float w, float h){
    
    int firstCardPage = numCardsPage*numPage;
    int lastCardPage  = numCardsPage*(numPage+1) - 1;
    float hCard = h / (float) numCardsPage;
    float yCard = y;
    float b = 10;

    for(int i = firstCardPage; i <= lastCardPage; i++){
      if(i<results.length){

        if(mouseX > x && mouseX < x + w && 
           mouseY > yCard && mouseY < yCard + hCard){
             return results[i];
           }
        yCard += hCard + b;
      }
    }
    return null;
  }
  
  
}
