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
Table portraitData; // Table used as buffer for vertices from csv file
// Globals for sketch components
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

void setup(){
  //create the canvas
  size(600, 674);
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
}

void draw(){
 // call doSketch function to sketch the facial components based on passed in list of vertices
  noLoop(); // single sweep sketch only, disable image updates
  doSketch(face, false, fil, pencil);
  doSketch(chin, false, fil, pencil);
  doSketch(hair, false, blk, pencil);
  doSketch(lEyebrow, false, fil, pencil);
  doSketch(lEye, false, fil, pencil);
  doSketch(lIris, false, blk, pencil);
  doSketch(rEyebrow, false, fil, pencil);
  doSketch(rEye, false, fil, pencil);
  doSketch(rIris, false, blk, pencil);
  doSketch(nose, false, fil, pencil);
  doSketch(mouth, false, fil, pencil);
  doSketch(lips, false, wht, pencil);
  doSketch(lEar, false, fil, pencil);
  doSketch(rEar, false, fil, pencil);
  doSketch(neckLine, false, fil, pencil);
  doSketch(rJaw, false, fil, pencil);
  doSketch(lJaw, false, fil, pencil);
}