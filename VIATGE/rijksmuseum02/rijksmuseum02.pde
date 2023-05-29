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
