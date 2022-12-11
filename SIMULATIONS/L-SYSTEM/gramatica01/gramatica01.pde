String current = "A";
int count = 0;
 
void setup() {
  println("Generation " + count + ": " + current);
}
 
void draw() {
}
 
void mousePressed() {
  String next = "";
  for (int i = 0; i < current.length(); i++) {
    char c = current.charAt(i);
    if (c == 'A') {
      next += "ABC";
    }  else if (c == 'B') {
      next += "AD";
    }
    else if (c == 'C') {
      next += "BD";
    }
    else {
      next += c;
    }
  }
  current = next;
  count++;
  println("Generation " + count + ": " + current);
}
