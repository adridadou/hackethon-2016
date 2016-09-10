pragma solidity ^0.4.1;

contract Source {
    
    enum Constraint {Budget, Timeline}

    struct Source{
        bytes32 hash;
        int8 val;
        Constraint constraint;
        //bytes32 milestone;
    }
    
    struct Milestone{
        mapping(uint32 => Source) sources;
        uint32 numSources;
    }

    struct PublicContract{
        mapping(uint32 => Milestone) milestones;
        //uint32 numMilestones;
    }
    
    mapping(uint32 => PublicContract) contracts;
    mapping(bytes32 => uint32) sourceReverseLookup;
    //uint32 numPublicContracts;
     
    function addSource(uint32 contractId, uint32 milestoneId, bytes32 hash, int8 val, Constraint constraint){
        //does this hash already exist?
        if(sourceReverseLookup[hash] != 0){
            uint32 sourceId = sourceReverseLookup[hash];
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
        uint32 newNumSources; 
        newNumSources = contracts[contractId].milestones[milestoneId].numSources++;
        
        contracts[contractId].milestones[milestoneId].sources[newNumSources] = Source({hash: hash, val: val, constraint: constraint});
        contracts[contractId].milestones[milestoneId].numSources = newNumSources;

        sourceReverseLookup[hash] = newNumSources;
    } 
     
    function getSourceHash(uint32 contractId, uint32 milestoneId, uint32 sourceId) constant returns (bytes32){
        return contracts[contractId].milestones[milestoneId].sources[sourceId].hash;
    }
    
    function getSourceValue(uint32 contractId, uint32 milestoneId, uint32 sourceId) constant returns (int8){
         return contracts[contractId].milestones[milestoneId].sources[sourceId].val;
     }
     
    function getSourceConstraint(uint32 contractId, uint32 milestoneId, uint32 sourceId) constant returns (Constraint){
        return contracts[contractId].milestones[milestoneId].sources[sourceId].constraint;
    }
     
    function getNumberOfSources(uint32 contractId, uint32 milestoneId, Constraint constraint) constant returns (uint){
         return contracts[contractId].milestones[milestoneId].numSources;
     }

}