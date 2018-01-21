/* function: returns a list of x,y coordinate pairs from portaitData
Parameters: name = Column name of vertex, tbl = Table name
*/
FloatList getVertices(String name, Table tbl){
 FloatList v = new FloatList();
 //iterate through named column and build list of sequential x,y coordinates
 for (TableRow row : tbl.rows()){
   String f;
   f = row.getString(name);
   if (f != ""){
     float[] c = float(split(f, ',')); // parse xxx, yyy string and cast to float, then assign to float array
     v.append(c); // append float array containing x,y coordinate data to list
   }
 }
 return v; // return list of vertices for drawing
}