class TextArray {

  String[] depressionText = new String[5];
  String[] anxietyText = new String[5];

  TextArray() {
    depressionText[0] = "d0";
    depressionText[1] = "d1";
    depressionText[2] = "d2";
    depressionText[3] = "d3";
    depressionText[4] = "d4";

    anxietyText[0] = "a0";
    anxietyText[1] = "a1";
    anxietyText[2] = "a2";
    anxietyText[3] = "a3";
    anxietyText[4] = "a4";
  }

  void depressionDisplay() {

    text(depressionText[numberToCallText], random(width/2), random(height/2));
  }

  void anxietyDisplay() {
    
    text(anxietyText[numberToCallText], random(width/2), random(height/2));
  }
  
int numberToCallText = floor(random(0,4));
}