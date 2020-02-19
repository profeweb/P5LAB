

String hexaColor="FF5500";

void setup(){
  size(800,800);
}


void draw(){
  
  int r = getColor(hexaColor, 0);
  int g = getColor(hexaColor, 2);
  int b = getColor(hexaColor, 4);
  
  background(r,g,b);
  
  fill(0); textSize(48); textAlign(CENTER);
  text("#"+hexaColor, width/2, height/3);
  
  text("rgb("+r+","+g+","+b+")", width/2, 2*height/3);
}


int getColor(String hex, int d){
  
  int nd = 0;
  int pot = 1;
  
  for(int i=d+1; i>=d; i--){
  
    char digit = hex.charAt(i);
    int n;
    switch(digit){
      case 'A': n = 10; break;
      case 'B': n = 11; break;
      case 'C': n = 12; break;
      case 'D': n = 13; break;
      case 'E': n = 14; break;
      case 'F': n = 15; break;
      default:  n = Character.getNumericValue(digit);
    }
    
    nd +=  n*pot;
    pot = pot * 16;
  }
  
  return nd;
  
}

void mousePressed(){
  char[] simbols = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E'};
  hexaColor="";
  for(int i=0; i<6; i++){
    int nr = (int)random(simbols.length);
    hexaColor+=simbols[nr];
  }
}
