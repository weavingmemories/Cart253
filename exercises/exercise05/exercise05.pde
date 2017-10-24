float theta = 0;
float WIDTH = 50;
float HEIGHT = 50;
float DEPTH = 50;
int z = 0;
int x = 0;
int y = 0;
int randomRed = 50;
int randomGreen = 50;
int randomBlue = 50;

void setup() {
  size(640, 480, P3D);
}
void draw() {
  background(0);
  pushMatrix();
    
spotLight(randomRed, randomGreen, randomBlue, mouseX/2, mouseY/2, 0, mouseX*2, mouseY*2, 0, 90, 2);

  translate(width/2, height/2, 0);
  rotateX(radians(45));
  rotateY(theta);
  for (int i = 0; i < 50; i++) {
    pickNewColor();
    pushMatrix();
    translate(x + floor(random(-WIDTH/2, WIDTH/2)), y + floor(random(-HEIGHT/2, HEIGHT/2)), z + floor(random(-DEPTH/2, DEPTH/2))); // Translating in THREE DIMENSIONS!
    box(25);
    popMatrix();
  }
  theta += 0.01;
  popMatrix();
}

void mousePressed() {
  WIDTH+=100;
  HEIGHT+=100;
  DEPTH+=100;
}

void mouseReleased() {
  WIDTH-=100;
  HEIGHT-=100;
  DEPTH-=100;
}

void pickNewColor() {
  randomRed = floor(random(255));
  randomGreen = floor(random(255));
  randomBlue = floor(random(255));
}