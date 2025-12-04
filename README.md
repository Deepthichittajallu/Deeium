# Deeium (DIM) ERC-20 Token

Deeium (DIM) is a fully functional ERC-20 token deployed on an
Ethereum-compatible blockchain. This project demonstrates how ERC-20
standards work internally by manually implementing all required
functions without importing external libraries.

------------------------------------------------------------------------

## 🔥 Token Details

  Property             Value
  -------------------- --------------------------------------------
  **Name**             Deeium
  **Symbol**           DIM
  **Decimals**         18
  **Total Supply**     1,000,000 × 10¹⁸
  **Initial Holder**   0xDB8928Bb340eff8992032c11004ae33BFdb3fd72
  **License**          MIT

The entire supply is minted to the developer address during contract
deployment.

------------------------------------------------------------------------

## 📘 What is ERC-20?

ERC-20 is a **token standard** used on the Ethereum blockchain. It
defines a **blueprint** that ensures all tokens interact properly with:

-   Wallets (MetaMask, TrustWallet, etc.)
-   Exchanges
-   Smart contracts
-   DApps

### Mandatory ERC-20 Functions

-   totalSupply()
-   balanceOf(address)
-   transfer(address,uint256)
-   approve(address,uint256)
-   allowance(address,address)
-   transferFrom(address,address,uint256)

### Optional Functions (Metadata)

-   name()
-   symbol()
-   decimals()

### Events

-   Transfer
-   Approval

------------------------------------------------------------------------

## 🧩 Features Implemented in This Contract

-   Fully functional ERC-20 token logic
-   Manual implementation without OpenZeppelin
-   Balance tracking using mapping(address =\> uint256)
-   Allowance tracking using mapping(address =\> mapping(address =\>
    uint256))
-   transfer, approve, transferFrom implemented with validation
-   Prevents transferring to zero address
-   Prevents approving zero address
-   Emits ERC-20 compliant events
-   Full metadata support

------------------------------------------------------------------------

## 📦 Contract File

Stored in dim.sol

------------------------------------------------------------------------

## 🚀 Deployment Instructions (Remix IDE)

1.  Visit https://remix.ethereum.org
2.  Create file dim.sol
3.  Paste the contract code
4.  Select compiler version 0.8.30
5.  Compile the contract
6.  Go to Deploy & Run Transactions
7.  Choose environment:
    -   Remix VM (for testing)
    -   Injected Provider (MetaMask) for real networks
8.  Click Deploy

After deployment: - The entire token supply is minted to the developer
address. - You can interact with the token from the deployed contracts
panel.

------------------------------------------------------------------------

## 🛠 Usage Examples

### 1️⃣ Check Balance

balanceOf(address)

### 2️⃣ Transfer Tokens

transfer(address, amount)

### 3️⃣ Approve Spender

approve(address, amount)

### 4️⃣ Check Allowance

allowance(owner, spender)

### 5️⃣ Transfer Using Allowance

transferFrom(owner, receiver, amount)

------------------------------------------------------------------------

## 🔐 Security Features

-   Zero address validation for transfers and approvals
-   Balance verification before transfers
-   Allowance verification before transferFrom
-   Solidity 0.8+ overflow protection
-   No external contract calls

------------------------------------------------------------------------

## ⚠️ Disclaimer

This contract is intended for **educational purposes only**. Do not use
this implementation in production without proper security audit.

------------------------------------------------------------------------

## 👨‍💻 Author

Created as a learning project for understanding ERC-20 token
implementation in Solidity.
