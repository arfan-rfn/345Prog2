/*****************************************************
* 
*****************************************************/
void drawSegmentsFromFile(String filename) {
    try{
      String str= null;
      BufferedReader read;
      read = createReader(filename);
      
      if ((str = read.readLine()) != null) {
        pixels = Integer.parseInt(str);
      }

      while ((str = read.readLine()) != null) {
        String[] words = str.split(",");
        if (words.length>2){
          int segX1=Integer.parseInt(words[0]);
          int segX2=Integer.parseInt(words[1]);
          int segY1=Integer.parseInt(words[2]);
          
          Segment tempSeg = new Segment(segX1, segX2, segY1);
          segments.add(tempSeg);
          //HINT: Add segment to QT here
        }
      }
    }
    catch(Exception e) {

      println("error occured");
      e.printStackTrace();
    }
  }
