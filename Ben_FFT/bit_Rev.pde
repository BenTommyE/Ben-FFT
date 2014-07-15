int getBitRevNr(int bitNr,int N) {
  
  // calculate the revers number in fft sequence
  
  int Ndigits = getNumberOfDigits(N);
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

int getNumberOfDigits(int _N) {
  
  // return number of digits i in binary format (inv 2^_N)
  // and check if it's 1,2,4,8,16,31 ... Binary 0001, 0010, 0100, 1000..
  // if not return 0
  
  int binaryPlaceTest = 0;
  int binaryPlace = 0;

  while(binaryPlaceTest<_N) {
    binaryPlace++;
    binaryPlaceTest = int(pow(2,binaryPlace));
  }
  
  if(binaryPlaceTest == _N) {
    return binaryPlace;
  }else{
    return 0;
  }
}
