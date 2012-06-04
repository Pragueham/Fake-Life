//This causes the program to bug out currently. "unexpected character (" message

class Egg {
  float x, y, eggRadius;
  
  Egg(float xpos, float ypos) {
   x = xpos;
   y = ypos;
   eggRadius = 5;
  }
  
  void grow() {
    eggRadius += 2;
  }

  void display() {
    fill(107,179,142, 25);
    stroke(107,179,142);  
    ellipse(x, y, eggRadius, eggRadius);
  }
}
