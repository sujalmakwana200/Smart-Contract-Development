// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "remix_tests.sol";
import "./PropertyRagistry.sol";

contract PropertyRegistryTest {
    PropertyRegistry registry;
    address owner1 = address(0x1);
    address owner2 = address(0x2);

    function beforeAll() public {
        registry = new PropertyRegistry();
    }

    function testRegisterProperty() public {
        registry.registerProperty("123 Mumbai St", 5000);
        
        (string memory addr, address owner, uint256 price) = registry.getProperty(1);
        Assert.equal(addr, "123 Mumbai St", "Address should match");
        Assert.equal(owner, address(this), "Owner should be contract runner");
        Assert.equal(price, 5000, "Price should match");
    }

    function testTransferOwnership() public {
        registry.registerProperty("456 Delhi Ave", 8000);
        registry.transferOwnership(2, owner2);
        
        (, address newOwner, ) = registry.getProperty(2);
        Assert.equal(newOwner, owner2, "New owner should match");
    }
}
