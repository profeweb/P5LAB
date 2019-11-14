
int[] nums = { 3, 7, 9, 2, 5, 1 };

int start = 0;
int end = nums.length-1;
int step = 1;

void setup() {
  size(800, 800);
  printArray(nums);
}

void draw() {
  
  background(220);
  
  fill(0,255,0); textSize(20); textAlign(LEFT);
  text("LOOP ARRAY ASCENDING ORDER", 50,50);
  
  String txt="";
  
  for(int i=start; i<=end; i+=step){
    int value = nums[i];
    txt +=value;
    if(i<end){
      txt+=",";
    }
  }
  
  fill(0); textSize(80); textAlign(CENTER);
  text(txt, width/2, height/2);
}
