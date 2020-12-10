
class Mosaic {
   
  // Dimensions del mosaic
  int x, y, w, h;

  // Informació del mosaic
  int numFiles, numColumnes;
  
  // Imatge seleccionada
  boolean imgSelected = false;
  String selectedImg = "";
  
  // Títols de les imatges del mosaic
  String[] imgs;
  
  // Imatges del mosaic
  SelectImage[] selImgs;
  
  
  // Constructor
  Mosaic(int x, int y, int w, int h, int nf, int nc){
    this.x = x; this.y = y; this.w = w; this.h = h;
    this.numFiles = nf; this.numColumnes = nc; 
  }
  
  // Setters
  
  void setImages(String[] imgs){
    this.imgs = imgs;
    selImgs = new SelectImage[this.imgs.length];
    createSelectImages();
  }
  
  void createSelectImages(){
    
    float imgWidth  = w / numColumnes;
    float imgHeight = h / numFiles;
    
    int numImg = 0;
    for(int nf=0; nf<numFiles; nf++){
      for(int nc=0; nc<numColumnes; nc++){
        if(numImg>=imgs.length){
          break;
        }
        else {
      
          String title = imgs[numImg];
          float xImg = x + imgWidth*nc;
          float yImg = y + imgHeight*nf;
      
          selImgs[numImg]= new SelectImage(title, xImg, yImg, imgWidth, imgHeight);
      
          numImg++;
        }
      }
       
    }
  }
  
  
  // Dibuixa el Mosaic
  void display(){
    
    fill(150); noStroke();
    rect(x, y, w, h);
    
    for(SelectImage s : selImgs){
      if(s!=null){
        s.display();
      }
    }
    
    if(imgSelected){
      fill(0); textAlign(CENTER); textSize(38);
      text(selectedImg, x+w/2, y + h + 100);
    }
  }
  
  // Comprova si pitjam sobre les imatges del Mosaic
  void checkImgs(){
    for(SelectImage s : selImgs){
      if((s!=null)&&(s.mouseOver())){
        boolean prevState = s.selected;
        deselectAll();
        s.setSelected(!prevState);
        if(s.selected){
          imgSelected = true;
          selectedImg = s.title;
        }
        else {
          imgSelected = false;
        }
      }
    }
  }
  
  // Deselecciona totes les imatges del mosaic
  void deselectAll(){
    for(SelectImage s : selImgs){
      if(s!=null){
        s.setSelected(false);
      }
    }
  }
  
}
