int a = 3;
int b = 7;

void setup(){
  size(800, 800);
  a = b - a;
}

void draw(){
  
  switch( a ){
    case 3: circle(width/2, height/2, 50);   
            break;
    case 4: rect(width/2, height/2, 50, 50); 
            break;
    case 7: point(width/2, height/2);        
            break;
  }

}
