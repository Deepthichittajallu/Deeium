# Deeium (DIM) ERC-20 Token --- Complete Learning Guide

This project contains a **manually implemented ERC-20 token smart
contract** named **Deeium (DIM)** written in Solidity without using
OpenZeppelin or any external libraries.\
It is created purely for **learning and academic purposes** to
understand how ERC-20 tokens work internally.

------------------------------------------------------------------------

## 🔥 Token Overview

  --------------------------------------------------------------------------------------
  Property                                Value
  --------------------------------------- ----------------------------------------------
  **Token Name**                          Deeium

  **Symbol**                              DIM

  **Decimals**                            18

  **Total Supply**                        1,000,000 × 10¹⁸ DIM

  **Initial Owner (*dev*)**               `0xDB8928Bb340eff8992032c11004ae33BFdb3fd72`

  **Token Standard**                      ERC-20 (Manual Implementation)

  **License**                             MIT
  --------------------------------------------------------------------------------------

✅ All tokens are **minted to the developer wallet during deployment**.

------------------------------------------------------------------------

## 🎯 Learning Objectives

By studying this project, you will clearly understand:

-   How ERC-20 tokens are built from scratch
-   How balances are stored on-chain using mappings
-   How approvals and allowances work internally
-   How token transfers are validated and executed
-   How blockchain events (`Transfer`, `Approval`) are emitted
-   How constructors initialize smart contract state
-   How security validations are enforced using `require()`

------------------------------------------------------------------------

## 📘 What Is ERC-20?

ERC-20 (**Ethereum Request for Comment 20**) is the **standard interface
used for fungible tokens on Ethereum**.\
It ensures that tokens are compatible with:

-   Wallets (MetaMask, TrustWallet)
-   Centralized and Decentralized Exchanges
-   DeFi Applications
-   Other Smart Contracts

### ✅ Mandatory ERC-20 Functions

-   totalSupply()
-   balanceOf(address)
-   transfer(address,uint256)
-   transferFrom(address,address,uint256)
-   approve(address,uint256)
-   allowance(address,address)

### ✅ Optional Metadata

-   name()
-   symbol()
-   decimals()

### ✅ Required Events

-   Transfer
-   Approval

------------------------------------------------------------------------

## 🧩 Core Contract Components

-   Developer wallet initialization
-   Balance mapping
-   Allowance mapping
-   Constructor minting
-   Secure transfers
-   Approval system
-   Third-party transfers
-   Public getter methods

------------------------------------------------------------------------

## 🔐 Security Features Implemented

-   Prevents transfers to zero address
-   Prevents approval to zero address
-   Balance verification before transfer
-   Enforces allowance limits
-   Solidity 0.8+ overflow protection
-   No external calls → No re-entrancy risk

------------------------------------------------------------------------

## 🚀 Deployment Steps (Remix IDE)

1.  Open https://remix.ethereum.org
2.  Create file dim.sol
3.  Paste the contract
4.  Compile with version 0.8.30
5.  Deploy using Remix VM or MetaMask

------------------------------------------------------------------------

## 🧪 Learning Experiments

-   Token transfer
-   Allowance approval
-   transferFrom usage
-   Failing transactions
-   Event tracking

------------------------------------------------------------------------

## ⚠️ Limitations

-   No burn feature
-   No ownership control
-   No pausability
-   No upgradeability

------------------------------------------------------------------------

## ✅ Summary

This project fully demonstrates ERC-20 token mechanics with Solidity
only.

------------------------------------------------------------------------

## 👨‍💻 Author

Created as a learning project for mastering ERC-20 internals.
