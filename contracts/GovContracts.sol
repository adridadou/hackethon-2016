contract GovContracts {

	struct GovContract {
		uint128		id;
		bytes		termsHash;
        bytes       name;
	}
	// Create type structure for government contracts that governments can 
	// build and register with our smart contract on the blockchain 

	mapping(uint128 => GovContract) contracts;
	// map unique id numbers for all government contracts

	uint32 public numberContracts;

	address owner;
	// create counter for the number of government contracts and initially set to 0

	function GovContracts () {
		owner = msg.sender;
	}

    function buildContract(bytes contractHash, bytes name) { 
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

    function getContractHash(uint128 id) constant returns (bytes) {
    	return contracts[id].termsHash;
    }

    function getContractName(uint128 id) constant returns (bytes) {
        return contracts[id].name;
    }

    struct Milestone {
		uint128 	id;
		uint128 	contractId;
		uint128 	duration;
		uint128		targetBudget;
	}

    // Create type structure for milestone submissions that can be pushed to voters

    mapping(uint128 => Milestone) milestones;
    // map unique id numbers for all submissions of milestones

    uint32 public numberMilestones;
    // create counter for the number of government contracts and initially set to 0

    function buildMilestone(uint128 govContract_id, uint128 duration, uint128 targetBudget) { 
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