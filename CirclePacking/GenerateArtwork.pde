
void generateArtwork()
{
  float xStart = mouseX;
  float yStart = mouseY;
  float xPos = xStart;
  float yPos = yStart;
  
  raisePen();

  ToDoList = (PVector[]) append(ToDoList, new PVector(xPos, yPos)); // move to first point
  
  dropPen();
 
 // makeX(mouseX, mouseY);
 // makeCircle(mouseX, mouseY, random(2,30));
  // packShapes(number, sizes, spacing)
  packShapes(20, 50, 50);
}
