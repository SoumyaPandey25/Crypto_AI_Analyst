// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PrivacyPreferences {
    address public owner;
    mapping(address => bool) private preferences;

    event PrivacyPreferenceSet(address indexed user, bool enabled);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() {
        owner = msg.sender;
        emit OwnershipTransferred(address(0), owner);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, 'Only owner can call this');
        _;
    }

    function setPrivacyPreference(address user, bool enabled) external onlyOwner {
        preferences[user] = enabled;
        emit PrivacyPreferenceSet(user, enabled);
    }

    function getPrivacyPreference(address user) external view returns (bool) {
        return preferences[user];
    }

    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0), 'New owner is the zero address');
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
}
