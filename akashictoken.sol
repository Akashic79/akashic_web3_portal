// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title AkashicToken
 * @dev Hợp đồng token cho hệ sinh thái Akashic (RWA & DeFi)
 * Tuân thủ tiêu chuẩn ERC-20 với các chức năng quản trị cơ bản
 */

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract AkashicToken is ERC20, Ownable, ERC20Burnable {
    
    // Đánh dấu địa chỉ cho phép đúc token (Mint) - phục vụ nhu cầu RWA tương lai
    mapping(address => bool) public minters;

    event MinterAdded(address indexed account);
    event MinterRemoved(address indexed account);

    constructor(uint256 initialSupply) ERC20("Akashic", "AKA") Ownable(msg.sender) {
        // Khởi tạo tổng cung token khi triển khai
        _mint(msg.sender, initialSupply * 10 ** decimals());
    }

    // Chỉ chủ sở hữu hoặc các địa chỉ được cấp phép mới có thể đúc thêm
    modifier onlyMinter() {
        require(minters[msg.sender] || owner() == msg.sender, "Khong co quyen duc token");
        _;
    }

    function addMinter(address account) public onlyOwner {
        minters[account] = true;
        emit MinterAdded(account);
    }

    function removeMinter(address account) public onlyOwner {
        minters[account] = false;
        emit MinterRemoved(account);
    }

    function mint(address to, uint256 amount) public onlyMinter {
        _mint(to, amount);
    }
}