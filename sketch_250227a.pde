//Jennifer Wu
//Feb 27, 2025
//2-3

//Pallette

color mint =        #73FBD3;
color teal =        #44E5E7;
color blue =        #59D2FE;
color darkblue =    #4A8FE7;
color darkestblue = #5C7AFF;

float sliderX;
float shade;

void setup() {
  size(800, 600);
  strokeWeight(4);
  stroke(mint);
  fill(mint);
  sliderX = 400;
  shade = 0;
}

void draw() {
  background(shade);
  
  shade = map(sliderX, 100, 700, 0, 255);
  
  line(100, 300, 700, 300);
  circle(sliderX, 300, 50);  
}

void mouseDragged() {
  controlSlider();
 
}

void mouseReleased() {
  controlSlider();
 
}       

void controlSlider() {
  if (mouseX > 100 && mouseX < 700 && mouseY > 275 && mouseY < 325) {
    sliderX = mouseX;
  }   
  
}
