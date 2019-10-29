/* CS276 - Project 1
 * Eddie Chan
 * 10/22/19
 */

File selectedFile;
PImage pi;
int w, h;

void setup(){
  // Set Canvas size to 500, 700 (500, 500 for the image, 500, 200 for the info box
  size(500, 700);
  selectInput("Choose a file to be processed: ", "fileSelected");
}

// Code to select a file to be processed
void fileSelected(File selection) {
  if (selection == null) {
    println("No file was selected for processing\n");
  } else {
    println("File selected for processing: " + selection.getAbsolutePath());
    selectedFile = selection;
    pi = loadImage(selectedFile.getAbsolutePath());
  }
}

void draw() {
  background(0);
  // If an image was selected, then display it
  if (pi != null) {
    image(pi, 0, 0);
    // Scale the image to 500 x 500 pixels to fit the predetermined image box 
    pi.resize(500, 500);
    
    w = pi.width;
    h = pi.height;
  }
  
  // Constrain mouseX and mouseY to not got over the size of the image
  float locationX = constrain(mouseX, 0, 500);
  float locationY = constrain(mouseY, 0, 500);
  
  // Find the individual RGB values for each pixel, based on mouse location
  float red = red(get().pixels[mouseX + mouseY * width]);
  float green = green(get().pixels[mouseX + mouseY * width]);
  float blue = blue(get().pixels[mouseX + mouseY * width]);
  
  // Find the percentage values of each RGB value by dividing each value by it's max - 255
  // Then *100 to get the percentage value
  float redPercent = red/255 * 100;
  float greenPercent = green/255 * 100;
  float bluePercent = blue/255 * 100;
  
  // Set fontsize to 12
  textSize(12);
  
  // Setup the interface for the info box
  fill(255,255,255);
  text("Filename: " + selectedFile, 20, 540);
  text("Image size: " + w + " Pixels x " + h + " Pixels", 20, 570);
  text("Coordinates: " + "(" + locationX +", " + locationY + ")", 20, 600);
  text("RGB Values: " + "(" + red + ", " + green + ", " + blue + ")", 20, 630);
  text("Visualisation: " + redPercent + "% red, " + greenPercent + "% green, " + bluePercent + "% blue", 20, 660);
}
    
