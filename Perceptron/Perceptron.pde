Neuron perceptron; //create a new Neuron object
ArrayList<Point> points; // Create an ArrayList to store the points that will be drawn
ArrayList<ArrayList> tests; //Create a new ArrayList to store the tests

void setup() {
  size(800, 800);
  perceptron = new Neuron(); //Initialise the Neuron
  tests = new ArrayList(generate_tests()); //Fill the tests ArrayList with tests
  for (ArrayList<Float> test : tests ) { //For each test in tests
    float x = test.get(0); //x is the first value in the test
    float y = test.get(1); //y is the second value in the test
    float o = test.get(2); //o is the third value in the test (the correct answer)

    perceptron.train(x, y, o); //train the Neuron with these values
  }
}

void draw() {
  background(127); //set the background to be grey
  line(0, f(0), 800, f(800)); //draw the line
  points = new ArrayList<Point>(); //initialise the points ArrayList
  tests = new ArrayList(generate_tests()); //fill the tests ArrayList with new tests
  for (ArrayList<Float> test : tests ) { //for each test in tests
    float x = test.get(0); //x is the first value in the test
    float y = test.get(1); //y is the second value in the test
    float o = test.get(2); //o is the third value in the test (the output)

    perceptron.train(x, y, o); //train the Neuron with these values
  }

  for (ArrayList<Float> test : tests ) { //for each test in tests
    float x = test.get(0); //x is the first value of the test
    float y = test.get(1); //y is the seconf value of the test

    float o = perceptron.eval(x, y); //o is the output that the neuron gives with these inputs
    points.add(new Point(x, y, o)); //put a circle at this point, coloured based on the output
  }

  for (Point p : points) { //for each Point in the ArrayList points
    p.show(); //show the point
  }
}


ArrayList generate_tests() { //The function that generates tests
  ArrayList<ArrayList> tests = new ArrayList<ArrayList>(); //Create a new ArrayList called tests
  while (tests.size() < 2000) { //While the length of tests is less than 2000
    ArrayList<Float> test = new ArrayList<Float>(); //create a new ArrayList called test
    float x = random(width); //x is a random number between 0 and the width of the screen
    float y = random(height); //y is a random number between 0 and the height of the screen
    float o = 1; //set the correct answer to be 1

    if ( f(x) > y ) { // if the point is below the line
      o = -1; //set the correct answer to -1
    }
    test.add(x); //add x to the test
    test.add(y); //add y to the test
    test.add(o); //add the answer to the test
    tests.add(test); //add the test to the list of tests
  }

  return tests; //return the list of tests
}

float f(float x) { //The function that defines the line
  return x + 100; //A simple line
}