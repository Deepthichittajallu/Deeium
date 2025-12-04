// SPDX-License-Identifier: MIT
// Specifies that this source code is licensed under the MIT License

pragma solidity ^0.8.30;
// Specifies the Solidity compiler version (0.8.30 or compatible)

contract nix {
    // Developer's address
    // All tokens are initially minted to this address during deployment
    address public _dev = 0x3de0F7C0e6C2a91b762df55C057b6C9882c4aec7;

    // Token metadata variables
    string public _name;        // Token Name (human-readable)
    string public _symbol;      // Token Symbol (short ticker)
    uint8 public _decimals;     // Number of decimal places supported
    uint256 public _totalSupply; // Total number of tokens in existence

    // Mapping to store token balances of each address
    // pool[address] => token balance of that address
    mapping(address => uint256) public pool;

    // Nested mapping to store allowances
    // allowances[owner][spender] => amount spender is allowed to spend from owner
    mapping(address => mapping(address => uint256)) public allowances;

    // Constructor runs only once during deployment
    // Initializes token details and mints the entire supply to the developer
    constructor() {
        _name = "Deeium";                 // Token name
        _symbol = "DIM";                  // Token symbol
        _decimals = 18;                  // Standard ERC20 decimal format
        _totalSupply = 1000000 * 10 ** _decimals; // Total supply = 1,000,000 tokens with decimals

        _mintDev(_totalSupply);          // Mint full supply to developer
        emit Transfer(address(0), _dev, _totalSupply); // Emit minting event (from zero address)
    }

    // Internal minting function
    // Adds newly created tokens to the developer's balance
    function _mintDev(uint256 _amount) internal {
        pool[_dev] += _amount;
    }

    // Event emitted when tokens are transferred between addresses
    event Transfer(address indexed from, address indexed to, uint256 value);

    // Event emitted when an approval is made for token spending
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // Internal transfer function
    // Handles safe transfer logic between two addresses
    function _transfer(address _from, address _to, uint256 _amount) internal {
        require(_to != address(0), "Cannot transfer to zero address"); // Prevent sending to burn address
        require(pool[_from] >= _amount, "Insufficient Balance");       // Ensure sender has enough balance
        pool[_from] -= _amount;                                        // Deduct tokens from sender
        pool[_to] += _amount;                                          // Add tokens to receiver
        emit Transfer(_from, _to, _amount);                            // Emit transfer event
    }

    // Public function for direct token transfers
    // Allows users to send tokens from their own wallet
    function transfer(address _to, uint256 _amount) public returns(bool) {
        _transfer(msg.sender, _to, _amount); // Calls internal transfer logic
        return true;                         // Indicates successful transfer
    }

    // Returns the remaining token allowance a spender has from an owner
    function allowance(address owner, address spender) public view returns(uint256) {
        return allowances[owner][spender];
    }

    // Allows a third-party spender to transfer tokens on behalf of an owner
    // Uses previously approved allowance
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= allowances[_from][msg.sender], "Allowance Exceeded"); // Check allowance limit
        allowances[_from][msg.sender] -= _value;                                // Reduce allowance
        _transfer(_from, _to, _value);                                          // Execute transfer
        return true;                                                            // Indicate success
    }

    // Approves a spender to withdraw up to a fixed number of tokens
    function approve(address _spender, uint256 _amount) public returns(bool) {
        require(_spender != address(0), "Cannot approve zero address"); // Prevent invalid approvals
        allowances[msg.sender][_spender] = _amount;                     // Set allowance
        emit Approval(msg.sender, _spender, _amount);                    // Emit approval event
        return true;                                                     // Indicate success
    }

    // Getter function for token name
    function name() public view returns(string memory) { 
        return _name; 
    }

    // Getter function for token symbol
    function symbol() public view returns(string memory) { 
        return _symbol; 
    }

    // Getter function for token decimals
    function decimals() public view returns(uint8) { 
        return _decimals; 
    }

    // Getter function for total supply
    function totalSupply() public view returns (uint256) { 
        return _totalSupply; 
    }

    // Returns the balance of a given wallet address
    function balanceOf(address _toCheck) public view returns(uint256) {
        require(_toCheck != address(0), "Cannot query balance for zero address"); // Invalid address protection
        return pool[_toCheck];                                                   // Return stored balance
    }
}
