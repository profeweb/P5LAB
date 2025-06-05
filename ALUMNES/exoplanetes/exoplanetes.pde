String[][] info;
int origenX = 150, origenY = 600;
int eixH = 500, eixV = 500;
int currentVal1, currentVal2;
String valueText1, valueText2;

void setup(){
  size(850, 850);
  
  // Obtenir les línies de dades
  String[] lines = loadStrings("exoplanetes.csv");
  
  // Obtenir el número de columnes
  int numCols = lines[0].split(",").length;
  
  // Crear l'array amb les caselles adients
  info = new String[lines.length][numCols];
  
  // Emplenar l'array amb les dades
  for(int l=0; l<lines.length; l++){
    info[l] = lines[l].split(",");
  }
  
  currentVal1 = 8;
  valueText1 = info[0][currentVal1];
  currentVal2 = 9;
  valueText2 = info[0][currentVal2];
  
  calculaGrafica(origenX, origenY, eixH, eixV, info, valueText1, valueText2);
  
}

void calculaGrafica(float origenX, float origenY, float eixH, float eixV, String[][] info, String valueText1, String valueText2){
  //String valueText1 = info[0][currentVal1];
  int indexValue1 = posicioColumna(info[0], valueText1);
  
  //String valueText2 = info[0][currentVal2];
  int indexValue2 = posicioColumna(info[0], valueText2);
  
  float maxVal1 =  maxValueColumn(info, indexValue1);
  float minVal1 =  minValueColumn(info, indexValue1);
  float maxVal2 =  maxValueColumn(info, indexValue2);
  float minVal2 =  minValueColumn(info, indexValue2);
  
  background(255);
  strokeWeight(2); stroke(0);
  line(origenX, origenY, origenX + eixH, origenY);
  line(origenX, origenY, origenX , origenY - eixV);
  
  for(int i=0; i<=10; i++){
    float y = origenY - i*(eixV/10);
    if(i>0){
    line(origenX-10, y, origenX +10, y);
    }
    fill(0); textAlign(RIGHT); textSize(14);
    float v = map(y, origenY, origenY - eixV, 0, maxVal2);
    float mv = (v / (1+v))*maxVal2;
    text(nf(mv, 1, 0), origenX -30, y + 4);
  }
  
  for(int i=0; i<=10; i++){
    float x = origenX + i*(eixH/10);
    if(i>0){
    line(x, origenY - 10, x, origenY +10);
    }
    fill(0); textAlign(RIGHT); textSize(14);
    float v = map(x, origenX, origenX + eixH, 0, maxVal1);
    float mv = (v / (1+v))*maxVal1;
    textAlign(LEFT);
    pushMatrix();
    translate(x, origenY + 10);
    rotate(PI/2f);
    text(nf(mv, 1, 2), 0, 0);
    popMatrix();
  }
  
  fill(0); textSize(18);
  textAlign(LEFT);
  text(valueText1, origenX + eixH + 5, origenY);
  textAlign(CENTER);
  text(valueText2, origenX, origenY - eixV - 10);
 
  textAlign(LEFT);
  text("MAV VAL1: "+ maxVal1, origenX + eixH + 5, origenY -eixV);
  text("MAV VAL2: "+ maxVal2, origenX + eixH + 5, origenY -eixV + 20);
  text("MIN VAL1: "+ minVal1, origenX + eixH + 5, origenY -eixV + 40);
  text("MIN VAL2: "+ minVal2, origenX + eixH + 5, origenY -eixV + 60);
  for(int i=1; i<info.length; i++){
    try{
      float value1 = Float.valueOf(removeTrailingZeros(info[i][indexValue1]));
      float logVal1 = value1/(abs(value1) + 1) ;
      float mapedVal1 = map(logVal1, 0, 1, origenX, origenX+eixH);
      float value2 = Float.valueOf(removeTrailingZeros(info[i][indexValue2]));
      float logVal2 = value2/(abs(value2) + 1) ;
      float mapedVal2 = map(logVal2, 0, 1, origenY-eixV, origenY);
      int numStars = Integer.valueOf(info[i][2]);
      if(numStars==1){
        stroke(255, 0, 0);
      }
      else if(numStars==2){
        stroke(0, 255, 0);
      }
      else if(numStars==3){
        stroke(0, 0, 255);
      }
      else {
        stroke(0);
      }
      point(mapedVal1, mapedVal2);
    }
    catch(NumberFormatException e){
    }
  }
}

int posicioColumna(String[] fila0, String colText){
  for(int i=0; i<fila0.length; i++){
    if(fila0[i].equals(colText)){
      return i;
    }
  }
  return -1;
}

float maxValueColumn(String[][] info, int indexCol){
  float maxV = Float.MIN_VALUE;
  for(int i=1; i<info.length; i++){
    try {
      float v = Float.valueOf(info[i][indexCol]);
      if(v>maxV){
        maxV = v;
      }
    }
    catch(Exception e){
    }
  }
  return maxV;
}

float minValueColumn(String[][] info, int indexCol){
  float minV = Float.MAX_VALUE;
  for(int i=1; i<info.length; i++){
    try {
      float v = Float.valueOf(info[i][indexCol]);
      if(v<minV){
        minV = v;
      }
    }
    catch(Exception e){
    }
  }
  return minV;
}

void draw(){

}

void keyPressed(){
  if(keyCode==RIGHT){
    currentVal1++;
    if(currentVal1>=info[0].length){
      currentVal1=8;
    }
  }
  else if(keyCode==LEFT){
    currentVal1--;
    if(currentVal1<8){
      currentVal1=info[0].length-1;
    }
  }
  else if(keyCode==UP){
    currentVal2++;
    if(currentVal2>=info[0].length){
      currentVal2=8;
    }
  }
  else if(keyCode==DOWN){
    currentVal2--;
    if(currentVal2<8){
      currentVal2=info[0].length-1;
    }
  }
  valueText1 = info[0][currentVal1];
  valueText2 = info[0][currentVal2];
  calculaGrafica(origenX, origenY, eixH, eixV, info, valueText1, valueText2);
}


String removeTrailingZeros(String s) {
    StringBuilder sb = new StringBuilder(s);
    while (sb.length() > 1 && 
           sb.charAt(sb.length() - 1) == '0' && 
           sb.charAt(sb.length() - 2) != '.') {
        sb.setLength(sb.length() - 1);
    }
    return sb.toString();
}
