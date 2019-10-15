class Randomizer {
  // Data
  float perlinTime;
  float perlinValue;
  float perlinDelta;
  
  // Constructor
  Randomizer(float seed, float delta)
  {
    this.perlinDelta = delta;
    perlinTime = seed + delta;
    perlinValue = noise(perlinTime);
  }
  
  // Methods
  void update() {
    perlinTime += this.perlinDelta;
    perlinValue = noise(perlinTime);
  }
  
  float getPerlinRandom() {
    this.update();
    return this.perlinValue;
  }
  
  float getPseudoRandom() {
    return random(0,1); // placed here for conevience for students when calling random functions
  }
  
}
