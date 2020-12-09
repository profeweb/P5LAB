
class Node {
  
   int value;
   Node seguent;
   
   Node(int v, Node seg){
     this.value = v;
     this.seguent = seg;
   }
   
   int getValue(){
     return this.value;
   }
}
