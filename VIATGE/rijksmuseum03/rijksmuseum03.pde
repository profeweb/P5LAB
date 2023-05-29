String imgName = "SK-A-3262.jpg";
PImage img;

PImage[][] imgs;
float numCols=7, numRows=9;
float widthImg, heightImg;
float widthCol, heightRow;

void setup() {

  size(900, 1000);

  img = loadImage(imgName);

  widthImg = img.width / numCols;
  heightImg = img.height / numRows;

  widthCol = width / numCols;
  heightRow = height / numRows;

  makePieces();
  shuffle(10);
}

void draw() {
  background(255);
  if (keyPressed) {
    image(img, 0, 0, width, height);
  } else {
    displayPuzzle();
  }
}

void makePieces() {
  imgs = new PImage[(int)numRows][(int)numCols];
  for (int r=0; r<numRows; r++) {
    for (int c=0; c<numCols; c++) {
      int cornerX = (int)(c*widthImg);
      int cornerY = (int)(r*heightImg);
      imgs[r][c] = img.get(cornerX, cornerY, (int)(widthImg), (int)(heightImg));
    }
  }
}

void shuffle(int times) {
  for (int t=0; t<times; t++) {
    
    int c1 = (int)random(0, numCols);
    int r1 = (int)random(0, numRows);
    
    int c2 = (int)random(0, numCols);
    int r2 = (int)random(0, numRows);
    
    PImage imgTemp = imgs[r1][c1];
    imgs[r1][c1] = imgs[r2][c2];
    imgs[r2][c2] = imgTemp;
  }
}

void displayPuzzle() {
  for (int r=0; r<numRows; r++) {
    for (int c=0; c<numCols; c++) {

      float cornerX = c*widthCol;
      float cornerY = r*heightRow;

      image(imgs[r][c], cornerX, cornerY, widthCol, heightRow);
      noFill(); 
      strokeWeight(3);
      rect(cornerX, cornerY, widthImg, heightImg);
    }
  }
}
