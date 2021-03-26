
class PagedMosaic {

  // Dimensions del mosaic
  int x, y, w, h;

  // Informació del mosaic
  int numFiles, numColumnes, numTotalImages;
  int numTotalPages, numImagesPage, currentPage;

  // Imatge seleccionada
  boolean imgSelected = false;
  String selectedImg = "";

  // Títols de les imatges del mosaic
  String[] imgs;

  // Imatges del mosaic
  PagedSelectImage[] selImgs;


  // Constructor
  PagedMosaic(int x, int y, int w, int h, int nf, int nc) {
    this.x = x; 
    this.y = y; 
    this.w = w; 
    this.h = h;
    this.numFiles = nf; 
    this.numColumnes = nc; 
    this.numImagesPage = nf*nc;
    this.currentPage = 0;
  }

  // Setters

  void setImages(String[] imgs) {
    this.imgs = imgs;
    this.numTotalImages = imgs.length;
    this.numTotalPages = this.numTotalImages / this.numImagesPage;
    int q = this.numTotalImages % this.numImagesPage;
    if (q>0) { 
      this.numTotalPages++;
    }
    selImgs = new PagedSelectImage[this.imgs.length];
    createSelectImages();
  }

  // Crea totes les imatges
  void createSelectImages() {

    float imgWidth  = w / numColumnes;
    float imgHeight = h / numFiles;

    for (int np=0; np<numTotalPages; np++) {
      for (int nf=0; nf<numFiles; nf++) {
        for (int nc=0; nc<numColumnes; nc++) {

          int numImage = np*numImagesPage + nf*numColumnes + nc;

          println(numImage);

          if (numImage>=imgs.length) {
            break;
          } else {

            String title = imgs[numImage];
            float xImg = x + imgWidth*nc;
            float yImg = y + imgHeight*nf;

            selImgs[numImage]= new PagedSelectImage(title, xImg, yImg, imgWidth, imgHeight, np, np==0);
          }
        }
      }
    }
  }


  // Dibuixa el Mosaic
  void display() {
    pushStyle();
      fill(150); 
      noStroke();
      rect(x, y, w, h);
  
      for (PagedSelectImage s : selImgs) {
        if (s!=null) {
          s.display();
        }
      }
  
      if (imgSelected) {
        fill(0); 
        textAlign(CENTER); 
        textSize(38);
        text(selectedImg, x+w/2, y + h + 100);
      }
      
      fill(0); textSize(38); textAlign(LEFT);
      text("Pàgina "+(currentPage+1)+"/"+numTotalPages, x, y + h + 100);
    popStyle();
  }

  // Comprova si pitjam sobre les imatges del Mosaic
  void checkImgs() {
    for (PagedSelectImage s : selImgs) {
      if ((s!=null)&&(s.mouseOver()&&(s.numPage==this.currentPage))) {
        boolean prevState = s.selected;
        deselectAll();
        s.setSelected(!prevState);
        if (s.selected) {
          imgSelected = true;
          selectedImg = s.title;
        } else {
          imgSelected = false;
        }
      }
    }
  }

  // Deselecciona totes les imatges del mosaic
  void deselectAll() {
    for (PagedSelectImage s : selImgs) {
      if (s!=null) {
        s.setSelected(false);
      }
    }
  }

  void update() {
    for (PagedSelectImage s : selImgs) {
      if (s!=null) {
        if (s.numPage==this.currentPage) {
          s.setEnabled(true);
        } else {
          s.setEnabled(false);
        }
      }
    }
  }

  void nextPage() {
    this.currentPage++;
    if (this.currentPage>= this.numTotalPages) {
      this.currentPage=0;
    }
  }

  void prevPage() {
    this.currentPage--;
    if (this.currentPage< 0) {
      this.currentPage=this.numTotalPages-1;
    }
  }
}
