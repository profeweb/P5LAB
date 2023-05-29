int numImg = 0;
String imgName = "SK-A-3262.jpg"; //"SK-A-4691.jpg";//"SK-A-4.jpg"; //"SK-A-3262.jpg";
PImage img;
PImage[][] imgs;
int numCols=7, numRows=7;
float widthImg, heightImg;

boolean[][] hidden;

void setup() {
  
  size(1000, 1000);
  img = loadImage(imgName);

  widthImg = img.width /  (float) numCols;
  heightImg = img.height / (float) numRows;

  imgs = new PImage[numRows][numCols];
  for (int r=0; r<numRows; r++) {
    for (int c=0; c<numCols; c++) {
      imgs[r][c] = img.get((int)(c*widthImg), (int)(r*heightImg), (int)(widthImg), (int)(heightImg));
    }
  }
  
  hidden = new boolean[numRows][numCols];
}

void draw() {
  background(255);
  if (keyPressed) {
    image(img, 0, 0, width, height);
  } else {
    displayPuzzle();
  }
  displayPuzzle();
}

void mousePressed() {
  shuffle();
}

void displayPuzzle(){
  for (int r=0; r<numRows; r++) {
      for (int c=0; c<numCols; c++) {
        image(imgs[r][c], c*width/numCols, r*height/(float)numRows, width/(float)numCols, height/(float)numRows);
        noFill();
        if(hidden[r][c]){
          fill(255);
        }
        rect(c*width/numCols, r*height/numRows, width/numCols, height/numRows);
      }
    }
}

void shuffle() {
  for (int t=0; t<10; t++) {
    
    int c1 = (int)random(0, numCols);
    int r1 = (int)random(0, numRows);
    
    int c2 = (int)random(0, numCols);
    int r2 = (int)random(0, numRows);
    
    PImage imgTemp = imgs[r1][c1];
    imgs[r1][c1] = imgs[r2][c2];
    imgs[r2][c2] = imgTemp;
  }
}

void keyPressed(){
  if(key=='h' || key=='H'){
    int r = (int)random(0, numRows);
    int c = (int)random(0, numCols);
    hidden[r][c] = true;
  }
}
