// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.3;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

import "./BMEToken.sol";

contract BlockchainME is ERC721URIStorage {
    // Init counter to increment
    uint256 public postId;
    // Init posts struct array
    mapping(uint256 => Post) public posts;
    // Init rank string (legendary, epic, rare, uncommon, common)
    string public rank;
    // Post struct
    struct Post {
        uint256 id;
        string uri;
        string rank;
        address creator;
    }
    // Init event to log post id
    event MintedPost(
        uint256 id,
        string indexed uri,
        string indexed rank,
        address indexed creator
    );

    // TODO make this constructor payable, send the BME ERC20 token as a reward for NFT creation
    constructor() ERC721("BlockchainME", "BME") {}

    // TODO verify that the creator of this contract receives the ETH
    function mintPost(string memory _uri) public payable returns (uint256) {
        // Verify the creator's address existence
        require(msg.sender != address(0), "A valid ETH address is required");
        // Verify the existence of the uri
        require(bytes(_uri).length > 0, "A URI is required");
        // Verify payment if the post is a genesis post
        if (postId <= 10000) {
            require(
                msg.value >= 0.05 ether,
                "A minimum of 0.05 ETH is required to mint a post"
            );
        }
        // Increment post id
        postId++;
        // Conditionally update rank
        if (postId <= 100) {
            rank = "legendary";
        } else if (postId <= 1000) {
            rank = "epic";
        } else if (postId <= 4000) {
            rank = "rare";
        } else if (postId <= 10000) {
            rank = "uncommon";
        } else {
            rank = "common";
        }
        // Mint post
        _mint(msg.sender, postId);
        // Set token uri
        _setTokenURI(postId, _uri);
        // Add post to array
        posts[postId] = Post(postId, _uri, rank, msg.sender);
        // Log post id
        emit MintedPost(postId, _uri, rank, msg.sender);
        return postId;
    }
}
