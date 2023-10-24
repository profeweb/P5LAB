
float marginX=50, marginY=50;
int numCols=50, numRows=50;
float colWidth, rowHeight;
float pal = 10;

float[][] field;

void setup(){
  size(800, 800);
  field = new float[numRows][numCols];
  setField();
  colWidth = (width - 2*marginX) / (float) numCols;
  rowHeight = (height - 2*marginY) / (float) numRows;
}


void draw(){
  background(255);
  setField();
  displayField();
}

void setField(){
  float nr=0;
  float nc=0;
  for(int r=0; r<field.length; r++){
    
    for(int c=0; c<field[r].length; c++){
      //field[r][c] = random(0, TWO_PI);
      field[r][c] = TWO_PI*noise(nr, sin(nc * nr), frameCount/500f);
      nc+=0.001;
    }
    nr+=0.001;
  }
}

void displayField(){
  for(int r=0; r<field.length; r++){
    for(int c=0; c<field[r].length; c++){
      
      float x1 = marginX + c*colWidth;
      float y1 = marginY + r*rowHeight;
      
      float x2 = x1 + pal*cos(field[r][c]);
      float y2 = y1 + pal*sin(field[r][c]);
      line(x1, y1, x2, y2);
    }
  }
}
