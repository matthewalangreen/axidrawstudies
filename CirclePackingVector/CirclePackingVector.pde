import processing.svg.*;

ArrayList<Node> nodes = new ArrayList<Node>();
Randomizer distanceRandomizer; // used to generate Perlin randomness
Randomizer radiusRandomizer; // used to generate Perlin randomness

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

int count = 0;


void draw() {
  //background(255);
  count++;
  println(count);
  //stroke(0,255,0);
  //strokeWeight(4);
  //ellipse(width/2, height/2, 300,300);
  //stroke(0);
  //strokeWeight(1);
  // make new node candiditate

  Node n = new Node();
  
  // if it passes the tests, add it to the ArrayList
  boolean result = true;
  
  for(int i = 0; i<nodes.size(); i++) {

    
    while (n.overlapQ(nodes.get(i))) {
      n.shrinkRadius(0.1);
      if(n.getRadius() < 1) {
        result = false;
      }
    }
   //if (n.overlapQ(nodes.get(i))) {
   //  result = false;
   //}
   
   // early exit... this helped a bit
   if (result == false) {
    break; 
   }
  }
  
  // if the circle didn't overlap with any others then add it to nodes
  if (result == true) {
    nodes.add(n);
    n.show();
  }

  
  
  // show all nodes
  //for(int i = 0; i<nodes.size(); i++) {
  //  nodes.get(i).show();
  //}
  
  //endRecord();
}
 
