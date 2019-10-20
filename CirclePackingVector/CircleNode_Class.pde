class Node {
  PVector center;
  float radius;
  float radiusRange = 50;
  float distanceRange = 300;
  

  
  //Node(PVector _center, float _radius) {
  //  center = _center;
  //  radius = _radius;
  //}
  
  Node(PVector _center) {
    center = _center;
    radius = random(radiusRange);
  }
  
  Node() {
    //float x = map(distanceRandomizer.getPerlinRandom(),0,1,-distanceRange, distanceRange);
    //float y = map(distanceRandomizer.getPerlinRandom(),0,1,-distanceRange, distanceRange);
    //float r = map(radiusRandomizer.getPerlinRandom(),0,1,radiusRange/50,radiusRange);
    
    float x = map(distanceRandomizer.getPseudoRandom(),0,1,-distanceRange, distanceRange);
    float y = map(distanceRandomizer.getPseudoRandom(),0,1,-distanceRange, distanceRange);
    float r = map(radiusRandomizer.getPseudoRandom(),0,1,radiusRange/4,radiusRange);
    center = new PVector(width/2 +x, height/2 + y);
    radius = r;
  }
  
  void show() {
    //fill(222,0,0,10);
   // noStroke();
  // noFill();
    ellipseMode(RADIUS);
    ellipse(center.x, center.y, radius, radius);
    //fill(0);
    //ellipse(center.x, center.y, 2,2);
    //noFill();
    //println(" center: ("+ center.x + "," + center.y + ")");
  }
  
  void shrinkRadius(float amount) {
    radius -= amount;
  }
  
  boolean overlapQ(Node n2) {
    // if distance between cicles is <= the sum of their radii, return true, else return false
    boolean result = false;
    if(center.dist(n2.center)<radius+n2.radius) {
      result = true;
    }
    return result;
  }
  
  float getRadius() {
   return radius; 
  }
  
 
}
