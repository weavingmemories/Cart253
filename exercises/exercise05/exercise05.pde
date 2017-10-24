float theta = 0;
float WIDTH = 50;
float HEIGHT = 50;
float DEPTH = 50;
int z = 0;
int x = 0;
int y = 0;

void setup() {
  size(640, 480, P3D);
}
void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(radians(45));
  rotateY(theta);
  for (int i = 0; i < 50; i++) {
    pushMatrix();
    translate(x + floor(random(-WIDTH/2, WIDTH/2)), y + floor(random(-HEIGHT/2, HEIGHT/2)), z + floor(random(-DEPTH/2, DEPTH/2))); // Translating in THREE DIMENSIONS!
    box(50);
    popMatrix();
  }
  theta += 0.01;
  popMatrix();
}