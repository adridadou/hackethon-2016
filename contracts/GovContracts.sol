contract GovContracts {

	struct GovContract {
		uint		id;
		string		termsHash;
        string       name;
	}
	// Create type structure for government contracts that governments can 
	// build and register with our smart contract on the blockchain 

	mapping(uint => GovContract) contracts;
	// map unique id numbers for all government contracts

	uint32 public numberContracts;

	address owner;
	// create counter for the number of government contracts and initially set to 0

	function GovContracts () {
		owner = msg.sender;
	}

    function buildContract(string contractHash, string name) { 
    	// Create a new government contract 
    	// BlockOne Modifer needed (only Government)
    	
    	GovContract NewContract = contracts[numberContracts];
    	NewContract.id = numberContracts;
    	NewContract.termsHash = contractHash;
        NewContract.name = name;
    	numberContracts++;

    }

    function getNumberContracts() constant returns (uint){
    	return numberContracts;
    }

    function getContractHash(uint id) constant returns (string) {
    	return contracts[id].termsHash;
    }

    function getContractName(uint id) constant returns (string) {
        return contracts[id].name;
    }

    struct Milestone {
		uint 	id;
		uint 	contractId;
		uint 	duration;
		uint	targetBudget;
	}

    // Create type structure for milestone submissions that can be pushed to voters

    mapping(uint128 => Milestone) milestones;
    // map unique id numbers for all submissions of milestones

    uint32 public numberMilestones;
    // create counter for the number of government contracts and initially set to 0

    function buildMilestone(uint govContract_id, uint duration, uint targetBudget) { 
        // Create a new milestone 
        // BlockOne Modifer needed (only Government)
        
        Milestone NewMilestone = milestones[numberMilestones];
        NewMilestone.id = numberMilestones;
        NewMilestone.contractId = govContract_id;
        NewMilestone.duration = duration;
        NewMilestone.targetBudget = targetBudget;
        numberMilestones++;
    }
}