pragma solidity ^0.4.1;

contract Source {
    
struct Source{
        bytes32 hash;
        int8 value;
        //constraint?
        bytes32 milestone;
    }

     mapping (bytes32 => Source) Sources;
     uint32 numSources;
     mapping(bytes32 => Sources) Milestones;
     uint32 numMilestones;
     mapping(bytes32 => Milestones) Data;
     uint32 numContracts;
     
     //Source s = Data[0][0][0]; //Data[contractId][milestoneId][sourceId]

     function checkSourceExists(bytes32 contract, bytes32 milestone, bytes32 hash) constant returns (bool){
         //ToDo
         }
         
     function addSource(bytes32 contract, bytes32 milestone, bytes32 hash, int8 value, /*, constraint? */){
         //ToDo
     }
     
     function getSource(bytes32 contract, bytes32 milestone, bytes32 hash) constant returns (Source){
         //ToDo
     }
     
     function allSourcesForMilestone(bytes32 contract, bytes32 milestone) constant returns (Source[]){
         //ToDo
     }

}