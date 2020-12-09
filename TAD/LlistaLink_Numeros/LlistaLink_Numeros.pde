LlistaLink l;

int lastOut = -1;
int lastIn = -1;
                                  
void setup(){
  size(800,800);
  l = new LlistaLink();
}

void draw(){
  background(100, 255,100);
  l.display(50,100); 
  
  textSize(54); textAlign(LEFT);
  text("LLISTA (ARRAY LIST)", 100, 400);
  
  textSize(34);
  text("Núm. Elements: "+l.numElements(), 100, 500);
  text("Empty: "+l.isEmpty(), 100, 550);
  //text("First / Last: "+l.getFirst() + " / " +l.getLast(), 100, 650);
  text("Last In / Last Out: "+lastIn + " / "+ lastOut, 100, 700);
}

void keyPressed(){
  if(key=='a'){
     lastIn = (int)random(0, 100);
     l.append(lastIn);
     println("APPENDED: "+lastIn);
  }
  else if(key=='p'){
     lastIn = (int)random(0, 100);
     l.prepend(lastIn);
     println("PREPENDED: "+lastIn);
  }
  else if(key=='i'){
      lastIn = (int)random(0, 100);
      int rp = (int)random(0, l.numElements());
      //l.insertAt(rp,lastIn);
      println("INSERTED: "+lastIn);
  }
  else if(key=='r'){
    if(!l.isEmpty()){
      int nr = (int)random(0, l.numElements());
      lastOut = 0; //l.removeAt(nr);
      println ("REMOVED: "+lastOut);
    }
    else {
      println("NO REMOVED, List is empty!!");
    }
  }
}
