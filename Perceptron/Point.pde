class Point { //create a class Point, to show points on the screen

  float x; //the x coordinate
  float y; //the y coordinate
  float o; //1 or -1 depending on the output of the Perceptron

  Point(float x_, float y_, float o_) { //initialisation function for Point
    x = x_; //x is the value specified
    y = y_; //y is the value specified
    o = map(o_, -1, 1, 0, 255); //o gets mapped to between 0 and 255, (black and white);
  }

  void show() { //function that shows the points
    fill(o); //the colour of the point
    ellipse(x, y, 5, 5); //draw an ellips at the x,y coordinates.
  }
}