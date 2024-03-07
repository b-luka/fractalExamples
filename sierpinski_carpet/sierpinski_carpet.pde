float log3(float x) {
  return (log(x) / log(3));
}

void sierpinski_carpet(float sq_size, int x, int y) {
  if (sq_size < 1) return;
  
  rectMode(CENTER);
  fill((int)(255 * log3(sq_size) / log3(width)));
  rect(x, y, sq_size, sq_size);
  
  sierpinski_carpet(sq_size / 3, x + (int)sq_size, y + (int)sq_size);
  sierpinski_carpet(sq_size / 3, x + (int)sq_size, y - (int)sq_size);
  sierpinski_carpet(sq_size / 3, x - (int)sq_size, y + (int)sq_size);
  sierpinski_carpet(sq_size / 3, x - (int)sq_size, y - (int)sq_size);
  sierpinski_carpet(sq_size / 3, x + (int)sq_size, y);
  sierpinski_carpet(sq_size / 3, x - (int)sq_size, y);
  sierpinski_carpet(sq_size / 3, x, y + (int)sq_size);
  sierpinski_carpet(sq_size / 3, x, y - (int)sq_size);
}

void setup () {
  size(1500, 1500);
  background(0);
  fill(255);
  sierpinski_carpet(width/3, width/2, height/2);
}

void draw () {
  ;
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    saveFrame("carpet###.png");
  }
}
