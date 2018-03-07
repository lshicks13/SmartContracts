	pragma solidity ^0.4.19;    
  	

  	contract BountyCoin {

    	/* Public variables of token */
    	string public name;
		string public symbol;
		uint8 public decimals;

        /* This creates an array with all balances */
        mapping (address => uint256) public balanceOf;

        /* This generates a public event on the blockchain that will notify clients */
        event Transfer(address indexed from, address indexed to, uint256 value);

        /**
         * Constructor function
         *
         * Initializes contract with initial supply tokens to the creator of the contract */
    	function BountyCoin(
    		uint256 initialSupply, 
    		string tokenName, 
    		string tokenSymbol, 
    		uint8 decimalUnits
    	) public {
        	balanceOf[msg.sender] = initialSupply;              // Give the creator all initial tokens
        	name = tokenName;                                   // Set the name for display purposes
        	symbol = tokenSymbol;                               // Set the symbol for display purposes
        	decimals = decimalUnits;                            // Amount of decimals for display purposes
    	}

    	 /* Send coins */
    	function transfer(address _from, address _to, uint256 _value) public {
        /* Check if sender has balance and for overflows */
        require(balanceOf[_from] >= _value && balanceOf[_to] + _value >= balanceOf[_to]);

        /* Saved for assertion */
        uint256 previousBalances = balanceOf[_from] + balanceOf[_to];

        /* Add and subtract new balances */
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        /* Asserts are used to use static analysis to find bugs in your code. They should never fail. */
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);

        /* Notify anyone listening that this transfer took place */
        Transfer(_from, _to, _value);
    	}

    }
