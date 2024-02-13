// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ProposalContract {

    // state variables
    uint256 public counter;
    address owner;
    address[] private votedAddresses;

    struct Proposal {
     string description;
     string title;
     uint256 approve;
     uint256 reject;
     uint256 pass;
     uint256 total_vote_to_end;
     bool current_state;
     bool is_active;
    }

    mapping(uint256 => Proposal) proposal_history;

    // constructor
    constructor () {
        owner == msg.sender;
        votedAddresses.push(msg.sender);
    }

    // modifier - sender
    modifier onlyOwner() {
        require(owner == msg.sender, "You must be the owner to call this function");
        _;
    }

    // modifier - active status
    modifier active () {
        require(proposal_history[counter].is_active == true, "The proposal is not active");
        _;
    }

    // modifier - newVoter
    modifier newVoter(address _address) {
        require(!isVoted(_address), "Voter has already voted for this proposal");
        _;
    }


    /******************************* Execute functions ***********************/


    // create proposal
    function create(string calldata _description, string memory _title, uint256 _total_vote_to_end)external {
        counter += 1;
        proposal_history[counter] = Proposal(_description, _title, 0, 0, 0, _total_vote_to_end, false, true);
    }

    // set new owner
    function setOwner(address new_owner) external onlyOwner {
        owner = new_owner;
    } 

    // start voting
    /**
    *@dev Approve -> will be represented by 1.
    * Reject -> will be represented by 2.
    * Pass -> will be represented by 0. 
    */

    function vote(uint8 choice) external {
        Proposal storage proposal = proposal_history[counter];
        uint256 total_vote = proposal.approve + proposal.reject + proposal.pass;
        votedAddresses.push(msg.sender);

         // validate with values[1, 2, 0]
        if (choice == 1) {

           proposal.approve += 1;
           proposal.current_state = calculateCurrentState();
        } 
        else if (choice == 2) {
            proposal.reject += 1;
            proposal.current_state = calculateCurrentState();
        } 
        else if (choice == 0) {
            proposal.pass += 1;
            proposal.current_state == calculateCurrentState();
        }

        // END proposal if sent
       if ((proposal.total_vote_to_end - total_vote == 1) && (choice == 1 || choice == 2 || choice == 0)) {
          proposal.is_active = false;
          votedAddresses = [owner];
       }
    }   

    // calculate current state
    function calculateCurrentState() private view returns(bool) {
        Proposal storage proposal = proposal_history[counter];

        uint256 approve = proposal.approve;
        uint256 reject = proposal.reject;
        uint256 pass = proposal.pass;

        // logic
        if (proposal.pass % 2 == 1) {
            pass += 1;
        }
        pass /= 2;

        if (approve > reject + pass) {
            return true;
        } else {
            return false;
        }
    }

    /** calculate current state - alternative logic
    * @dev If the approve is greater that reject,
    * the proposal is approved
    *
    * If the reject is greater that approve, the proposal is rejected
    *
    *If the number of approves and rejects are equal,
    *the proposal passes
    */

    function calculateCurrentState(uint256 _proposalId) private view returns(bool){
        Proposal storage proposal = proposal_history[_proposalId];

        uint256 approve = proposal.approve;
        uint256 reject = proposal.reject;
        uint256 pass = proposal.pass;


        // logic
        if (approve > reject) {
            return true;
        } else if (approve < reject) {
            return false;
        } else {
            return pass % 2 == 1;
        }
    }  

    // terminate proposal
    function terminateProposal() external view onlyOwner active {
        proposal_history[counter].is_active == false;
    }


/********************* Query functions ************************/

    // check if address voted 
    function isVoted(address _address) public view returns(bool) {
        for (uint i = 0; i < votedAddresses.length; i++) {
            if (votedAddresses[i] == _address) {
                return true;
            }
        }
        return false;
    }

    // retrieve the current proposal
    function getCurrentProposal() external view returns(Proposal memory) {
        return proposal_history[counter];
    }

    // retrieve a specifi proposal
    function getProposal(uint256 proposalId) external view returns(Proposal memory) {
        return proposal_history[proposalId];
    }
}