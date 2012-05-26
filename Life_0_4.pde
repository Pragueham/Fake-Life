//1.  Make eggs stay in the place that they have been conceived
//2.  Get eggs to change colour once they hatch
ArrayList balls;
ArrayList food;
int radius = 60;

void setup() {
  size(1000, 1000);
  smooth();
  balls = new ArrayList();
  food = new ArrayList();
  for (int i = 0; i < 8 ; i++) {
    balls.add(new Ball(random(radius, 1000-radius), random(radius, 1000-radius), 20, -1, 1, random(1), false));
  }
  for (int j = 0; j < 3; j++) {
    food.add(new Food(random(radius, 1000-radius), random(radius, 1000-radius), random(radius, 50-radius)));
  }
}

void draw() {
  fill(255);
  rect(0, 0, width, height);
  for (int i = 0; i < balls.size(); i++) {
    Ball b1 = (Ball) balls.get(i);
    if (b1.isEgg == false) {
    for (int j = 0; j < balls.size(); j++) {
           //Make sure it's not the same ball being compared
           if (i != j) {
             //Get the second ball
             Ball b2 = (Ball) balls.get(j);  
               //collision detection
               if ((circle_collision(b1.x, b1.y, b1.radius, b2.x,b2.y, b2.radius)) == true) {
                 //noLoop();
                 if (b1.gender != b2.gender && b1.isEgg == false) {
                   //Change direction on breed
                   b1.directionChange();
                   b2.directionChange();
                   // Add new ball and append to array
                   balls.add(new Ball(random(radius, 1000-radius), random(radius, 1000-radius), 10,  -1, 1, random(1), true));           
                 } else {
                   if (b1.gender = true) {
                     if (b1.radius >= b2.radius) {
                       b1.radius -= b2.radius;
                       b2.radius = 0;
                     } else {
                       b2.radius -= b1.radius;
                       b1.radius = 0;
                     }
                    } else {
                      b1.directionChange();
                      b2.directionChange();
                   }
               }
             }
           }
         }
         // kill balls that are too small
         if (b1.radius < 4) {
          balls.remove(i);
         } else {
         b1.move();
         b1.display();
         }
          for (int a = 0; a < food.size(); a++) {
            Food f = (Food) food.get(a);
            if ((circle_collision(b1.x, b1.y, b1.radius, f.x,f.y, f.radius)) == true) {
              b1.grow();
              b1.directionChange();
              f.feed();
        
          }
            f.display();
            if (frameCount % 25 == 0 && i == 0) {
              f.grow();
             }
          }
        } else {
  if (b1.eggTimer > 200) {
    b1.isEgg = false;
  } else {
    if (b1.eggTimer % 20 == 0) {
      b1.grow();
    }
    b1.eggTimer++;
  }
  }     
}
}

boolean circle_collision(float x1, float y1, float d1, float x2, float y2, float d2) {

  // find distance between the two objects
  float xDist = x1-x2;                                   // distance horiz
  float yDist = y1-y2;                                   // distance vert
  float distance = sqrt((xDist*xDist) + (yDist*yDist));  // diagonal distance

  // test for collision
  if (d1/2 + d2/2 > distance) {
    return true;    // if a hit, return true
  }
  else {            // if not, return false
    return false;
  }
}
