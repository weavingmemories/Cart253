// Pong
//
// A simple version of Pong using object-oriented programming.
// Allows to people to bounce a ball back and forth between
// two paddles that they control.
//
// No scoring. (Yet!)
// No score display. (Yet!)
// Pretty ugly. (Now!)
// Only two paddles. (So far!)

// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;
TextArray depressionText;
TextArray anxietyText;

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;

// The background colour during play (black)
color backgroundColor = color(0);

// Setting up static values during play if Anxiety's score is greater than Depression's score

int numStatic = 50;
int staticSizeMin = 1;
int staticSizeMax = 10;
color staticColor = color(random(50, 255), 0, 0);

// The score values for each player/paddle, as well as setting up the win state
int depressionScore = 0;
int anxietyScore = 0;
boolean winState = false;

// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size
  size(640, 480);

  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  leftPaddle = new Paddle(PADDLE_INSET, height/2, 2, 'w', 's');
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, -20, 'p', 'l');

  // Create the ball at the centre of the screen
  ball = new Ball(width/2, height/2);
  
  // Create Text instances for later
  depressionText = new TextArray();
  anxietyText = new TextArray();
}

// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

void draw() {
  
  // Before anything, the program checks if the win state has been reached yet.
  // If so, it will not run the game, but will run a win screen depending on which
  // score has reached 15 points (the winner).
  
  if (winState == true) {
    
    
  }
  
  if (winState == false) {
  // Fill the background each frame so we have animation
  background(backgroundColor);
  
  // Checks the scores and updates the game appropriately by calling its function
  checkScore();

  // Update the paddles and ball by calling their update methods
  leftPaddle.update();
  rightPaddle.update();
  ball.update();

  // Check if the ball has collided with either paddle
  // Added if statements after each collide to make sure the collision isn't overwritten by the second call of ball.collide
  ball.collide(leftPaddle);
  if (ball.touchPaddle == true) {
    depressionScore += 1;
  }
  ball.collide(rightPaddle);
  if (ball.touchPaddle == true) {
    anxietyScore += 1;
  }

  println(depressionScore);
  println(anxietyScore);

  // Check if the ball has gone off the screen
  if (ball.isOffScreen()) {
    // If it has, reset the ball
    ball.reset();
  }

  // Display the paddles and the ball
  leftPaddle.display();
  rightPaddle.display();
  ball.display();
  }
}

// keyPressed()
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

void keyPressed() {
  // Just call both paddles' own keyPressed methods
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();
}

// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
}

// The score is checked, and instead of displaying it blatantly on the screen,
// the game changes in appearance and function to display whether
// depression or anxiety is winning.

void checkScore() {
  if (depressionScore > anxietyScore) {
    frameRate(40);
    depressionText.depressionDisplay();
    if (depressionScore > 5) {
      frameRate(20);
    }
  }


  if (anxietyScore > depressionScore) {
    drawStatic(500, 1, 3, floor(random(0, 200)));
    anxietyText.anxietyDisplay();
    if (anxietyScore > 5) {
      drawStatic(250, 5, 15, 200);
    }
  }

  // Checking whether anxiety or depression's scores have hit the "win" point.
  // If so, activate the boolean winState, which will override the gameplay.

  if (anxietyScore >= 15 || depressionScore >= 15) {
    winState = true;
  }
}

void drawStatic(int _numStatic, int _staticSizeMin, int _staticSizeMax, color _staticColor) {
  for (int i = 0; i < _numStatic; i++) {
    color staticColor = _staticColor;
    staticSizeMin = _staticSizeMin;
    staticSizeMax = _staticSizeMax;
    float x = random(0, width);
    float y = random(0, height);
    fill(staticColor);
    ellipse(x, y, random(_staticSizeMin, _staticSizeMax), random(_staticSizeMin, _staticSizeMax));
  }
}