pragma solidity 0.4.11;

contract MyToken {
    event Transfer(address indexed from, address indexed to, uint256 value);
    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;
    /* Initializes contract with initial supply tokens to the creator of the contract */
    function MyToken(uint256 _supply, string _name, uint8 decimalUnits, string tokenSymbol) {
        balanceOf[msg.sender] = _supply;           
        name = _name;                                   
        symbol = tokenSymbol;                               // Set the symbol for display purposes
        decimals = decimalUnits;                            // Amount of decimals for display purposes
    }
    /* Send coins */
    function transfer(address _to, uint256 _value) {
        /* Notify anyone listening that this transfer took place */
        Transfer(msg.sender, _to, _value);
        /* Check if sender has balance and for overflows */
        if (balanceOf[msg.sender] < _value || balanceOf[_to] + _value < balanceOf[_to])
            throw;
    
        /* Add and subtract new balances */
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
    }

}