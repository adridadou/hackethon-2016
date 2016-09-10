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
	// create counter for the number of government contracts and initially set to 0

    function buildContract(bytes contractHash) { 
    	// Create a new government contract 
    	// BlockOne Modifer needed (only Government)
    	
    	GovContract NewContract = contracts[numberContracts];
    	NewContract.id = numberContracts;
    	NewContract.termsHash = contractHash;
    	NewContract.government = msg.sender;
    	NewContract.projectDone = false;
    	numberContracts++;

    }

    function terminateContract(uint128 id) { 
    	// Sets completion attribute to true in order to flush
    	// Modifier needed (only Government that submitted)
    	contracts[id].projectDone = true;
    }

    function getNumberContracts() constant returns (uint){
    	return numberContracts;
    }

    function getContractHash(uint128 id) returns (bytes) {
    	return contracts[id].termsHash;
    }
}

contract MilestoneUtility {

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
        NewContract.targetBudget = targetBudget;
        numberMilestones++;
    }

   // function terminateContract(uint128 id) { 
        // Sets completion attribute to true in order to flush
        // Modifier needed (only Government that submitted)
     //   contracts[id].projectDone = true;
   // }

    //function getNumberContracts() constant returns (uint){
      //  return numberContracts;
    //}

    //function getContractHash(uint128 id) returns (bytes) {
        //return contracts[id].termsHash;
    //}
}