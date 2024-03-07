int maxIterations = 50;
int pow = 2;
double centerX = 0;
double centerY = 0;
double zoom = 1;

void setup() {
  size(600, 600);
  background(255);
  translate(width/2, height/2);
  mandelbrot();
}

public static double mapRange(double a1, double a2, double b1, double b2, double s){
    return b1 + ((s - a1)*(b2 - b1))/(a2 - a1);
}

void mandelbrot() {
  loadPixels();
  
  for (int i = 0; i < width * height; i++) {
    pixels[i] = color(255);
  }
  
    for (int i = 0; i < width; i++) {
      for (int j = 0; j < height; j++) {
        ComplexNumber pos = new ComplexNumber();
        ComplexNumber constant = new ComplexNumber(mapRange(0, width, (centerX - 1.5), (centerX + 0.5), i) * zoom,
                                                     mapRange(0, height, (centerY - 1), (centerY + 1), j) * zoom);
        for (int k = 0; k < maxIterations; k++) {
          
          //ComplexNumber constant = new ComplexNumber(mapRange(0, width, -1.5, 1.5, i), mapRange(0, height, -1.5, 1.5, j));
          //pos = constant.add(pos.multiply(pos));
          pos = constant.add(pos.power(pow));
          
          
          if (pos.modulus() > 2) {
            int col = (int)(255 * (pow / 2) * k / maxIterations);
            pixels[i + j * height] = color(col);
          }
        }
      }
    }
  
  updatePixels();
  println("done");
}

void draw() {
  translate(width/2, height/2);
  fill(0);
}

void mousePressed() {/*
  if (mouseButton == LEFT) {
    mandelbrot();
    double mouseRe = mapRange(0, width, -1.5, 0.5, mouseX);
    double mouseIm = mapRange(0, height, -1, 1, mouseY);
    ComplexNumber constant = new ComplexNumber(mouseRe, mouseIm);
    ComplexNumber pos = new ComplexNumber();
    //ComplexNumber prev = new ComplexNumber();
    stroke(color(255, 0, 0));
    strokeWeight(1);
    PShape path = createShape();
    path.beginShape(LINES);
    path.vertex(mouseX - width/2, mouseY - width/2);
    for (int i = 0; i < maxIterations; i++) {
      //prev = new ComplexNumber(pos);
      pos = constant.add(pos.multiply(pos));
      
      //line(xPrev, yPrev, xPos, yPos);
      path.vertex((float)mapRange(-1.5, 0.5, -width/2, width/2, pos.real), (float)mapRange(-1, 1, -height/2, height/2, pos.imaginary));
      
    }
    path.endShape();
    shape(path);
    
  }*/
  
  if (mouseButton == RIGHT) {
    //mandelbrot();
    saveFrame("set-###.png");
  }
}

void keyReleased() {
  if (keyCode == RIGHT) {
    centerX += 0.2 * zoom;
  }
  if (keyCode == LEFT) {
    centerX -= 0.2 * zoom;
  }
  if (keyCode == UP) {
    centerY -= 0.2 * zoom;
  }
  if (keyCode == DOWN) {
    centerY += 0.2 * zoom;
  }
  if (key == '-') {
    println(zoom);
    zoom *= 1.25;
    println(zoom);
  }
  if (key == '+') {
    println(zoom);
    zoom *= 0.8;
    println(zoom);
  }
  mandelbrot();
}
