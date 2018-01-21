/*
Self Portrait using Processing Language. This program reads a json array file of vertices.
The vertices were recorded using this coordinate tool found at 
https://www.mobilefish.com/services/record_mouse_coordinates/record_mouse_coordinates.php.
My headshot image was uploaded, then coordinates were recorded by clicking on outlines of the image.
The list of vertices are grouped for the portrait components in json format 
(eyes, face, nose etc), then curves are drawn using the Processing Instruction Set.
by: Al Sabay
date: Jan 19 2018
*/

//Global variables
float xOffset = -100; // transform for moving the image, positive moves to the right, negative to left
float yOffset = -100; // transform for moving the image, positive moves down, negative moves up
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
  background(255);
  stroke(0);
  noFill();
  
  //load csv file
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
  doSketch(face);
  doSketch(chin);
  doSketch(hair);
  doSketch(lEyebrow);
  doSketch(lEye);
  doSketch(lIris);
  doSketch(rEyebrow);
  doSketch(rEye);
  doSketch(rIris);
  doSketch(nose);
  doSketch(mouth);
  doSketch(lips);
  doSketch(lEar);
  doSketch(rEar);
  doSketch(neckLine);
  doSketch(rJaw);
  doSketch(lJaw);
}