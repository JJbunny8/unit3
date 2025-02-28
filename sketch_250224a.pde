//Jennifer Wu
//Feb 24, 2025
//2-3

//pallette of colours
color babypink    = #FFECF1;
color lightpink   = #FCCEDA;
color mediumpink  = #FFA8BD;
color darkpink    = #FF8FAB;
color darkestpink = #FB6F92;
color white       = #FFFFFF;

//variables for colour selection
color selectedColor;

void setup() {
  size(800, 600);
  strokeWeight(4);
  stroke(darkestpink);
  selectedColor = darkpink;
} //  setup end ===============================================================

void draw() {
  background(babypink);

  //buttons
  tactile(700, 100, 50);
  fill(lightpink);
  circle(700, 100, 100);

  tactile(700, 300, 50);
  fill(mediumpink);
  circle(700, 300, 100);
  
  tactile(700, 500, 50);
  fill(darkpink);
  circle(700, 500, 100);

  //indicator
  stroke(darkestpink);
  fill(selectedColor);
  square(100, 100, 400);
} //  end of draw =============================================================

void tactile (int x, int y, int r) {
 if (dist(x, y, mouseX, mouseY) < r) {
    stroke(white);
  } else {
    stroke(darkestpink);
  } 
} // end tactile ==============================================================


void mouseReleased() {
  //lightpink button
  if (dist(700, 100, mouseX, mouseY) < 50) {
    selectedColor = lightpink;
  }

  //mediumpink button
  if (dist(700, 300, mouseX, mouseY) < 50) {
    selectedColor = mediumpink;
  }

  //darkpink button
  if (dist(700, 500, mouseX, mouseY) < 50) {
    selectedColor = darkpink;
  }
} // end of mouseReleased
