class ComplexNumber {
  double real, imaginary;
  
  public ComplexNumber(double re, double im) {
    real = re;
    imaginary = im;
  }
  
  public ComplexNumber(double re) {
    real = re;
    imaginary = 0;
  }
  
  public ComplexNumber() {
    real = 0;
    imaginary = 0;
  }
  
  public ComplexNumber(ComplexNumber c) {
    this.real = c.real;
    this.imaginary = c.imaginary;
  }
  
  public ComplexNumber add(ComplexNumber x) {
    return new ComplexNumber(this.real + x.real, this.imaginary + x.imaginary);
  }
  
  public ComplexNumber subtract(ComplexNumber x) {
    return new ComplexNumber(this.real - x.real, this.imaginary - x.imaginary);
  }
  
  public ComplexNumber multiply(ComplexNumber x) {
    return new ComplexNumber(this.real * x.real - this.imaginary * x.imaginary, this.real * x.imaginary + this.imaginary * x.real);
  }
  
  public double modulus() {
    return Math.sqrt(this.real * this.real + this.imaginary * this.imaginary);
  }
  
  public ComplexNumber divide(ComplexNumber x) {
    return new ComplexNumber((this.real * x.real + this.imaginary * x.imaginary) / (x.modulus() * x.modulus()),
                             (this.imaginary * x.real - this.real * x.imaginary) / (x.modulus() * x.modulus()));
  }
  
  public ComplexNumber power(int exp) {
    ComplexNumber res = new ComplexNumber(this);
    for (int i = 1; i < exp; i++) {
      res = res.multiply(this);
    }
    return res;
  }
  
  public String toString() {
    return this.real + (this.imaginary >= 0 ? " + " : " - ") + Math.abs(this.imaginary) + "i";
  } 
  
}
