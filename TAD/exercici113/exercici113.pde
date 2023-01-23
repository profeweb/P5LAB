int[][] Scores = {{98, 68, 65, 73, 67}, 
                  {77, 77, 88, 78, 90}, 
                  {53, 63, 74, 85, 72}, 
                  {77, 77, 68, 78, 91}, 
                  {88, 86, 90, 56, 81}}; 

void setup() {
  int TCOUNTER = 0;
  for (int STUDENT=0; STUDENT<=4; STUDENT++) { 
    println(( STUDENT +1) + " Student" );
      for (int EXAM=0; EXAM<=4; EXAM++) {
        int COUNTER = 0;
        int X = Scores[STUDENT][EXAM];
        while(X>0){
          if (X % 10 == 8) { 
            COUNTER = COUNTER +1;
            TCOUNTER = TCOUNTER +1;
          }
          X = X / 10;
        }
        println("----", "The grade of exam " + (EXAM+1), " has "+ COUNTER +" eight(s)." );
    }
  }
  println(" A total of "+ TCOUNTER + " eights appear in all grades" );
}
