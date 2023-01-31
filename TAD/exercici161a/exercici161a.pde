
int[] ARRAY = new int[10];
int NUM_ELEMENTS = 0;

void setup() {
  insert(4);
  insert(8);
  insert(5);
  insert(12);
  insert(34);
  insert(18);
  insert(15);
  insert(23);
  insert(77);
  insert(1);
  //insert(4);
  del(15);
  del(23);
  insert(99);
  del(11);
  del(4);
}

void insert(int ELEMENT) {
  println( "Inserint l’element:", ELEMENT);
  int J = 0;
  int K = 0;
  while (J<NUM_ELEMENTS && ARRAY[J]>ELEMENT) {
    J = J + 1;
  }
  K = NUM_ELEMENTS;
  while (K > J) {
    ARRAY[K] = ARRAY[K -1];
    K = K - 1;
  }
  ARRAY[J] = ELEMENT;
  NUM_ELEMENTS = NUM_ELEMENTS + 1;
  printArray(ARRAY);
}

void del(int SEARCHKEY) {
  println("Esborrant l'element", SEARCHKEY);
  int LOW = 0;
  int HIGH = NUM_ELEMENTS - 1;
  int C_INDEX = 0;
  boolean FOUND = false;
  while (LOW <= HIGH) {
    C_INDEX = ((LOW + HIGH ) / 2);
    if (ARRAY[C_INDEX] == SEARCHKEY) {
      FOUND = true;
      for(int M = C_INDEX; M<= NUM_ELEMENTS - 2; M++){
        ARRAY[M] = ARRAY[M + 1];
      }
      ARRAY[NUM_ELEMENTS -1] = 0;
      NUM_ELEMENTS = NUM_ELEMENTS -1;
      printArray(ARRAY);
    } else if (ARRAY[C_INDEX] > SEARCHKEY) {
      LOW = C_INDEX + 1;
    } else {
      HIGH = C_INDEX - 1;
    }
  }
  if ( FOUND == false ) {
    println( SEARCHKEY, " no trobat ");
  }

}
