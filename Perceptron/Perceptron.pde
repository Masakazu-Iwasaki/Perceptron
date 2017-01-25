Neuron perceptron;
ArrayList<Point> points;
ArrayList<ArrayList> tests;

void setup() {
  size(800, 800);
  perceptron = new Neuron();
  tests = new ArrayList(generate_tests());
  points = new ArrayList<Point>();
  for (ArrayList<Float> test : tests ) {
    float x = test.get(0);
    float y = test.get(1);
    float o = test.get(2);

    perceptron.train(x, y, o);
  }
  print ("done");
}

void draw() {
  background(127);
  line(0, f(0), 800, f(800));
  points = new ArrayList<Point>();
  tests = new ArrayList(generate_tests());
  for (ArrayList<Float> test : tests ) {
    float x = test.get(0);
    float y = test.get(1);
    float o = test.get(2);

    perceptron.train(x, y, o);
  }

  for (ArrayList<Float> test : tests ) {
    float x = test.get(0);
    float y = test.get(1);

    float o = perceptron.eval(x, y);
    points.add(new Point(x, y, o));
  }

  for (Point p : points) {
    p.show();
  }
}


ArrayList generate_tests() {
  ArrayList<ArrayList> tests = new ArrayList<ArrayList>();
  while (tests.size() < 2000) {
    ArrayList<Float> test = new ArrayList<Float>();
    float x = random(width);
    float y = random(height);
    float o = 1;

    if ( f(x) > y ) {
      o = -1;
    }
    test.add(x);
    test.add(y);
    test.add(o);
    tests.add(test);
  }

  return tests;
}

float f(float x) {
  return x + 100;
}