
// Input array
int[] nums = { 3, 7, 9, 2, 5, 1 , 6, 0, 4, 8};

void setup() {
  size(800, 800);
}

void draw() {
  
  background(220);
  
  fill(255,0,0); textSize(25); textAlign(CENTER);
  text("REVERSE AN ARRAY", width/2,50);
  
  // Display array content before reversing
  displayArrayContent(nums, 30, height/3, color(0));
  
  // Bottom index
  int bot = 0;
  // Top index
  int top = nums.length-1;
  
  //Reverse array
  while(bot<top){
    int temp = nums[top];
    nums[top] = nums[bot];
    nums[bot] = temp;
    bot++;
    top--;
  }
  
  // Display array content after reversing
  displayArrayContent(nums, 30, 2*height/3, color(0,0,255));
  
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
  textAlign(LEFT);
  text(txt, x, y);
}
