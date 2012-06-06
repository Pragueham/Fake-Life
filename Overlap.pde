boolean overlap(float x1, float y1, float r1, float x2, float y2, float r2) {

  // Get ball 1 area
  float ball1BeginX = x1-r1;
  float ball1EndX = width-x1+r1;
  float ball1BeginY = y1-r1;
  float ball1EndY = height-y1+r1;
 // Get ball 2 area
  float ball2BeginX = x2-r2;
  float ball2EndX = width-x2+r2;
  float ball2BeginY = y2-r2;
  float ball2EndY = height-y2+r2;
  if (x1 > ball2BeginX && x1 < ball2EndX) {
    if (y1 > ball2BeginY && y1 < ball2EndY) {
       return true; 
    } else {
       return false; 
    }
  } else {
    return false;  
  }
}
