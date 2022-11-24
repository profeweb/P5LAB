// Objectes de la classe Cercle
Cercle c1, c2, c3;

SwitchButton bTheme;

void setup(){
  // Dimensions de l'App
  size(800, 800);
  
  // Inicialitza els colors de l'App
  setColors();
  
  // Defineix els cercles (posició, mida i color).
  c1 = new Cercle(width/4, height/2, midaCercle);
  c1.setColor(getFirstColor());  // Color primari
  
  c2 = new Cercle(width/2, height/2, midaCercle);
  c2.setColor(getSecondColor());  // Color secundari
  
  c3 = new Cercle(3*width/4, height/2, midaCercle);
  c3.setColor(getThirdColor());  // Color terciari
  
  bTheme = new SwitchButton(width/2 - 100, height - 100, 200, 50);
}


void draw(){
  
  // Dibuixa el fons (blanc)
  background(255);
  
  // Dibuixa els cercles (exemple de classes emprant colors).
  c1.display();
  c2.display();
  c3.display();
  
  // Dibuixa rectangle amb 5è color (exemple d'emprar els colors directament).
  fill(getColorAt(4)); noStroke();
  rect(0, 3*height/4, width, height/4);
  
  // Mostra la paleta de colors
  displayColors(100,100,width-200);
  
  // Dibuixa el botó del Tema
  bTheme.display();
}

void mousePressed(){
  
  if(bTheme.mouseOverButton()){
    bTheme.toggle();
    if(bTheme.enabled){
      colorTheme = 0;
      println("LIGHT THEME ("+colorTheme+")");
    }
    else {
      colorTheme = 1;
      println("DARK THEME ("+colorTheme+")");
    }
    c1.setColor(getFirstColor());
    c2.setColor(getSecondColor()); 
    c3.setColor(getThirdColor());
  }  
}
