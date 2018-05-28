pragma solidity ^0.4.16;

// @author - Shreyas Aserkar
//
//Creative Component - A Study on Crypto identity
//
//Documents that cam be used for the below functions
//identity  -like passport or driver's license etc.
//Age - Birth certificate, U.S. passport etc.
//U.S. citizenship - U.S. passport,Birth certificate
//immigration status: I-94 , I-766

contract cryptoIdentity {

	struct personInfo {
		
		string name;
		uint age;
		string citizenship;
		string immigration;
		address id;
		
	}

	mapping(uint => personInfo) public peopleData;

	function cryptoIdentity() public {
		
	}

    function addPeople(string _name, uint _age, uint _publicPass) public  {
		peopleData[_publicPass] = personInfo({
			 			id: msg.sender,
			 			name: _name,
			 			age: _age,
			 			citizenship: "none",
			 			immigration: ""
			 		});
    }

    function addAgeDocuements(uint _publicPass, uint _age) public {
    	peopleData[_publicPass].age = _age;
    }

    function addCitizenshipDocuments(uint _publicPass, string _citizenship) public  {
		peopleData[_publicPass].citizenship = _citizenship;
    }

    function addImmigrationDocuments(uint _publicPass, string _immigration) public {
		peopleData[_publicPass].immigration = _immigration;
    }

    function changePublicPass(uint _newPublicPass, uint _oldPublicPass) public {
    	if(msg.sender != peopleData[_oldPublicPass].id) {
    		revert();
    	}
    	peopleData[_newPublicPass] = peopleData[_oldPublicPass];
    	delete peopleData[_oldPublicPass];
    }

    function Fee(uint _publicPass) public {
    	peopleData[_publicPass].immigration = "";
    }
	
}