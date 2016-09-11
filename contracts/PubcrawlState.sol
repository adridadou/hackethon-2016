contract PubcrawlState {
	struct GovContract {
		string		termsHash;
        string      name;
        uint        nbMilestones;
        mapping(uint => Milestone) milestones;
	}
	// Create type structure for government contracts that governments can 
	// build and register with our smart contract on the blockchain 

	mapping(uint => GovContract) contracts;
	// map unique id numbers for all government contracts

	uint public numberContracts;

	address owner;
	// create counter for the number of government contracts and initially set to 0

    struct Milestone {
		uint 	contractId;
		uint 	duration;
		uint	targetBudget;
        uint    nbSources;
        mapping(uint => Source) sources;
	}
    struct Source{
        string hash;
        bool val;
        Constraint constraint;
    }
    enum Constraint {None, Budget, Timeline}
    mapping(string => Source) sourceReverseLookup;
}