void packShapes(int numShapes, int sizes, int spacing) {
  for(int i = 0; i< numShapes; i++) {
    raisePen();
    makeCircle(mouseX,mouseY,random(1,sizes), spacing);
  }
}
