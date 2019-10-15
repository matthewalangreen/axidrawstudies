
// CIRCLE ------------------------------------------------------------------------------------
ArrayList<PVector> circlePoints;  //used to hold onto points for a circle that will be drawn
void findCirclePoints(float startX, float startY, float size) {
  circlePoints.clear();
  // Change this
  for(float i = 0; i<PI; i+=PI/36) {
    float tx = size*cos(i)*cos(i) + startX;
    float ty = size*cos(i)*sin(i) + startY;
    circlePoints.add(new PVector(tx,ty));
    //println(circlePoints.get(0).x);  // debugging
  }
}

// Change this
void makeCircle(float x, float y, float size, float spacing) {
 // change these to effect how far apart circles can be drawn
  //float minDist = -50; 
  //float maxDist = 50;
  
  // use these values for pseudo randomness in position of triangle 
   //x = x + map(randomizer.getPseudoRandom(),0,1,minDist,maxDist);
   //y = y + map(randomizer.getPseudoRandom(),0,1,minDist,maxDist);
    x = x + map(randomizer.getPerlinRandom(),0,1,-spacing,spacing);
   y = y + map(randomizer.getPerlinRandom(),0,1,-spacing,spacing);
  
   // shift the circle to center on (mouseX, mouseY)
    //x = x - size/2;
  
  // use these value for perlin randomness in position of triangle
  // x = x + map(randomizer.getPerlinRandom(),0,1,minDist,maxDist);
  // y = y + map(randomizer.getPerlinRandom(),0,1,minDist,maxDist);
  
  
  findCirclePoints(x, y, size);
  //dropPen(); // place here to enable drag lines
  ToDoList = (PVector[]) append(ToDoList, new PVector(circlePoints.get(0).x, circlePoints.get(0).y));
  dropPen(); //place here to remove drag lines
  
  for(int i = 1; i<circlePoints.size(); i++) {
    PVector temp = circlePoints.get(i);
    ToDoList = (PVector[]) append(ToDoList, new PVector(temp.x, temp.y));
  }
   raisePen();
}

// X ------------------------------------------------------------------------------------

void makeX(float x, float y) {
  // change these to effect how far apart x's can be drawn
  float minDist = 0; 
  float maxDist = 120;
  
  // use these values for pseudo randomness in position of x's 
 // x = x + map(randomizer.getPseudoRandom(),0,1,minDist,maxDist);
 // y = y + map(randomizer.getPseudoRandom(),0,1,minDist,maxDist);
  
  // use these value for perlin randomness in position of rectangle
  // x = x + map(randomizer.getPerlinRandom(),0,1,minDist,maxDist);
  // y = y + map(randomizer.getPerlinRandom(),0,1,minDist,maxDist);
  
  float firstX = x;
  float firstY = y;
  
  // change these to control size of rectangles
  float minLength = .1;
  float maxLength = 15;
 
  // use these values for pseudo randomness in size of rectangle
  //float h = map(randomizer.getPseudoRandom(),0,1,minLength,maxLength);
  
  // use these values for pelin randomness in size of rectangle
  float l = map(randomizer.getPerlinRandom(),0,1,minLength,maxLength);
  float p = l * (sqrt(2)/2);
  
   ToDoList = (PVector[]) append(ToDoList, new PVector(x-p, y+p));   // top left
   dropPen();
   ToDoList = (PVector[]) append(ToDoList, new PVector(x+p, y-p)); // bottom right
   raisePen();
   
   ToDoList = (PVector[]) append(ToDoList, new PVector(x+p, y+p)); // top right
   dropPen();
   ToDoList = (PVector[]) append(ToDoList, new PVector(x-p, y-p)); // bottom left
   raisePen();
   ToDoList = (PVector[]) append(ToDoList, new PVector(x, y)); // go to center point

}
