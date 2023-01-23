int[][] Scores = {{98, 68, 65, 73, 67}, 
                  {77, 77, 88, 78, 90}, 
                  {53, 63, 74, 85, 72}, 
                  {77, 77, 68, 78, 91}, 
                  {88, 86, 90, 56, 81}}; 

void setup() {
  for (int STUDENT=0; STUDENT<=4; STUDENT++) { 
    println(( STUDENT +1) + " Student" );
      for (int EXAM=0; EXAM<=4; EXAM++) {
        if (Scores[STUDENT][EXAM] % 10 == 5) { 
          println( "----" + "Exam " + (EXAM+1) +": "+ Scores[STUDENT][EXAM]);
        }
    }
  }
}
