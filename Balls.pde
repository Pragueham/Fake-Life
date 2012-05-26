class Ball {
  float x, y, radius;
  int directionX, directionY, eggTimer;
  boolean gender, isEgg;
  color gStroke, gFill;
  
  Ball(float xpos, float ypos, float rad, int dirX, int dirY, float gen, boolean isAnEgg) {
   x = xpos;
   y = ypos;
   radius = rad;
   directionX = dirX;
   directionY = dirY; 
     if (gen < 0.5) {
       gender = true; 
       gFill = color(223,93,46,25);
       gStroke = color(223,93,46);
   } else {
       gender = false;
       gFill = color(255,180,62,25);
       gStroke = color(255,180,62);
   }
  }

  }
  void move() {
    x += directionX * 2;
    y += directionY * 2;
    if ((x > (width - radius)) || (x < radius)) {
      directionX *= -1;
  }
    
    if ((y > (height - radius)) || (y < radius)) {
      directionY *= -1;
  }
    
  }
  void grow() {
    radius++;
  }
  void directionChange() {
    directionX *= -1;
    directionY *= -1;
  }
  void display() {
    fill(gFill);
    stroke(gStroke);  
    ellipse(x, y, radius, radius);
  }
}
