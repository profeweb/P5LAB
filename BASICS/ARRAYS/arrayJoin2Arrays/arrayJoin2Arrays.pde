
// Two input arrays
int[] nums1 = { 3, 7, 9, 2, 5, 1 };
int[] nums2 = { 4, 8, 0, 6 };


// Output array
int[] nums3;


void setup() {
  size(800, 800);
  
  // Lengths of the 2 input arrays
  int n1 = nums1.length;
  int n2 = nums2.length;
   
  // Length of the output array
  int n3 = n1 + n2;
  
  // Creates the output array with the corresponding length.
  nums3 = new int[n3];
  
  //Join the two input arrays in the output array
  for(int i=0;i<n1;i++){
    int value = nums1[i];
    nums3[i] = value;
  }
  for(int i=0;i<n2;i++){
    int value = nums2 [i];
    nums3[n1+i] = value;
  }
  
  println("OUTPUT ARRAY:");
  printArray(nums3);
}

void draw() {
  
  background(220);
  
  fill(255,0,0); textSize(25); textAlign(CENTER);
  text("JOIN TWO ARRAYS IN A NEW ONE", width/2,50);
  
  displayArrayContent(nums1, 30, height/3, color(0));
  displayArrayContent(nums2, 30, height/2, color(0));
  displayArrayContent(nums3, 30, 2*height/3, color(0,0,255));
  
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
  textAlign(LEFT);
  text(txt, x, y);
}
