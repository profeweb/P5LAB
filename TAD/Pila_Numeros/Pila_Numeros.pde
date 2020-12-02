
Pila p;

int lastPopped = -1;
int lastPushed = -1;
                                  
void setup(){
  size(800,800);
  p = new Pila();
}

void draw(){
  background(255, 100,100);
  p.display(100,50); 
  
  textSize(54);
  text("PILA (STACK)", 400, 100);
  
  textSize(34);
  text("Empty: "+p.isEmpty(), 400, 200);
  text("Full: "+p.isFull(), 400, 250);
  text("Last Popped: "+lastPopped, 400, 300);
  text("Last Pushed: "+lastPushed, 400, 350);
}

void keyPressed(){
  if(key=='a'){
    if(!p.isFull()){
      lastPushed = (int)random(0, 100);
      p.push(lastPushed);
      println("PUSH: "+lastPushed);
    }
    else {
      println("NO PUSH, Stack is full!!");
    }
  }
  else if(key=='r'){
    if(!p.isEmpty()){
      lastPopped = p.pop();
      println ("POP: "+lastPopped);
    }
    else {
      println("NO POP, Stack is empty!!");
    }
  }
}
