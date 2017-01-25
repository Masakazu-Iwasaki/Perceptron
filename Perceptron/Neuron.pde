class Neuron {

  float wx;
  float wy;
  float wb;
  float c;
  float cb;

  Neuron() {
    wx = random(-1, 1);
    wy = random(-1, 1);
    wb = random(-1, 1);
    c = 0.01;
    cb = 10;
  }

  void train(float x, float y, float o) {
    float e = o - eval(x, y);

    wx = wx + e * x * c;
    wy = wy + e * y * c;
    wb = wb + e * cb;
  }


  float sign(float i) {
    if (i > 0) {
      return 1;
    } else {
      return -1;
    }
  }

  float eval (float x, float y) {
   float guess = ((x * wx) + (y * wy) + wb );
   return sign(guess);
  }
}