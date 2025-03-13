//Jennifer Wu
//Feb 28, 2025
//2-3

//colour pallette
color red =      #FFADB6;
color orange =   #FFD6A5;
color yellow =   #FDFFB6;
color green =    #CAFFBF;
color teal =     #9BF6FF;
color blue =     #A0C4FF;
color purple =   #BDB2FF;
color pink =     #FFC7D7;
color grey =     #393A41;
color white =    #FFFFFF;
color black =    #000000;
color offwhite = #D3D1D1;

PImage flower;
boolean flowerOn; //true or false

//variables
color selectedColor;
float sliderY;
float r;
float thickness;

void setup() {
  size(800, 600);
  background(255);
  selectedColor = red;
  flower = loadImage ("Flower.png");
  flowerOn = false;
  sliderY = 220;
  thickness = 2;
  r = 3;
}

void draw() {
  fill(255);
  //toolbar
  stroke(0);
  strokeWeight(0);
  fill(grey);
  rect(700, 0, 100, 800);

  //flower button
  tactile(714, 400, 75, 75);
  flowerOnOff();
  strokeWeight(3);
  rect(714, 400, 75, 75);
  image(flower, 716, 402, 70, 70);
  
  //indicator
  fill(selectedColor);
  stroke(offwhite);
  strokeWeight(2);
  circle(735, 345, 40);
  stroke(0);
  strokeWeight(0);
  fill(0);
  circle(735, 345, r);
  r = map(sliderY, 215, 385, 3, 35);
  
  //colour buttons
  strokeWeight(2);

  tactile(725, 30, 15);
  fill(red);
  circle(725, 30, 30);

  tactile(775, 30, 15);
  fill(orange);
  circle(775, 30, 30);

  tactile(725, 80, 15);
  fill(yellow);
  circle(725, 80, 30);

  tactile(775, 80, 15);
  fill(green);
  circle(775, 80, 30);

  tactile(725, 130, 15);
  fill(teal);
  circle(725, 130, 30);

  tactile(775, 130, 15);
  fill(blue);
  circle(775, 130, 30);

  tactile(725, 180, 15);
  fill(purple);
  circle(725, 180, 30);

  tactile(775, 180, 15);
  fill(pink);
  circle(775, 180, 30);
  
  tactile(725, 230, 15);
  fill(white);
  circle(725, 230, 30);
  
  tactile(725, 280, 15);
  fill(black);
  circle(725, 280, 30);
  
  //slider
  strokeWeight(2);
  stroke(255);
  tactile(770, 215, 780, 385);
  line(775, 215, 775, 385);
  fill(255);
  circle(775, sliderY, 20);
  
  //new button
  tactile(715, 484, 70, 30);
  strokeWeight(3);
  stroke(0);
  fill(255);
  rect(715, 484, 70, 30);
  fill(0);
  text("new", 737, 502);
  
  //save button
  tactile(715, 522, 70, 30);
  rect(715, 522, 70, 30);
  fill(0);
  text("save", 737, 542);
  
  //load button
  tactile(715, 560, 70, 30);
  rect(715, 560, 70, 30);
  fill(0);
  text("load", 737, 580);
}

void tactile (int x, int y, int r) {
  if (dist(x, y, mouseX, mouseY) < r) {
    stroke(0);
  } else {
    stroke(255);
  }
}

void mouseDragged() {
  if (flowerOn == false) {
    //squiggly line
    strokeWeight(thickness);
    stroke(selectedColor);
    line(pmouseX, pmouseY, mouseX, mouseY);
  } else {
    //flower drawing
    image(flower, mouseX, mouseY, thickness, thickness);
    }
    
   controlSlider();
}

void mouseReleased() {
  //flower button
  if (mouseX > 714 && mouseX < 789 && mouseY > 400 && mouseY < 475) {
    flowerOn = !flowerOn;
  }
  
  //red button
  if (dist(725, 30, mouseX, mouseY) < 15) {
    selectedColor = red;
  }

  //orange button
  if (dist(775, 30, mouseX, mouseY) < 15) {
    selectedColor = orange;
  }

  //yellow button
  if (dist(725, 80, mouseX, mouseY) < 15) {
    selectedColor = yellow;
  }

  //green button
  if (dist(775, 80, mouseX, mouseY) < 15) {
    selectedColor = green;
  }
  //teal button
  if (dist(725, 130, mouseX, mouseY) < 15) {
    selectedColor = teal;
  }

  //blue button
  if (dist(775, 130, mouseX, mouseY) < 15) {
    selectedColor = blue;
  }
  //purple button
  if (dist(725, 180, mouseX, mouseY) < 15) {
    selectedColor = purple;
  }

  //pink button
  if (dist(775, 180, mouseX, mouseY) < 15) {
    selectedColor = pink;
  }
  
   controlSlider();  
   
   //new button
   if (mouseX > 715 && mouseX < 775 && mouseY > 484 && mouseY < 554 ) {
     fill(255);
     strokeWeight(0);
     rect(0, 0, 700, 800);
   }
   
   //load button
   if(mouseX > 715 && mouseX < 775 && mouseY > 560 && mouseY < 613) {
     selectInput("Pick an image to load", "openImage");
   }
   
    //save button
   if(mouseX > 715 && mouseX < 775 && mouseY > 522 && mouseY < 597) {
     selectOutput("Chose a name for your new image file", "saveImage");
   }
}

void controlSlider() {
  if (mouseY > 215 && mouseY < 385 && mouseX > 765 && mouseX < 785) {
    sliderY = mouseY;
  }    
    thickness = map(sliderY, 215, 385, 1, 200);
}

void tactile(int x, int y, int w, int h) {
if (mouseX > x && mouseX < x+w  && mouseY > y && mouseY < y+h) {
    fill(255, 255, 0);
  } else {
    fill(255);
  }

}

void flowerOnOff() {
  if (flowerOn == true) {
    stroke(255, 0, 0);
    strokeWeight(5);
  } else {
    stroke(0);
    strokeWeight(1);
  }
}

void saveImage(File f) {
  if (f != null) {
    PImage canvas = get( 71, 1, width -71, height-1);
    canvas.save(f.getAbsolutePath());
  }
}


void openImage(File f) {
  if (f != null) {
    //KLUDGE
    int n= 0;
    while (n < 10) {
      PImage pic = loadImage(f.getPath());
      image(pic, 0, 0);
      n = n + 1;
    }
  }
}
