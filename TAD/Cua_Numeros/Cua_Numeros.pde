Cua c;

int lastOut = -1;
int lastIn = -1;
                                  
void setup(){
  size(800,800);
  c = new Cua();
}

void draw(){
  background(100, 255,100);
  c.display(50,100); 
  
  textSize(54); textAlign(LEFT);
  text("CUA (QUEUE)", 100, 400);
  
  textSize(34);
  text("Núm. Elements: "+c.numElements(), 100, 500);
  text("Empty: "+c.isEmpty(), 100, 550);
  text("Full: "+c.isFull(), 100, 600);
  text("Last Dequeued: "+lastOut, 100, 650);
  text("Last Enqueued: "+lastIn, 100, 700);
}

void keyPressed(){
  if(key=='a'){
    if(!c.isFull()){
      lastIn = (int)random(0, 100);
      c.encola(lastIn);
      println("ENQUEUE: "+lastIn);
    }
    else {
      println("NO ENQUEUE, Queue is full!!");
    }
  }
  else if(key=='r'){
    if(!c.isEmpty()){
      lastOut = c.desencola();
      println ("DEQUEUE: "+lastOut);
    }
    else {
      println("NO DEQUEUE, Queue is empty!!");
    }
  }
}
