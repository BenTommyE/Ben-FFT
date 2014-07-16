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

int N = 1024;  // Sample count need to be multiple of 2. (2,4,8,16,32,64,128,256,512,1024,2048,4096,8192...)
int ND2 = N/2; // Sample count half

BenFFT CurveA = new BenFFT(N);  //Create FFT object with N samples

float[] CurveASamplingData = new float[N]; //Make an array of SamplingData[] - optional
float f,oneSample;

int PeriodeTime = 100;
int Signal = 1;


void setup() {
  size(1024, 768);
  CurveASamplingData = createSomeData(N);  //Fill CurveASamplingData[] with data - optional
  CurveA.setInDataArr(CurveASamplingData); //Prefill the data CurveASamplingData[] into FFT object - optional
}

void draw() {
  background(255);
  smooth();
  noFill();
  
  // Make some live data 
  f = float(frameCount) / 5.0 + mouseX/100;
  oneSample = 0.5 * sin(f) + 1 * sin(f/2) + 0.6 * sin(f/3) + 0.05 * sin(f/5) + 0.05 * sin(f/10);
  
  //put oneSample in to FFT objects .oneSample (CurveA.oneSample). And move the other data one place to the left
  PeriodeTime--;
  if(PeriodeTime<0) {
    Signal = Signal * (-1);
    PeriodeTime = 100;
  }
  
  CurveA.oneSample(Signal); // square wave signal
  //CurveA.oneSample(oneSample); // Some sinus signal
  
  // Do the FFT = calculate frequence spectrum 
  // and put it in .XOut[N/2] (CurveA.XOut)
  // The CurveA.XOut is an array with N/2 point
  CurveA.fft();
  
  // draw CurveA.XR - the innput data array and CurveA.XOut - the output data array
  drawPresentation(CurveA.XR,CurveA.XOut);

}

float[] createSomeData(int _N) {
  float[] createSomeData = new float[_N];
  
  // Put samplings data in to _setInData[]
  for(int k = 0; k<N; k++) {
    float f = float(k) / (100/100.0);
    float f2 = float(k) / (100/50.0);
    //XR[k] = sin(f+frameCount/50.0);
    createSomeData[k] = 0.5 * sin(f) + 1 * sin(f/2) + 0.6 * sin(f/3) + 0.05 * sin(f/5) + 0.05 * sin(f/10);
  }
  
  return createSomeData;
}


