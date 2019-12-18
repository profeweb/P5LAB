

PImage im[] = new PImage[10];
String imFile[] = {"0.jpg", "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg"};

float mida = 200;

void setup(){
  size(400, 600);
  for(int i=0;i<10;i++){
    im[i] = loadImage(imFile[i]);
  }
}


void draw(){
  background(200);
  
  int h = hour();
  int h_dec = int(h/10);
  int h_uni = h- h_dec * 10;
  
  image(im[h_dec], 0, 0, mida, mida);
  image(im[h_uni], mida, 0, mida, mida);
  
  int m = minute();
  int m_dec = int(m/10);
  int m_uni = m- m_dec * 10;
  
  image(im[m_dec], 0, mida, mida, mida);
  image(im[m_uni], mida, mida, mida, mida);
  
  int s = second();
  int s_dec = int(s/10);
  int s_uni = s- s_dec * 10;
  
  image(im[s_dec], 0, 2*mida, mida, mida);
  image(im[s_uni], mida, 2*mida, mida, mida);
}
