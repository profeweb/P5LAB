// Arrays
int[] nums1 = {7, 2, 1, 8};
int[] nums2 = {3, 5, 2, 4};

void setup(){
  
  println("UNIÓ SENSE REPETITS:");
  int[] un = unio2(nums1, nums2);
  printArray(un);
  
  println("INTERSECCIÓ:");
  int[] in = interseccio(nums1, nums2);
  printArray(in);
  
  println("DIFERÈNCIA:");
  int[] di = diferencia(nums1, nums2);
  printArray(di);
  
}

int[] interseccio(int[] a, int[] b ){
  int[] c = new int[min(a.length,b.length)];
  int k = 0;
  for(int i=0; i<a.length; i++){
    if(hiEs(a[i], b)){
      c[k]= a[i];
      k++;
    }
  }
  return c;
}

int[] unio(int[] a, int[] b ){
  int[] c = new int[a.length+b.length];
  for(int i=0; i<a.length; i++){
    c[i] = a[i];
  }
  int i = a.length;
  for(int k=0; k<b.length; k++){
    c[i] = b[k];
    i++;
  }
  return c;
}

int[] unio2(int[] a, int[] b ){
  int[] c = new int[a.length+b.length];
  for(int i=0; i<a.length; i++){
    c[i] = a[i];
  }
  int i = a.length;
  for(int k=0; k<b.length; k++){
    if(!hiEs(b[k], a)){
      c[i] = b[k];
      i++;
    }
  }
  return c;
}

int[] diferencia(int[] a, int[] b ){
  int[] c = new int[a.length];
  int k = 0;
  for(int i=0; i<a.length; i++){
    if(!hiEs(a[i], b)){
      c[k]= a[i];
      k++;
    }
  }
  return c;
}


boolean hiEs(int v, int[] a){
  for(int i=0; i<a.length; i++){
    if(a[i]==v){
      return true;
    }
  }
  return false;
}
