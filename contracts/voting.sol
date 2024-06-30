// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    ///////// State variables//////////

    address public owner;            // it will store owner address        
    uint256 public totalCandidates;  //it will store all candidates        

    ////////////struct/////////////
    struct Candidate {
        address candidateAddress;
        string name;
        uint256 voteCount;
    }

    ////////////mapping/////////////
    mapping(address => Candidate) public candidates; //this mapping stores the candidates
    mapping(address => bool) public voters;          //this mapping work as count voter and store all address

    /////////// Modifiers///////////
    modifier onlyOwner() {
        require(msg.sender == owner, "you are not the owner");
        _;
    }

    ///////////Constructor//////////
    constructor() {
        owner = msg.sender;   //only owner can deploy can call
    }

    /////////////////Functions///////////////////////

    // Function to add a new candidate (only owner can call this)
    function addCandidate(address _candidateAddress, string calldata _name) external onlyOwner {
        require(candidates[_candidateAddress].candidateAddress == address(0), "Candidate already exists");
        totalCandidates++;
        candidates[_candidateAddress] = Candidate(_candidateAddress, _name, 0);
    }

    // Function to cast a vote
    function vote(address _candidateAddress) external {
        require(!voters[msg.sender], "You have already voted");
        require(_candidateAddress != address(0), "Invalid candidate address");

        voters[msg.sender] = true;
        candidates[_candidateAddress].voteCount++;
    }

    // Function to get the vote count of a candidate
    function getVoteCount(address _candidateAddress) external view returns (uint256) {
        return candidates[_candidateAddress].voteCount;
    }
}
