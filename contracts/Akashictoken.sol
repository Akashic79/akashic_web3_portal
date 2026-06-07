// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AkashicToken is ERC20, ERC20Burnable, Ownable {

    mapping(address => bool) public minters;

    event MinterAdded(address indexed account);
    event MinterRemoved(address indexed account);

    constructor(
        uint256 initialSupply
    )
        ERC20("Akashic", "AKA")
        Ownable(msg.sender)
    {
        _mint(msg.sender, initialSupply * 10 ** decimals());

        minters[msg.sender] = true;
    }

    modifier onlyMinter() {
        require(
            minters[msg.sender],
            "Not authorized minter"
        );
        _;
    }

    function addMinter(
        address account
    )
        external
        onlyOwner
    {
        minters[account] = true;

        emit MinterAdded(account);
    }

    function removeMinter(
        address account
    )
        external
        onlyOwner
    {
        minters[account] = false;

        emit MinterRemoved(account);
    }

    function mint(
        address to,
        uint256 amount
    )
        external
        onlyMinter
    {
        _mint(to, amount);
    }

    function isMinter(
        address account
    )
        external
        view
        returns (bool)
    {
        return minters[account];
    }
}
