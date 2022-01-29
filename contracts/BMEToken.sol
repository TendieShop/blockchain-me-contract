// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.3;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BMEToken is ERC20 {
    constructor() ERC20("BlockchainMe", "BME") {
        _mint(msg.sender, 100000000 * (10**18));
    }
}
