void bitReversalSorting() {
  //
  for(int i = 0; i < N; i++) {
    J = getBitRevNr(i,M);
    arrayCopy(XR,J,ReX,i,1);   // ReX[i] = TR[0];
    arrayCopy(XI,J,ImX,i,1);   // ImX[i] = TI[0];
  }
}

int getBitRevNr(int bitNr,int M) {
  
  // calculate the revers number in fft sequence
  
  int Ndigits = M;
  int revBitNr;
  int tempBit;
  int resultat = 0;
  for(int iBit = 0; iBit<Ndigits; iBit++) {         // search bit for bit from right to left
    tempBit = bitNr & int(pow(2,iBit));             // take out current bit value 
    if(tempBit>0) {                                 // if bit value = 1
      revBitNr = Ndigits - iBit - 1;                // calculate rev bit place
      resultat = resultat | int(pow(2,revBitNr));   // put current bit in new place in result (with or)
    }
  }
  return resultat;
}
