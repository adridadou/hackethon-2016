contract GovContracts {

	struct GovContract {
		uint128		id;
		bytes		termsHash;
		bool		projectDone;
		address 	government;
	}
	// Create type structure for government contracts that governments can 
	// build and register with our smart contract on the blockchain 

	mapping(uint128 => GovContract) contracts;
	// map unique id numbers for all government contracts

	uint32 public numberContracts;
	numberContracts = 0;
	// create counter for the number of government contracts and initially set to 0

    function buildContract(uint128 id, bytes contractHash) { 
    	// Create a new government contract 
    	// BlockOne Modifer needed (only Government)
    	
    	var NewContract GovContract;
    	NewContract.id = id;
    	NewContract.termsHash = contractHash;
    	NewContract.government = msg.sender;
    	NewContract.projectDone = false;

    }

    function terminateContract(uint128 id) { 
    	// Sets completion attribute to true in order to flush
    	// Modifier needed (only Government that submitted)
    	contracts[id].projectDone = true;
    }
    
    function registerContract(GovContract subContract) {
    	subContract
    }

    function getNumberContracts() {

    }

    function getContractHash(uint128 id) {
    	var returnHash;
    	returnHash = contracts[id].termsHash;
    	return returnHash;
    }
}

contract MilestoneUtility {


	struct Milestone {
		uint128 	id;
		uint128 	contractId;
		uint128 	duration;
		uint128		targetBudget;
		bool		withdrawn;
	}

	function buildMilestone() {
		var NewMilestone Milestone;
    	Milestone.id = id;
    	Milestone.contractId = ;
    	NewContract.duration = ;
    	NewContract.targetBudget = ;
    	NewContract.withdrawn = false;
    }

    function withdrawMilestone() { // Modifier needed (only Government that submitted)
        New = true;
    }
    
    function registerContract(GovContract subContract) {
    	
	}
}



}


}