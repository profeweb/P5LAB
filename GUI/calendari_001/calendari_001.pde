Calendari c;

void setup(){
  size(800,800);
  c = new Calendari();
}

void draw(){
  
  background(100);
  c.display(50,100,700,650);
}

void keyPressed(){
  if(keyCode==LEFT){
    c.prevMonth();
    println("PREV MONTH");
  }
  else if(keyCode==RIGHT){
    c.nextMonth();
    println("PREV MONTH");
  }
}
