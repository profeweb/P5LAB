
class Carrousel {
   
  // Dimensions del carrousel
  int x, y, w, h;
  float imgW;
  float margeH = 15;

  // Informació del carrousel
  int numTotalImatges, numImatgesVisibles;
  
  // Index imatge actual
  int currentImage;
  
  // Títols de les imatges
  String[] noms;
  
  // Imatges del carrousel
  PImage[] imgs;
  
  // Constructor
  Carrousel(int x, int y, int w, int h, int nv){
    this.x = x; this.y = y; this.w = w; this.h = h;
    this.numImatgesVisibles = nv; 
    this.currentImage = 0;
    this.imgW = (w - margeH*(nv-1)) / (float) nv;
  }
  
  // Setters
  
  void setImages(String[] noms){
    this.noms = noms;
    this.numTotalImatges = noms.length;
    this.imgs = new PImage[noms.length];
    for(int i=0; i<imgs.length; i++){
      imgs[i] = loadImage(noms[i]);
    }
  }
  
  void next(){
    if(this.currentImage<this.numTotalImatges - this.numImatgesVisibles){
      this.currentImage++;
    }
  }
  
  void prev(){
    if(this.currentImage>0){
      this.currentImage--;
    }
  }
  
  
  // Dibuixa el Mosaic
  void display(){
    
    fill(150); noStroke();
    rect(x, y, w, h);
    
    for(int i=0; i<this.numImatgesVisibles; i++){
      
      int index = i + this.currentImage;
      float xPos = x + i*(this.imgW + this.margeH);
      
      // Imatge a mostrar
      PImage img = imgs[index];
      image(img, xPos, y, this.imgW, h);
      
      // Titol de la imatge
      fill(0); textAlign(CENTER); textSize(24);
      text(noms[index], xPos + this.imgW/2, y + h + 50);
    
      // Número de la imatge
      fill(200, 100, 100); noStroke();
      ellipse(xPos + 30, y + 30, 50, 50);
      fill(0);
      text(index, xPos + 30, y + 40);
    }
  }

  
}
