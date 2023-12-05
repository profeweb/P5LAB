class Timer {
  
  int numSecondsToChange;
  int numSeconds;
  int lastTime;
  
  Timer(int ns){
    this.numSecondsToChange = ns;
    this.numSeconds = 0;
    this.lastTime = millis();
  }
  
  void update(){
    int now = millis();
    numSeconds = (now - lastTime) / 1000;
    if(timeOver()){
      resetTimer();
    }
  }
  
  void resetTimer(){
    lastTime = millis();
  }
  
  boolean timeOver(){
    return (numSeconds>= numSecondsToChange);
  }
  
}
