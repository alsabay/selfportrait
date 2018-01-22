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
float yOffset = 400; // transform for moving the image, positive moves down, negative moves up
float xOffsetm = 500; // transform for moving the image, positive moves to the right, negative to left
float yOffsetm = 400; // transform for moving the image, positive moves down, negative moves up
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

// Globals for Manny
float HeadHeight = 425; //y variable, delcration for the hight of the head in pixels
float HeadWidth = HeadHeight * 0.564705882352941; //x variable, declaration for the width of the head, fixed to 240 pixels 

void setup(){
  //create the canvas
  size(1000, 1000);
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
  
  // Manny's sketch
  bezier(HeadWidth - 30, HeadHeight - 21, HeadWidth + 23, HeadHeight+25, HeadWidth + 104, HeadHeight + 18, HeadWidth + 140, HeadHeight -16); // create bezier function
// bezier(x1,y1,x2,y2, x3,y3, x4,y4)

// Draw left cheek

bezier(HeadWidth- 30,HeadHeight-24,HeadWidth-50,HeadHeight-47,HeadWidth-70,HeadHeight-79,HeadWidth-63,HeadHeight-110);

// Draw right cheek

bezier(HeadWidth+168,HeadHeight-95,HeadWidth+154,HeadHeight-38,HeadWidth+142,HeadHeight-23,HeadWidth+133,HeadHeight-10);

//draw nose

bezier(HeadWidth + 82,HeadHeight-118,HeadWidth+87,HeadHeight-93,HeadWidth+18,HeadHeight-96,HeadWidth+21,HeadHeight-117);

// Draw left eye brow

bezier(HeadWidth-48,HeadHeight-205,HeadWidth-33,HeadHeight-207,HeadWidth-5,HeadHeight-203,HeadWidth+22,HeadHeight-195);

// Draw right eye brow

bezier(HeadWidth+79,HeadHeight-191,HeadWidth+98,HeadHeight-199,HeadWidth+126,HeadHeight-196,HeadWidth+150,HeadHeight-195);

//draw left eye

ellipse(HeadWidth-11,HeadHeight-174, 20, 20); // Draw epllise

//draw right eye
ellipse(HeadWidth+113,HeadHeight-168, 20, 20);

// Draw dimple

bezier(HeadWidth + 30, HeadHeight - 23, HeadWidth + 48, HeadHeight -24, HeadWidth + 56, HeadHeight -24, HeadWidth + 71, HeadHeight -19);

//Draw mouth

bezier(HeadWidth+8,HeadHeight-60,HeadWidth+45,HeadHeight-52,HeadWidth+78,HeadHeight-51,HeadWidth+96,HeadHeight-55);

// Draw right ear

beginShape();
vertex(HeadWidth+170, HeadHeight-189); // set vertext control points
bezierVertex(HeadWidth+194, HeadHeight-188, HeadWidth+208, HeadHeight-169, HeadWidth+169, HeadHeight-98); // create bezierVertext which depends on vertext points declared above
bezierVertex(HeadWidth+169, HeadHeight-98, HeadWidth+160, HeadHeight-154, HeadWidth+170, HeadHeight-189);
endShape();

// Draw left ear

beginShape();
vertex(HeadWidth-62, HeadHeight-205);
bezierVertex(HeadWidth-84, HeadHeight-205, HeadWidth-95, HeadHeight-185, HeadWidth-63, HeadHeight-114);
bezierVertex(HeadWidth-63,HeadHeight-114,HeadWidth-55,HeadHeight-161,HeadWidth-63,HeadHeight-205);
endShape();

//Draw top half of head and hair
beginShape();
vertex(HeadWidth+59,HeadHeight-399);
bezierVertex(HeadWidth+123, HeadHeight-387, HeadWidth+178, HeadHeight-338, HeadWidth+191, HeadHeight-264);
bezierVertex(HeadWidth-2, HeadHeight-391, HeadWidth-69, HeadHeight-323, HeadWidth-83, HeadHeight-208);
endShape();
}