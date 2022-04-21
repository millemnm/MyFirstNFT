pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract MyFirstNFT is ERC721URIStorage {
    //Keep track of tocken Id's
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    //pass the NFT token name
    constructor() ERC721 ("SquareNFT", "SQUARE"){
        console.log("This is my NFT contract!");
    }

    function makeYourFirstNFT() public {
        uint256 newItemId = _tokenIds.current();

        _safeMint(msg.sender, newItemId);

        _setTokenURI(newItemId, "https://i.imgur.com/T2v3X8G.jpg");
        console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);

        _tokenIds.increment();
    }
}
