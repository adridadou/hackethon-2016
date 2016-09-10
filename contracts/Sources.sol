pragma solidity ^0.4.1;

contract Source {
    
//hash, value (+/-), constraint, milestone
    struct Source{
        bytes32 hash;
        int8 value;
        //constraint?
        bytes32 milestone;
    }

     mapping (bytes32 => Source) Sources;
     
     function checkSourceExists(bytes32 hash){
         //ToDo
         }
         
     function addSource(bytes32 hash, int8 value, bytes32 milestone /*, constraint? */){
         //ToDo
     }
     
     function sourceValue(bytes32 hash){
         //ToDo
     }
     
     function totalSourceValueForMilestone(bytes32 milestone){
         //ToDo
     }
}