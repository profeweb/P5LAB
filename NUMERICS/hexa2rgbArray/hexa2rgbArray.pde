

int numColors = 6;
String[] hexaColors;

void setup(){
  size(800,800);
  resetColors();
}


void draw(){
  
  
  for(int n=0; n<numColors; n++){
    
    int r = getColor(hexaColors[n], 0);
    int g = getColor(hexaColors[n], 2);
    int b = getColor(hexaColors[n], 4);
  
    fill(r,g,b); noStroke();
    rect(0, n*(height/numColors), width, (height/numColors));
  
    fill(0); textSize(32); textAlign(CENTER);
    String info = "#"+hexaColors[n]+" - rgb("+r+","+g+","+b+")";
    text(info, width/2, n*(height/numColors) + height/(2*numColors));
  }
  
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

void resetColors(){
  char[] simbols = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E'};
  hexaColors=new String[numColors];
  for(int n=0; n<numColors; n++){
    hexaColors[n]="";
    for(int i=0; i<6; i++){
      int nr = (int)random(simbols.length);
      hexaColors[n]+=simbols[nr];
    }
  }
}

void mousePressed(){
  resetColors();
}
