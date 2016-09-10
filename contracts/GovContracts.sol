contract GovContracts {

	struct GovContract {
		uint128		id;
		bytes		termsHash;
		bool		projectDone;
		address 	government;
	}

	struct Milestone {
		uint128 	id;
		uint128 	contractId;
		uint128 	duration;
		uint128		targetBudget;
		bool		withdrawn;
	}

}

contract ContractUtility {

    function buildContract(uint128 id, bytes contractHash) { 
    	// Create a new government contract 

    	// BlockOne Modifer needed (only Government)
    	
    	var NewContract GovContract;
    	NewContract.id = id;
    	NewContract.termsHash = contractHash;
    	NewContract.government = msg.sender;
    	NewContract.projectDone = false;
    }
 
   mapping(uint128 => GovContract) contract;

   uint32 public numberContracts;
   numberContracts = 0;

    function terminateContract(uint128 id) { 
    	// Sets completion attribute to true in order to flush
    	// Modifier needed (only Government that submitted)

    	Contract.projectDone = true;
    }
    
    function registerContract(GovContract subContract) {
    	subContract
    }
}
contract MilestoneUtility {

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