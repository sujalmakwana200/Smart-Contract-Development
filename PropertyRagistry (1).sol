// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PropertyRegistry {
    struct Property {
        string propertyAddress;
        address owner;
        uint256 price;

    }
    uint256 public propertyCount;
    mapping(uint256 => Property) public properties;


    event propertyRegistered(uint256 indexedPropertyID, address indexedOwner, string propertyAddress, uint256 price);
    event propertyTransferred(uint256 PropertyID, address oldOwner, address newOnwer);

    modifier onlyOwner(uint256 _propertyID) {
        require(properties[_propertyID].owner == msg.sender, "only the property owner can perform this action");
        _;

    }
    modifier propertyExists(uint256 _propertyID) {
        require(_propertyID > 0 && _propertyID <= propertyCount, "Property does not exist");
        _;
    }
     
     function registerProperty(string memory _propertyAddress, uint256 _price) public {
        propertyCount++;
        properties[propertyCount] = Property({
            propertyAddress: _propertyAddress,
            owner: msg.sender,
            price: _price
        });
        emit propertyRegistered(propertyCount, msg.sender, _propertyAddress, _price);
    }

    function transferOwnership(uint256 _propertyID, address _newOwner) 
        external 
        propertyExists(_propertyID)
        onlyOwner(_propertyID) {
        
        
            require(_newOwner != address(0), "Invalid new Owner address");

            address oldOwner = properties[_propertyID].owner;
            properties[_propertyID].owner = _newOwner;

            emit propertyTransferred(_propertyID, oldOwner, _newOwner);

        }

    function getProperty(uint256 _propertyID)
        external
        view
        propertyExists(_propertyID)
        returns(string memory propertyAddress, address owner, uint256 price) 
        {
            Property memory prop = properties[_propertyID];
            return (prop.propertyAddress, prop.owner, prop.price);
        }
}

