// SPDX-License-Identifier: MIT
pragma  solidity ^0.8.18;
   
   import{SimpleStorage} from "./SimpleStorage.sol";
   contract AddFiveStorage is SimpleStorage {
       function store(uint256 _newnumber) public override {
        myFavoriteNumber = _newnumber + 5;
       }
   }

   
