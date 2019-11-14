
int numNumbers = 8;
int [] numbers;

void setup(){
  
  size(800,800);
  numbers = new color[numNumbers];
  
  for(int i=0; i<numbers.length; i++){
    numbers[i] = (int)random(0,11);
  }
}

void draw(){
  
  background(255);
  
  int sum = 0;
   
  for(int i=0; i<numbers.length; i++){
    int n = numbers[i];
    sum += n;
    fill(0);
    textSize(30); textAlign(RIGHT);
    text(n, width/2, 50 + 50*i);
  }
  
  strokeWeight(4);
  line(width/2 -50, 50*numNumbers +25 , width/2, 50*numNumbers + 25);
  
  line(width/2 - 75, 50*numNumbers, width/2 -75, 50*numNumbers - 25);
  line(width/2 - 90, 50*numNumbers - 12, width/2 -60, 50*numNumbers-12);
  
  fill(255,0,0);
  text(sum, width/2, 50*numNumbers + 50 +25);
}


void mousePressed(){
  for(int i=0; i<numbers.length; i++){
    numbers[i] = (int)random(0,11);
  }
}
