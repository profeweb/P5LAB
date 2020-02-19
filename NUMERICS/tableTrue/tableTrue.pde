

char[] inputs = {'A', 'B', 'C', 'D', 'E', 'F'};

int numInputs = 4;
int numRows;

int [][] tt;

int[] f;


void setup(){
  
  size(800,800);
  
  numRows = (int) Math.pow(2, numInputs);
  tt = new int [numInputs][numRows];
  
  for(int i=0; i<numInputs; i++){
    int v = 0;
    for(int j=0; j<numRows; j++){
      tt[i][j] = (v%2==0)? 0 : 1;
      if(i==0 && j%1==0){
        v++;
      }
      else if(i==1 && j%2==1){
        v++;
      }
      else if(i==2 && j%4==3){
        v++;
      }
      else if(i==3 && j%8==7){
        v++;
      }
    }
  }
  
  printArray(tt[1]);
}


void draw(){
  
  background(255);
  textAlign(CENTER);
  
  for(int i=0; i<numInputs; i++){
    fill(255,0,0); textSize(32);
    text(inputs[i], 100 + i*100, 50);
    for(int j=0; j<numRows; j++){
      fill(0); textSize(24);
      text(tt[i][j], 100 + i* 100, 100 + j*30);
    }
  }
  
}
