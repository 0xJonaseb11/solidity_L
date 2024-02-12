// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ProposalContract {
    
    struct Proposal {
        string description;
        uint256 approve;
        uint256 reject;
        uint256 pass;
        uint256 total_vote_to_end;
        bool current_state;
        bool is_active;
    }

    mapping(uint256 => Proposal) proposal_history;
}