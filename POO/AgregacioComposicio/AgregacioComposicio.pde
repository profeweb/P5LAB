A a;
B b;
C c;

void setup(){
  
  a = new A();
  b = new B();  // B es compon d'un A
  c = new C(a); // C s'hi agrega un A
  
  // As de B i C
  b.a.printA();
  c.a.printA();
  
  // Si destruim B, ja no podem accedir a A
  // Donarà NullPointerException
  b = null;
  //b.a.printA(); 
  
  // Si destruim C, encara accedir a A (fora de C)
  c = null;
  a.printA();
  
}
