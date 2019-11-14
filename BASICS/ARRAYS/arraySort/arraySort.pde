
// Input array
int [] A = { 3, 7, 9, 2, 5, 1 };

void setup() {
  size(800, 800);
}

void draw() {
  
  background(220);
  
  fill(255,0,0); textSize(25); textAlign(CENTER);
  text("SORT AN ARRAY (BUBBLE SORT)", width/2,50);
  
  // Display array content before reversing
  displayArrayContent(A, width/2, height/3, color(0));
  
  
  //Sort array (Bubble Sort)
  for(int i= A.length-1;i>=1; i--){
      for(int j=0 ; j<=i-1; j++){
          if(A[j] > A[j+1]){
              int temp = A[j];
              A[j] = A[j+1];
              A[j+1] = temp;
          }
      }
  }
  
  // Display array content after reversing
  displayArrayContent(A, width/2, 2*height/3, color(0,0,255));
  
  noLoop();
  
}

void displayArrayContent(int[] a, int x, int y, color c){
  
  String txt="";
  
  for(int i=0; i<a.length; i++){
    int value = a[i];
    txt +=value;
    if(i<a.length-1){
      txt+=",";
    }
  }
  
  fill(c);
  textSize(80);
  textAlign(CENTER);
  text(txt, x, y);
}
