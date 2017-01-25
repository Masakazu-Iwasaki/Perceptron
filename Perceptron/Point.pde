class Point {
 
  float x;
  float y;
  float o;
  
  Point(float x_, float y_, float o_) {
    x = x_;
    y = y_;
    o = map(o_, -1, 1, 0, 255);
  }
  
  void show() {
    fill(o);
    ellipse(x, y, 5, 5);
  }
  
  
}