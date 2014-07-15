/**
  * Ben-FFT was written by: Ben-Tommy Eriksen ben@nornet.no
  * 
  * I want to develop a fast Fourier transform FFT for processing from scratch.
  * A fast Fourier transform (FFT) is an algorithm to compute the discrete Fourier 
  * transform (DFT) and it's inverse. http://en.wikipedia.org/wiki/Fast_Fourier_transform
  *
  * Much of the theory is obtained from: The Scientist and Engineer's Guide to Digital 
  * Signal Processing By Steven W. Smith, Ph.D. http://www.dspguide.com
  */

int N = 1024; // Sample count 

float[] XR = new float[N]; // Input Time domain - sample data 
float[] XI = new float[N]; // Output frequency domain data

float[] ReX = new float[N];
float[] ImX = new float[N];
float[] TR = new float[1];
float[] TI = new float[1];


int NM1 = N - 1;
int NM2 = N - 2;
int ND2 = N / 2;
int M = round(log(N)/log(2));
int J = ND2;

void setup() {
  size(1024, 768);
}

void draw() {
  background(255);
  smooth();
  noFill();

  setInData();
  bitReversalSorting(); 
  fft();
  
  drawArrGraph();
  
}

void setInData() {
  for(int k = 0; k<N; k++) {
    float f = float(k) / (mouseX/100.0);
    float f2 = float(k) / (mouseX/50.0);
    XR[k] = sin(f);
    XI[k] = 0;
  }
}

void drawArrGraph() {
  stroke(0,0,0);
  beginShape();
  for(int i = 0; i<ND2; i = i + 2) {
    curveVertex(i*2, (height/2-abs(ReX[i]) - abs(ImX[i]) )); // is also the last control point
  }
  endShape();
  
  stroke(255,0,0);
  beginShape();
  for(int i = 0; i<ND2; i = i + 2) {
    curveVertex(i*2, (2*height/3-ReX[i])); // is also the last control point
  }
  endShape();
  
  stroke(0,255,0);
  beginShape();
  for(int i = 0; i<ND2; i = i + 2) {
    curveVertex(i*2, (2*height/3-ImX[i])); // is also the last control point
  }
  endShape(); 
  
  stroke(0,0,255);
  beginShape();
  for(int i = 0; i<N; i++) {
    curveVertex(i*2, (height/3-50*XR[i])); // is also the last control point
  }
  endShape(); 
}
