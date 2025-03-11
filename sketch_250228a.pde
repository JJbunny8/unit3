//Jennifer Wu
//Feb 28, 2025
//2-3

//colour pallette
color red =    #FFADB6;
color orange = #FFD6A5;
color yellow = #FDFFB6;
color green =  #CAFFBF;
color teal =   #9BF6FF;
color blue =   #A0C4FF;
color purple = #BDB2FF;
color pink =   #FFC7D7;
color grey =   #393A41;

PImage flower;
boolean flowerOn; //true or false
PImage strawberry;
boolean strawberryOn; //true or false

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
  strawberry = loadImage ("strawberry.png");
  strawberryOn = false;
  sliderY = 30;
  thickness = 2;
  r = 3;
}

void draw() {
  fill(255);
  //toolbar
  stroke(0);
  strokeWeight(0);
  fill(grey);
  rect(650, 0, 150, 800);

  //flower button
  tactile(680, 295, 90, 70);
  flowerOnOff();
  strokeWeight(3);
  rect(680, 295, 90, 70);
  image(flower, 690, 295, 70, 70);
  
  //strawberry button
  tactile(680, 380, 90, 70);
  strawberryOnOff();
  strokeWeight(3);
  rect(680, 375, 90, 70);
  image(strawberry, 680, 370, 90, 90);
  
  //indicator
  fill(selectedColor);
  stroke(255);
  strokeWeight(2);
  circle(770, 250, 40);
  stroke(0);
  strokeWeight(0);
  fill(0);
  circle(770, 250, r);
  r = map(sliderY, 20, 220, 3, 35);
  
  //eraser
  fill(255);
  rect(672, 235, 55, 40);

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
  
  //slider
  strokeWeight(2);
  stroke(255);
  tactile(680, 20, 680, 220);
  line(680, 20, 680, 200);
  fill(255);
  circle(680, sliderY, 20);
  
  //new button
  tactile(675, 465, 100, 30);
  strokeWeight(3);
  stroke(0);
  fill(255);
  rect(675, 465, 100, 30);
  text("save", 470, 500);
  
  //save button
  tactile(675, 505, 100, 30);
  rect(675, 505, 100, 30);
  text("save", 510, 500);
  
  //load button
  tactile(675, 545, 100, 30);
  rect(675, 545, 100, 30);
  text("save", 510, 500);
}

void tactile (int x, int y, int r) {
  if (dist(x, y, mouseX, mouseY) < r) {
    stroke(0);
  } else {
    stroke(255);
  }
}

void mouseDragged() {
  if (flowerOn == false && strawberryOn == false) {
    //squiggly line
    strokeWeight(thickness);
    stroke(selectedColor);
    line(pmouseX, pmouseY, mouseX, mouseY);
  } else {
    //flower drawing
    image(flower, mouseX, mouseY, thickness, thickness);
    }
    
    if (strawberryOn == false && flowerOn == false) {
    //squiggly line
    strokeWeight(thickness);
    stroke(selectedColor);
    line(pmouseX, pmouseY, mouseX, mouseY);
     } else {
    //strawberry drawing
    image(strawberry, mouseX, mouseY, thickness, thickness);
    }
   controlSlider();

}

void mouseReleased() {
  //flower button
  if (mouseX > 680 && mouseX < 770 && mouseY > 295 && mouseY < 365) {
    flowerOn = !flowerOn;
  }
  
  //strawberry button
  if (mouseX > 680 && mouseX < 770 && mouseY > 375 && mouseY < 445) {
    strawberryOn = !strawberryOn;
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
   if (mouseX > 675 && mouseX < 775 && mouseY > 465 && mouseY < 495 ) {
     fill(255);
     rect(0, 0, 648, 800);
   }
   
   //load button
   if(mouseX > 10 && mouseX < 60 && mouseY > 520 && mouseY < 545) {
     selectInput("Pick an image to load", "openImage");
   }
   
    //save button
   if(mouseX > 10 && mouseX < 60 && mouseY > 550 && mouseY < 575) {
     selectOutput("Chose a name for your new image file", "saveImage");
   }
}

void controlSlider() {
  if (mouseY > 20 && mouseY < 200 && mouseX > 670 && mouseX < 690) {
    sliderY = mouseY;
  }    
    thickness = map(sliderY, 20, 220, 1, 200);
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

void strawberryOnOff() {
  if (strawberryOn == true) {
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
