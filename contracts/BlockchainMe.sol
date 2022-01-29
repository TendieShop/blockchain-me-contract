// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.3;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

import "./BMEToken.sol";

contract BlockchainME is ERC721URIStorage {
    // Init counter to increment
    uint256 public itemId = 0;
    // Init items struct array
    mapping(uint256 => Item) public items;
    // Item struct
    struct Item {
        uint256 id;
        string uri;
        address creator;
    }
    // Init event to log item id
    event CreatedItem(
        uint256 indexed id,
        string indexed uri,
        address indexed creator
    );

    // TODO make this constructor payable, send the BME ERC20 token as a reward for NFT creation
    constructor() ERC721("BlockchainME", "BME") {}

    function createItem(string memory _uri) public {
        // Verify the creator's address existence
        require(msg.sender != address(0), "A valid ETH address is required");
        // Verify the existence of the uri
        require(bytes(_uri).length > 0, "A URI is required");

        // Increment item id
        itemId++;
        // Mint item
        _mint(msg.sender, itemId);
        // Set token uri
        _setTokenURI(itemId, _uri);
        // Add item to array
        items[itemId] = Item(itemId, _uri, msg.sender);
        // Log item id
        emit CreatedItem(itemId, _uri, msg.sender);
    }
}
