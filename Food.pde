class Food {
  float x, y, radius;
  int directionX, directionY;
  
  Food(float xpos, float ypos, float rad) {
   x = xpos;
   y = ypos;
   radius = rad;
  }
  void grow() {
    radius++;
  }
  void feed() {
     radius--;
  }
  void display() {
    fill(164,201,114,25);
    stroke(164,201,114);
    ellipse(x, y, radius, radius);
  }
}
