/*function: creates curve sketch based on list of vertices passed in as parameter
Parameters: vertList = List of vertices for the sketch, f = true/false indicates fill or nofill,
fil = fill color, pencil = pencil color
*/
void doSketch(FloatList vertList, boolean f, color fl, color pencil){
  noFill();
  if(f){
   fill(fl); 
  }
  stroke(pencil);
  float[] vtc = vertList.array();
  // draw curves based on passed in vertices parameter
  for (int i = 0 ; i < vtc.length; i=i+2){
    print("loop" + " " + i + " "); // for debug
    try{ 
      //assign coordinates to variables
     float x1 = vtc[i] + xOffset;
     float y1 = vtc[i+1] + yOffset;
     float x2 = vtc[i+2] + xOffset;
     float y2 = vtc[i+3] + yOffset;
     float x3 = vtc[i+4] + xOffset;;
     float y3 = vtc[i+5] + yOffset;
     float x4 = vtc[i+6] + xOffset;;
     float y4 = vtc[i+7] + yOffset;
     float x5 = vtc[i+8] + xOffset;;
     float y5 = vtc[i+9] + yOffset;
     float x6 = vtc[i+10] + xOffset;;
     float y6 = vtc[i+11] + yOffset;
     // draw the curve
     beginShape();
     curveVertex(x1, y1);
     curveVertex(x2, y2);
     curveVertex(x3, y3);
     curveVertex(x4, y4);
     curveVertex(x5, y5);
     curveVertex(x6, y6);
     endShape();
    } catch(Exception ex) {
      if(ex instanceof ArrayIndexOutOfBoundsException){
       print("CATCH BLOCK i= " + i); // for debug
       // re-index i to a block of 8 for last curve 
       i = vtc.length - 12; 
       print(" reindexed i= " + i);
       // recover from bounds exception and draw last curve
       //assign coordinates to variables
       float x1 = vtc[i] + xOffset;
       float y1 = vtc[i+1] + yOffset;
       float x2 = vtc[i+2] + xOffset;
       float y2 = vtc[i+3] + yOffset;
       float x3 = vtc[i+4] + xOffset;;
       float y3 = vtc[i+5] + yOffset;
       float x4 = vtc[i+6] + xOffset;;
       float y4 = vtc[i+7] + yOffset;
       float x5 = vtc[i+8] + xOffset;;
       float y5 = vtc[i+9] + yOffset;
       float x6 = vtc[i+10] + xOffset;;
       float y6 = vtc[i+11] + yOffset;
       // draw the curve
       beginShape();
       curveVertex(x1, y1);
       curveVertex(x2, y2);
       curveVertex(x3, y3);
       curveVertex(x4, y4);
       curveVertex(x5, y5);
       curveVertex(x6, y6);
       endShape();
       print(" EXIT ON CATCH: adjusted i= " + i + " " + "arraylen= " + vtc.length); // for debug
       break;
      }
    }
  
 }
}