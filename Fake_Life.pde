//1.  collision between females seems to cause breeding
//2.  Problem of megafemales
//3.  Food overlap doesn't seem to work
//4.  Feed function doesn't seem to work

ArrayList balls;
ArrayList food;
ArrayList eggs;
int radius = 60;

void setup() {
  size(1000, 1000);
  smooth();
  balls = new ArrayList();
  food = new ArrayList();
  eggs = new ArrayList();
  for (int i = 0; i < 8 ; i++) {
    balls.add(new Ball(random(radius, 1000-radius), random(radius, 1000-radius), radius, -1, 1, random(1)));
  }
  for (int j = 0; j < 3; j++) {
    food.add(new Food(random(radius, 1000-radius), random(radius, 1000-radius), random(radius, 50-radius)));
  }
}

void draw() {
  //draw over old stuff
  fill(255);
  rect(0, 0, width, height);
  //loop through the balls
  for (int i = 0; i < balls.size(); i++) {
    Ball b1 = (Ball) balls.get(i);
    b1.eggTimer++;
    b1.anger++;
    b1.collide++;
    //compare with the position of the other balls
    for (int j = 0; j < balls.size(); j++) {
       //Make sure it's not the same ball being compared
       if (i != j) {
         //Get the second ball
         Ball b2 = (Ball) balls.get(j);  
           //collision detection
           if ((circle_collision(b1.x, b1.y, b1.radius, b2.x,b2.y, b2.radius)) == true) {
             if (b1.gender != b2.gender && b1.eggTimer > 25 && b2.eggTimer > 25) {
               //Change direction on breed
               b1.directionChange();
               b2.directionChange();
               b1.eggTimer = 0;
               b2.eggTimer = 0;
               
               // Add new ball and append to array
               eggs.add(new Egg(b1.x, b1.y));           
             } else {
               if (b1.gender = true && b1.anger > 100) {
                 if (b1.radius >= b2.radius) {
                   b1.radius -= (b2.radius / 8);
                   b2.radius -= (b1.radius / 4);
                 } else {
                   b2.radius -= (b1.radius / 8);
                   b1.radius -= (b2.radius / 4);
                 }
                } else {
                  if (b1.collide > 25) {
                  b1.directionChange();
                  b1.collide = 0;
                  }
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
     //integrate food
      for (int a = 0; a < food.size(); a++) {
        Food f = (Food) food.get(a);
        //check if food is being eaten
        if ((circle_collision(b1.x, b1.y, b1.radius, f.x,f.y, f.radius)) == true) {
          b1.grow();
          if (b1.collide > 25) {
                  b1.directionChange();
                  b1.collide = 0;
          }
          f.feed();
    
        }
      }    
  } 
  //grow and hatch eggs
  if (eggs.size() > 0) {
    for(int k = 0; k < eggs.size(); k++) {
      Egg e = (Egg) eggs.get(k);
        if(e.eggRadius >= 60) {
           balls.add(new Ball(e.x, e.y, radius,  -1, 1, random(1)));
           eggs.remove(k);
        } else {
          e.display();
          if (frameCount % 25 == 0) { 
            e.grow(); 
        }
      }
    }
  }
  //check for food overlapping
  for (int a = 0; a < food.size(); a++) {
    Food f1 = (Food) food.get(a);
     //check if food is being eaten
     for (int b = 0; b < food.size(); b++) {
       Food f2 = (Food) food.get(b);
       if ((circle_collision(f1.x, f1.y, f1.radius, f2.x,f2.y, f2.radius)) != true) {
          if (frameCount % 25 == 0) {
            f1.grow();
          }
        }
      }    
      f1.display();     
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
