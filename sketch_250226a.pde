//Jennifer Wu
//Feb 26, 2025
//2-3

//Pallette
color purple =    #DDB8F3;
color lightpink = #FFC8DD;
color pink =      #FFAFCC;
color lightblue = #BDE0FE;
color blue =      #A2D2FF;

int toggle;

void setup() {
  size(800, 600);
  strokeWeight(4);
  toggle = 1;
}

void draw() {
 background(lightblue); 
 
 
 fill(lightpink);
 stroke(pink);
 rect(100, 100, 200, 100);
 
 if (toggle > 0) {
 guidelines();
 }
 
}
  
void mouseReleased() {
  if (mouseX > 100 && mouseX < 300 && mouseY > 100 && mouseY < 200) {
    toggle = toggle * -1;
  } 
}

void guidelines() {
  fill (purple);
  stroke(purple);
  line(0, mouseY, width, mouseY);
  line(mouseX, 0, mouseX, width);
}
  
  
  
  
  
