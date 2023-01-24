// La classe B està composta per A
// A no existeix sense B

class B {
  
  A a;
  
  B(){
    a = new A();
  }
}
