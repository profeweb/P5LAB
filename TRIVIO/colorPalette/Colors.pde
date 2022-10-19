// Fitxer amb la informació dels Colors de l'App
  
// Array de colors
color[] colors;
  
// Estableix colors de l'App
void setColors(){
    this.colors = new color[5];
    this.colors[0] = color(#068D9D);
    this.colors[1] = color(#53599A);
    this.colors[2] = color(#6D9DC5);
    this.colors[3] = color(#80DED9);
    this.colors[4] = color(#AEECEF);
}
  
  // Getter del número de colors
  int getNumColors(){
    return this.colors.length;
  }
  
  // Getter del color primari
  color getFirstColor(){
    return  this.colors[0];
  }
  
  // Getter del color secundari
  color getSecondColor(){
    return  this.colors[1];
  }
  
  // Getter del color terciari
  color getThirdColor(){
    return  this.colors[2];
  }
  
  // Getter del color i-èssim
  color getColorAt(int i){
    return this.colors[i];
  }
  
  
  // Dibuixa paleta de colors
  void displayColors(float x, float y, float w){
    pushStyle();
      //Llegenda
      fill(0); textAlign(LEFT); textSize(36);
      text("Colors:", x, y-10);
      
      // Paleta de colors
      float wc = w / getNumColors();
      for(int i=0; i<getNumColors(); i++){
        fill(getColorAt(i)); stroke(0); strokeWeight(3);
        rect(x + i*wc, y, wc, wc);
      }
    popStyle();
  }
