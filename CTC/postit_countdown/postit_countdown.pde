
boolean paused = false;

int stoppedTime;
int stoppedAcum=0;
int realTime;

int timer = 70;
int t;

PImage im[] = new PImage[10];
String imFile[] = {"0.jpg", "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg"};

float mida = 200;

void setup(){
  size(400, 400);
  for(int i=0;i<10;i++){
    im[i] = loadImage(imFile[i]);
  }
}


void draw(){
  background(200);
  
  if(!paused){
    realTime = millis() - stoppedAcum;
    t = timer - int(realTime/1000);
  }
  
  int m = t / 60;
  int m_dec = int(m/10);
  int m_uni = m- m_dec * 10;
  
  image(im[m_dec], 0, 0, mida, mida);
  image(im[m_uni], mida, 0, mida, mida);
  
  int s = t % 60;
  int s_dec = int(s/10);
  int s_uni = s- s_dec * 10;
  
  image(im[s_dec], 0, mida, mida, mida);
  image(im[s_uni], mida, mida, mida, mida);
}

void keyPressed(){
  if(key=='p' || key=='P'){
    paused = true;
    stoppedTime = millis();
    
  }
  else if(key=='s' || key=='S'){
    paused = false;
    stoppedAcum += millis()-stoppedTime;
  }
}
