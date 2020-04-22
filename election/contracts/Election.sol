pragma solidity ^0.5.16;

contract Election {

	constructor() public {
		addCandidate("Bernie Sanders");
		addCandidate("Joe Biden");
	}
	// Store accounts that voted
	mapping(address => bool) public voters;

	// Model a Candidate
	struct Candidate {
		uint id;
		string name;
		uint voteCount;
	}

	// Read/write candidates
	mapping(uint => Candidate) public candidates;

	// Store candidates count
	uint public candidatesCount;

	function addCandidate (string memory _name) private {
		candidatesCount ++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}

	function vote(uint _candidateId) public {
		// require that they haven't voted before
		require(!voters[msg.sender]);

		// require a valid candidate
		require(_candidateId > 0 && _candidateId <= candidatesCount);

		// record that voter has recorded
		voters[msg.sender] = true;
		
		// update candidate vote count
		candidates[_candidateId].voteCount ++;
	}

}

