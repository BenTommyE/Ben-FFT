void fft() {
  int LE,LE2;
  float UR,UI,SR,SI,TR,TI;
 for(int L = 1; L<=M; L++) {
   LE = int(pow(2,L));
   LE2 = LE/2;
   UR = 1.0;
   UI = 0;
   SR = cos(PI/LE2);
   SI = -sin(PI/LE2);
   
   for(int J = 1; J<LE2; J++) {
     int JM1 = J-1;
     for(int i = JM1; i<=NM1; i = i + LE) {
       int IP = i + LE2;
       TR = ReX[IP] * UR - ImX[IP]*UI;
       TI = ReX[IP] * UI + ImX[IP] * UR;
       ReX[IP] = ReX[i] - TR;
       ImX[IP] = ImX[i] - TI;
       ReX[i] = ReX[i] + TR;
       ImX[i] = ImX[i] + TI;
     }
     TR = UR;
     UR = TR*SR - UI*SI;
     UI = TR*SI + UI*SR;
   }
 } 
}
