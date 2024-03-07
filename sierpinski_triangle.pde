float log3(float x) {
  return (log(x) / log(3));
}

void sierpinski_triangle(float tri_size, float x, float y) {
  if (tri_size < 1) return;
  
  noStroke();
  fill((int)(255 * log3(tri_size) / log3(width)));
  
  triangle(x + tri_size / 2, y - tri_size * 0.25,
           x - tri_size / 2, y - tri_size * 0.25,
           x, y + tri_size / 2);
  
  sierpinski_triangle(tri_size / 2, x + tri_size / 2, y + tri_size / 4);
  sierpinski_triangle(tri_size / 2, x - tri_size / 2, y + tri_size / 4);
  sierpinski_triangle(tri_size / 2, x, y - tri_size / 2);
}

void setup () {
  size(1000, 1000);
  background(255);
  fill(0);
  triangle(0, height * 0.85, width, height * 0.85, width/2, height * 0.1);
  sierpinski_triangle(width/2, width/2, height * 0.6);
  println("done");
}

void draw () {
  ;
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    saveFrame("triangle###.png");
  }
}
