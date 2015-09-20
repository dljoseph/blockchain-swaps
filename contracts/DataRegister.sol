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