struct GovContracts {
	uint128		id;
	bytes		termsHash;
	bool		projectDone
}

struct Milestones {
	uint128 	id;
	uint128 	contractId;
	uint128 	duration;
	uint128		targetBudget
}