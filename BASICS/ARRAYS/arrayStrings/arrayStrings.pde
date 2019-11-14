
int numWords = 5;
String [] words = {"bird", "dog", "horse", "shark", "frog", "Peter", "Mary",
                   "barks", "sings", "talks", "swims", "jumps", "eats", 
                   "loud", "clear", "nice", "kind", "slow", "fast",
                   "today", "yesterday", "tomorrow", "now", "later",
                   "daddy", "mummy", "granny", "sister", "son",
                   "rainbow", "ball", "knife", "laptop", "phone",
                   "in", "out", "over", "next",
                   "the", "a", "this", "that"};

void setup(){
  size(800,800);
}

void draw(){
  
  background(255);
  
  String message ="";
  
  for(int i=0; i<numWords; i++){
    int n = (int)random(words.length);
    String w = words[n];
    message += w + " ";
  }
  message+=".";
  
  fill(0);
  textSize(30);
  text(message,10,40);
  
  noLoop();
}


void mousePressed(){
  loop();
}
