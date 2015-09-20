contract SwapContract {
  uint numSwaps;

  struct Swap {
    bytes32  fixedParty;
    address fixedPayee;
    bytes32 floatingParty;
    address floatingPayee;
    uint notional;
    uint fixedRate; /*divide by 100 */
    uint floatingRateBasis; /* divide by 100*/
    bytes8 startFixDate;
    uint frequency;
    uint totalDuration;
    uint offLoadMonth;
  }
  mapping (uint => Swap) public swaps;
  DataRegister register;
  
  function SwapContract(){
	createBunchOfSwaps();
  }

  function createBunchOfSwaps(){
      uint index = 0;     

        newSwap("Credit Suisse", "Barclays",  5000000, register.getAsk(120), 100, "20151001", 6, 120, 96);
	newSwap( "Goldman Sachs","Barclays", 4000000, register.getAsk(24), 40, "20151001", 6, 24, 16);
	newSwap("Deutsche Bank", "UBS", 5000000, register.getAsk(36), 60, "20151001", 6, 36,25);
	newSwap("Deutsche Bank", "UBS", 10000000, register.getAsk(12), 60, "20151001", 3, 12,12);
	newSwap( "UBS", "Credit Suisse", 6000000, register.getAsk(60), 80, "20151001", 6, 60,50);
	
  }

  function newSwap(bytes32 _fixedParty,  bytes32 _floatingParty,  uint _notional, uint _fixedRate, uint _floatingRateBasis, bytes8 _startFixDate, uint _frequency, uint _totalDuration, uint _offLoadMonth
                        )
            returns (uint o_swapId) {
               
    o_swapId = numSwaps; // swapID is return variable
    Swap s = swaps[o_swapId];  // assigns reference
    s.fixedParty = _fixedParty;
    s.fixedPayee = register.getAddress(_fixedParty);
    s.floatingParty = _floatingParty;
    s.floatingPayee = register.getAddress(_floatingParty);
    s.notional = _notional;
    s.fixedRate = _fixedRate;
    s.floatingRateBasis = _floatingRateBasis;
    s.startFixDate = _startFixDate;
    s.frequency = _frequency;
    s.totalDuration = _totalDuration;
    s.offLoadMonth = _offLoadMonth;
    numSwaps = numSwaps + 1;
  }
  
  
}