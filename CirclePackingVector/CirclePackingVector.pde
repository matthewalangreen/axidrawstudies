import processing.svg.*;

ArrayList<Node> nodes = new ArrayList<Node>();
Randomizer distanceRandomizer; // used to generate Perlin randomness
Randomizer radiusRandomizer; // used to generate Perlin randomness

boolean recording; // to track state

void setup() {
 size(600,600);
 background(255);
 ellipseMode(RADIUS);
 strokeWeight(1);
 stroke(0);
 //beginRecord(SVG, "circlePacking.svg");
 //noLoop();
 nodes.add(new Node(new PVector(width/2, height/2))); // add first circle in the center
 nodes.get(0).show();
 distanceRandomizer = new Randomizer(0,2.5);
 radiusRandomizer = new Randomizer(0,2.5);
}

int count = 0; // to show iterations


void draw() {
  background(255);
  if (recording) {
   beginRecord(SVG, "frame-####.svg"); 
  }
  count++;
  println(count);
  
  Node n = new Node(); // make candidate
  
  // if it passes the tests, add it to the ArrayList
  boolean result = true;
  
  for(int i = 0; i<nodes.size(); i++) {

    // if the candidate node "n" doesn't fit... shrink it and check again...
    while (n.overlapQ(nodes.get(i))) {
      n.shrinkRadius(0.1);
      if(n.getRadius() < 1) {
        result = false;
      }
    }
   
   // early exit... this helped a bit
   if (result == false) {
    break; 
   }
  }
  
  // if the circle didn't overlap with any others then add it to nodes
  if (result == true) {
    nodes.add(n);
   // n.show();
  }
  
  for (int p = 0; p<nodes.size(); p++) {
   nodes.get(p).show(); 
  }
  
  if (recording) {
     endRecord();
     recording = false;
  }
    
}

void mousePressed() {
  recording = true; 
}
 
