contract Sources {
    
    enum Constraint {Budget, Timeline}

    struct Source{
        string hash;
        bool val;
        Constraint constraint;
        //bytes32 milestone;
    }
    
    struct Milestone{
        mapping(uint => Source) sources;
        uint numSources;
    }

    struct PublicContract{
        mapping(uint => Milestone) milestones;
        //uint32 numMilestones;
    }
    
    mapping(uint => PublicContract) contracts;
    mapping(string => uint) sourceReverseLookup;
    //uint32 numPublicContracts;
     
    function addSource(uint contractId, uint milestoneId, string hash, bool val, Constraint constraint){
        //does this hash already exist?
        if(sourceReverseLookup[hash] != 0){
            uint sourceId = sourceReverseLookup[hash];
            Source s = contracts[contractId].milestones[milestoneId].sources[sourceId];
            if(s.val == val && s.constraint == constraint){
                // we already have this exact source in memory, so don't do anything
                return;
            }
            else{
                //hash exists but with different val or constraint
                //for now throw; better logic could be added later
                throw;
            }
        }
        //source does not exist yet, therefore create new source
        uint newNumSources; 
        newNumSources = contracts[contractId].milestones[milestoneId].numSources++;
        
        contracts[contractId].milestones[milestoneId].sources[newNumSources] = Source({hash: hash, val: val, constraint: constraint});
        contracts[contractId].milestones[milestoneId].numSources = newNumSources;

        sourceReverseLookup[hash] = newNumSources;
    } 
     
    function getSourceHash(uint contractId, uint milestoneId, uint sourceId) constant returns (string){
        return contracts[contractId].milestones[milestoneId].sources[sourceId].hash;
    }
    
    function getSourceValue(uint contractId, uint milestoneId, uint sourceId) constant returns (bool){
         return contracts[contractId].milestones[milestoneId].sources[sourceId].val;
     }
     
    function getSourceConstraint(uint contractId, uint milestoneId, uint sourceId) constant returns (Constraint){
        return contracts[contractId].milestones[milestoneId].sources[sourceId].constraint;
    }
     
    function getNumberOfSources(uint contractId, uint milestoneId, Constraint constraint) constant returns (uint){
         return contracts[contractId].milestones[milestoneId].numSources;
     }

}