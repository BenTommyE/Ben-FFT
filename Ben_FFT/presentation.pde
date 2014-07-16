void drawPresentation(float[] SamplingData, float[] XOut) {
  int TimeScalar = 2;  // Scale data to screen

  stroke(0,0,255);
  strokeWeight(2);
  beginShape();
  for(int i = 0; i<N; i++) {
    curveVertex(i, (height/3-50*SamplingData[i])); // is also the last control point
  }
  endShape();
  
  
  stroke(0,0,0);
  strokeWeight(2);
  beginShape();
  for(int i = 0; i<XOut.length/2; i = i + TimeScalar) {
    curveVertex(i*TimeScalar, (4*height/5-XOut[i] )); // is also the last control point
  }
  endShape(); 


}
