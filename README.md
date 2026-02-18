# Smart-Contract-Development
it is the work i did to learn about blockchain and smart contract world i even meded some project which are here
# Solidity Storage System 📦

A collection of smart contracts demonstrating core Solidity patterns, including state management, inheritance, and the Factory Design Pattern. This project serves as a foundational architecture for understanding how data is stored and managed on the Ethereum Virtual Machine (EVM).

## 📂 Contract Modules

### 1. `SimpleStorage.sol` (The Base)
The core logic layer.
- **Functionality:** Stores and retrieves a single integer (`favoriteNumber`) and maps people to their favorite numbers.
- **Key Concepts:** State variables, `structs`, `mappings`, and the `virtual` keyword for future extensibility.

### 2. `AddFiveStorage.sol` (The Extension)
Demonstrates **Object-Oriented Programming (OOP)** in Solidity.
- **Functionality:** Inherits from `SimpleStorage` but overrides the `store` function to automatically add 5 to any number being saved.
- **Key Concepts:** Inheritance (`is`), Function Overriding (`override`), and Polymorphism.

### 3. `StorageFactory.sol` (The Manager)
Implements the **Factory Design Pattern**.
- **Functionality:** Acts as a manager contract that can deploy multiple instances of `SimpleStorage` dynamically. It maintains a registry (array) of all deployed contracts and can interact with them via cross-contract calls.
- **Key Concepts:** Composability, `new` keyword for deployment, Array management, and ABI interaction.

## 🛠 Tech Stack
- **Language:** Solidity ^0.8.18
- **Pattern:** Factory & Inheritance
- **Network:** Compatible with Ethereum Mainnet, Sepolia Testnet, or Local Anvil Chains.

## 🚀 Key Learnings
This project highlights the transition from simple scripting to building modular systems:
1. **Data Structures:** Using Structs and Arrays to organize complex data.
2. **Inter-Contract Communication:** How one contract (`StorageFactory`) controls another (`SimpleStorage`).
3. **Gas Optimization:** Understanding how storage variables impact execution cost.

---
*Built by Sujal Makwana | IIIT Vadodara*
