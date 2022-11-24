// Fitxer amb la informació dels Colors de l'App
  
// Array de colors
color[][] colors;

// Tema
int colorTheme = 0;
  
// Estableix colors de l'App
void setColors(){
  
    this.colors = new color[2][5];
    
    // Light theme
    this.colors[0][0] = color(#068D9D);
    this.colors[0][1] = color(#53599A);
    this.colors[0][2] = color(#6D9DC5);
    this.colors[0][3] = color(#80DED9);
    this.colors[0][4] = color(#AEECEF);
    
    // Dark theme
    this.colors[1][0] = color(#1A1423);
    this.colors[1][1] = color(#372549);
    this.colors[1][2] = color(#774C60);
    this.colors[1][3] = color(#B75D69);
    this.colors[1][4] = color(#EACDC2);
}
  
  // Getter del número de colors
  int getNumColors(){
    return this.colors[0].length;
  }
  
  // Getter del color primari
  color getFirstColor(){
    return  this.colors[colorTheme][0];
  }
  
  // Getter del color secundari
  color getSecondColor(){
    return  this.colors[colorTheme][1];
  }
  
  // Getter del color terciari
  color getThirdColor(){
    return  this.colors[colorTheme][2];
  }
  
  // Getter del color i-èssim
  color getColorAt(int i){
    println(colorTheme);
    return this.colors[colorTheme][i];
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
