//SPDX-License-Identifier: MIT

pragma solidity ^0.8.5;

contract VaultContract {

    struct Vault {
        address creator;
        string name;
        address[] user;
        uint256 amount;
    }

    uint256 totalVaults;
    mapping(uint256 => Vault) public vaults;
    mapping(address => uint256) public balance; 

    function _createVault(string memory _name, address[] memory _user, uint256 _amount) public returns(uint256 vaultID){
        Vault storage ourVault = vaults[totalVaults];
        ourVault.creator = msg.sender;
        ourVault.name = _name;
        ourVault.user = _user;
        ourVault.amount = _amount;
        totalVaults += 1;
        return totalVaults - 1;
    }

    function addAmount(uint256 vaultID, uint256 amount) public {
        Vault storage vault = vaults[vaultID];
        require(msg.sender == vault.creator, "You are not creator of this vault");
        vault.amount += amount;
    }

    function distribute()
}