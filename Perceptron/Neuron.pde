class Neuron { //create a new Class called Neuron

  float wx; //the weighting of the x input
  float wy; //the weighting of the y input
  float wb; //the weighting of the bias
  float c; //constant that determines how fast the neuron can learn, bigger is faster but less precise
  float cb; //a separate learning constant for the bias, because it needs to be large

  Neuron() { //initialisation function for the neuron
    wx = random(-1, 1); //wx starts as a random number between -1 and 1
    wy = random(-1, 1); //wy starts as a random number between -1 and 1
    wb = random(-1, 1); //wb starts as a random number between -1 and 1
    c = 0.01; //learning constant is 0.01
    cb = 10; //learning constant is 10 for the bias
  }

  void train(float x, float y, float o) { //training function
    float e = o - eval(x, y); //the error is the correct answer - guess

    wx = wx + e * x * c; //wx is now wx + error * x * c
    wy = wy + e * y * c; //wy is now wy + error * y * c
    wb = wb + e * cb; //wb is now wb + error * cb
  }


  float sign(float i) { //function that returns 1 if input is positive and 0 if input is negative
    if (i > 0) { //if the input is positive
      return 1;
    } else { //if the input is negative (or 0)
      return -1;
    }
  }

  float eval (float x, float y) { //produces the output from two inputs
    float guess = ((x * wx) + (y * wy) + wb ); //guess is the sum of the inputs times their weights, plus the bias
    return sign(guess); //the output is the sign of guess
  }
}