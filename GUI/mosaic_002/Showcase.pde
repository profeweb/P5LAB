import java.util.Arrays;
import java.util.Collections;
import java.util.List;

class Mosaic {
   
  // Dimensions del mosaic
  int x, y, w, h;

  // Informació del mosaic
  int numFiles, numColumnes;
  float imgWidth, imgHeight;
  
  // Títols de les imatges del mosaic
  String[] imgs;
  
  // Imatges del mosaic
  MosaicImage[] selImgs;
  
  // Ordre en que es mostren les imatges
  Integer[] ordreImgs;
  
  // Constructor
  Mosaic(int x, int y, int w, int h, int nf, int nc){
    this.x = x; this.y = y; this.w = w; this.h = h;
    this.numFiles = nf; this.numColumnes = nc; 
    this.imgWidth  = w / numColumnes;
    this.imgHeight = h / numFiles;
  }
  
  // Setters
  
  void setImages(String[] imgs){
    this.imgs = imgs;
    
    selImgs = new MosaicImage[this.imgs.length];
    ordreImgs = new Integer[this.imgs.length];
    for(int i=0; i<ordreImgs.length; i++){
      ordreImgs[i] = i;
    }
    createMosaicImages();
  }
  
  void createMosaicImages(){
    for(int i=0; i<imgs.length; i++){
      String title = imgs[i];     
      selImgs[i]= new MosaicImage(title); 
    }
  }
  
  // Getters
  
  int getNumImatges(){
    return this.numFiles*this.numColumnes;
  }
  
  int getNumTotalImatges(){
    return this.selImgs.length;
  }
  
  
  // Dibuixa el Mosaic
  void display(){
    
    fill(150); noStroke();
    rect(x, y, w, h);
    
    int numImg = 0;
    for(int nf=0; nf<numFiles; nf++){
      for(int nc=0; nc<numColumnes; nc++){
        if(numImg>=imgs.length){
          break;
        }
        else {
          float xImg = x + imgWidth*nc;
          float yImg = y + imgHeight*nf;
          MosaicImage s = selImgs[ordreImgs[numImg]];
          if(s!=null){
            s.display(xImg, yImg, imgWidth, imgHeight);
          }
          numImg++;
        }
      }
    }
  }
  
  // Reordena les imatges
  
  void mesclaImatges(){
    
    List<Integer> ordreList = Arrays.asList(ordreImgs);
    Collections.shuffle(ordreList);
    ordreImgs = ordreList.toArray(ordreImgs);
  }
  
}
