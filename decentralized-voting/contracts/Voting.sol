// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Voting {
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    
    mapping(uint => Candidate) public candidates;
    mapping(address => bool) public voters;
    uint public candidatesCount;
    
    event votedEvent(uint indexed _candidateId);
    event candidateAdded(uint indexed _candidateId, string _name);
    
    constructor() {
        addCandidate("Alice");
        addCandidate("Bob");
    }
    
    function addCandidate(string memory _name) public {
        require(bytes(_name).length > 0, "Candidate name must not be empty.");
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
        emit candidateAdded(candidatesCount, _name);
    }
    
    function vote(uint _candidateId) public {
        require(!voters[msg.sender], "Already voted.");
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate.");
        voters[msg.sender] = true;
        candidates[_candidateId].voteCount++;
        emit votedEvent(_candidateId);
    }
}