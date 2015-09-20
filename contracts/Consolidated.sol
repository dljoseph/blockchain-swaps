contract DataRegister {

    struct BidAsk {
   
    uint startMonth;
    uint endMonth;
    uint bid;
    uint ask;
    uint volume;
    }
    
    mapping (bytes32 => address) public usersAddress;
    mapping (address => bytes32) public usersName;
    mapping (uint => BidAsk) public bidAsks;

    function DataRegister(){
    initialize();
        
    }
    
    function initialize(){
	usersAddress["Credit Suisse"] = 0x3069dc483d0fb8a4cb6e81517602285039153a71;
	usersAddress["Barclays"] = 0x2931c7dfd38244b68ee07feeb803fa42bc14b74d;
	usersAddress["UBS"] = 0xafca52df908bcc15522c2ba3932de0ffd99258e4;
	usersAddress["Deutsche Bank"] = 0x700b07449ea27585f1d88c440e7046f2375555c2;
	usersAddress["Goldman Sachs"] = 0x43054efc9a0d6b156d1e0305325d1b1fe52eba5a;
	usersAddress["New Bank"] = 0x62202cd3c4b5d81b05a8c36394c642e641fae57e;

	address add = 0x3069dc483d0fb8a4cb6e81517602285039153a71;
	usersName[add] = "Credit Suisse";
	add = 0x2931c7dfd38244b68ee07feeb803fa42bc14b74d;
	usersName[add] = "Barclays";
	add = 0xafca52df908bcc15522c2ba3932de0ffd99258e4;
	usersName[add] = "UBS";
	add = 0x700b07449ea27585f1d88c440e7046f2375555c2;
	usersName[add] = "Deutsche Bank";
	add = 0x62202cd3c4b5d81b05a8c36394c642e641fae57e;
	usersName[add] = "Goldman Sachs";

	BidAsk temp;
	temp.bid =175;temp.ask=180; temp.startMonth = 0; temp.volume =10000000;temp.endMonth = 11;
	bidAsks[12] = temp;
	temp.bid =180;temp.ask=192; temp.startMonth = 0; temp.volume =10000000;temp.endMonth = 23;
	bidAsks[24] = temp;
	temp.bid =195;temp.ask=205; temp.startMonth = 0; temp.volume =10000000;temp.endMonth = 35;
	bidAsks[36] = temp;
	temp.bid =215;temp.ask=230; temp.startMonth = 0; temp.volume =10000000;temp.endMonth = 59;
	bidAsks[60] = temp;
	temp.bid =250;temp.ask=270; temp.startMonth = 0; temp.volume =10000000;temp.endMonth = 119;
	bidAsks[120] = temp;

    }

    function getName(address p_nameKey) constant returns(bytes32 o_name){
	return usersName[p_nameKey];
    }

    function getAddress(bytes32 p_name) constant returns(address o_nameAddress){
	return usersAddress[p_name];
    }
    
    function getAsk(uint p_month) constant returns(uint o_rate){
        return bidAsks[p_month].ask;
    }
    
}   

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