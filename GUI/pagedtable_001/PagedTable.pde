
class PagedTable {

  String[] tableHeaders;   // Títols de les columnes
  String[][] tableData;    // Dades de la taula
  float[] columnWidths;    // Amplades de les columnes
  
  int numCols, numRows;  // Número de files i columnes
  
  int numPage;
  int numTotalPages;
  
  // Constructor
  PagedTable(int nr, int nc){
    this.numRows = nr;
    this.numCols = nc;
    this.numPage = 0;
  }
  
  // Setters
  
  void setHeaders(String[] h){
    this.tableHeaders = h;
  }
  
  void setData(String[][] d){
    this.tableData = d;
    this.numTotalPages = d.length / (this.numRows-1);
  }
  
  void setValueAt(String value, int nr, int nc){
    this.tableData[nr][nc] = value;
  }
  
  void setColumnWidths(float[] w){
    this.columnWidths = w;
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
    
    fill(200, 50); stroke(0);strokeWeight(3);
    rect(x, y, w, h);
    
    float rowHeight = h / numRows;
    fill(200, 100, 100); stroke(0);strokeWeight(3);
    rect(x, y, w, rowHeight);
    
    // Dibuixa files
    stroke(0);
    for(int r = 1; r <numRows; r++){
      if(r==1){ strokeWeight(3); }
      else {    strokeWeight(1); }
      line(x, y + r*rowHeight, x + w, y + r*rowHeight);
    }
    
    // Dibuixa Columnes
    float xCol = x;
    for(int c = 0; c<numCols; c++){
      xCol += w*columnWidths[c]/100.0;
      line(xCol, y, xCol, y + h);
    }
    
    // Dibuixa textos
    fill(0); textSize(24);
    for(int r = 0; r < numRows; r++){
      xCol = x;
      for(int c = 0; c< numCols; c++){
        if(r==0){
          text(tableHeaders[c], xCol + 10, y + (r+1)*rowHeight - 10);
        }
        else{
          int k = (numRows-1)*numPage + (r-1);
          if(k<tableData.length){
            text(tableData[k][c], xCol + 10, y + (r+1)*rowHeight - 10);
          }
        }
        xCol += w*columnWidths[c]/100.0;
      }
    }
    
    // Informació de la Pàgina
    fill(0);
    text("Pag: "+(this.numPage+1)+" / "+(this.numTotalPages+1), x, y + h + 50);
    
    popStyle();
  }
  
  
}
