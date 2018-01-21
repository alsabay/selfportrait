/*
Self Portrait using Processing Language. This program reads a json array file of vertices.
The vertices were recorded using this coordinate tool found at 
https://www.mobilefish.com/services/record_mouse_coordinates/record_mouse_coordinates.php.
My headshot image was uploaded, then coordinates were recorded by clicking on outlines of the image.
The list of vertices are grouped for the portrait components in csv format 
(eyes, face, nose etc), then curves are drawn using the Processing Instruction Set.
by: Al Sabay, Manny Farrugia
date: Jan 19 2018
*/

//Global variables for Al's portrait
//Color Pallette
color pencil = color(70,71,100); // gray
color fil = color(255, 255, 255); // white
color wht = color(255, 255, 255);
color blk = color(0,0,0);
color Paper = color(245, 244, 199); //cream
// sketch canvas location offsets
float xOffset = 0; // transform for moving the image, positive moves to the right, negative to left
float yOffset = 0; // transform for moving the image, positive moves down, negative moves up
float xOffsetm = 500; // transform for moving the image, positive moves to the right, negative to left
float yOffsetm = 100; // transform for moving the image, positive moves down, negative moves up
Table portraitData; // Table used as buffer for vertices from csv file
Table portraitManny; // Table for manny's vertices
// Globals for sketch components - Al
FloatList face = new FloatList();
FloatList chin = new FloatList();
FloatList lEyebrow = new FloatList();
FloatList lEye = new FloatList();
FloatList lIris = new FloatList();
FloatList rEyebrow = new FloatList();
FloatList rEye = new FloatList();
FloatList rIris = new FloatList();
FloatList nose = new FloatList();
FloatList mouth = new FloatList();
FloatList lips = new FloatList();
FloatList lEar = new FloatList();
FloatList rEar = new FloatList();
FloatList hair = new FloatList();
FloatList neckLine = new FloatList();
FloatList rJaw = new FloatList();
FloatList lJaw = new FloatList();

// Globals for sketch components - Manny
FloatList facem = new FloatList();
FloatList chinm = new FloatList();
FloatList lEyebrowm = new FloatList();
FloatList lEyem = new FloatList();
FloatList lIrism = new FloatList();
FloatList rEyebrowm = new FloatList();
FloatList rEyem = new FloatList();
FloatList rIrism = new FloatList();
FloatList nosem = new FloatList();
FloatList mouthm = new FloatList();
FloatList lipsm = new FloatList();
FloatList lEarm = new FloatList();
FloatList rEarm = new FloatList();
FloatList neckLinem = new FloatList();

void setup(){
  //create the canvas
  size(1000, 700);
  background(Paper);
  stroke(pencil);
  noFill();
  
  //load csv file containing vertex data for sketch
  portraitData = loadTable("alportraitData3.csv", "header");
  //load portrait components data into data structures/FloatList
  face = getVertices("faceOutline", portraitData);
  chin = getVertices("chin", portraitData);
  lEyebrow = getVertices("leftEyebrow", portraitData);
  lEye = getVertices("leftEye", portraitData);
  lIris = getVertices("leftIris", portraitData);
  rEyebrow = getVertices("rightEyebrow", portraitData);
  rEye = getVertices("rightEye", portraitData);
  rIris = getVertices("rightIris", portraitData);
  nose = getVertices("Nose", portraitData);
  mouth = getVertices("Mouth", portraitData);
  lips = getVertices("lips", portraitData);
  lEar = getVertices("leftEar", portraitData);
  rEar = getVertices("rightEar", portraitData);
  hair = getVertices("hair", portraitData);
  neckLine = getVertices("neckLine", portraitData);
  rJaw = getVertices("rightJaw", portraitData);
  lJaw = getVertices("leftJaw", portraitData);
  
  //load csv file containing vertex data for sketch
  portraitManny = loadTable("Manny.csv", "header");
  //load portrait components data into data structures/FloatList
  facem = getVertices("faceOutline", portraitManny);
  chinm = getVertices("chin", portraitManny);
  lEyebrowm = getVertices("leftEyebrow", portraitManny);
  lEyem = getVertices("leftEye", portraitManny);
  lIrism = getVertices("leftIris", portraitManny);
  rEyebrowm = getVertices("rightEyebrow", portraitManny);
  rEyem = getVertices("rightEye", portraitManny);
  rIrism = getVertices("rightIris", portraitManny);
  nosem = getVertices("Nose", portraitManny);
  mouthm = getVertices("Mouth", portraitManny);
  lipsm = getVertices("lips", portraitManny);
  lEarm = getVertices("leftEar", portraitManny);
  rEarm = getVertices("rightEar", portraitManny);
  neckLinem = getVertices("neckline", portraitManny);
}

void draw(){
 // call doSketch function to sketch the facial components based on passed in list of vertices
  noLoop(); // single sweep sketch only, disable image updates
  doSketch(face, false, true, fil, pencil);
  doSketch(chin, false, true, fil, pencil);
  doSketch(hair, false, true, blk, pencil);
  doSketch(lEyebrow, false, true, fil, pencil);
  doSketch(lEye, false, true, fil, pencil);
  doSketch(lIris, false, true, blk, pencil);
  doSketch(rEyebrow, false, true, fil, pencil);
  doSketch(rEye, false, true, fil, pencil);
  doSketch(rIris, false, true, blk, pencil);
  doSketch(nose, false, true, fil, pencil);
  doSketch(mouth, false, true, fil, pencil);
  doSketch(lips, false, true, wht, pencil);
  doSketch(lEar, false, true, fil, pencil);
  doSketch(rEar, false, true, fil, pencil);
  doSketch(neckLine, false, true, fil, pencil);
  doSketch(rJaw, false, true, fil, pencil);
  doSketch(lJaw, false, true, fil, pencil);
  
  // call doSketch functioin for Manny's data
  doSketch(facem, false, false, fil, pencil);
  doSketch(chinm, false, false, fil, pencil);
  doSketch(lEyebrowm, false, false, fil, pencil);
  doSketch(lEyem, false, false,fil,  pencil);
  doSketch(lIrism, false,  false,blk, pencil);
  doSketch(rEyebrowm, false, false, fil,  pencil);
  doSketch(rEyem, false,  false, fil, pencil);
  doSketch(rIrism, false, false, blk,  pencil);
  doSketch(nosem, false, false, fil, pencil);
  doSketch(mouthm, false, false, fil, pencil);
  doSketch(lipsm, false, false, wht, pencil);
  doSketch(lEarm, false, false,fil,  pencil);
  doSketch(rEarm, false, false,fil,  pencil);
  doSketch(neckLinem, false, false, fil, pencil);
}