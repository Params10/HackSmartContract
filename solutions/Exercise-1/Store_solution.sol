pragma solidity >=0.7.0 <0.9.0;
contract Store {

    struct Safe {
        address owner;
        uint amount;
    }
    mapping(address => Safe) public safes;

    /// @dev Store some ETH.
    function store() public payable {
       require(msg.value>0,"please provide value greater than 0");
       if(safes[msg.sender].owner==address(0)){
        safes[msg.sender] = Safe({owner: msg.sender, amount: msg.value});
       }else
        safes[msg.sender].amount = safes[msg.sender].amount + msg.value;
    }

    /// @dev Take back all the amount stored.
    function take() public {
        require(safes[msg.sender].amount > 0, "insufficient balance");
        uint256 _amount = safes[msg.sender].amount;
        delete safes[msg.sender];   
        payable(msg.sender).transfer(_amount);

    }
}

//*** Exercice 1 *** for reference //
// Contract to store and redeem money.
// contract Store {
//     struct Safe {
//         address owner;
//         uint amount;
//     }
    
//     Safe[] public safes;
    
//     /// @dev Store some ETH.
//     function store() public payable {
//         safes.push(Safe({owner: msg.sender, amount: msg.value}));
//     }
    
//     /// @dev Take back all the amount stored.
//     function take() public {
//         for (uint i; i<safes.length; ++i) {
//             Safe storage safe = safes[i];
//             if (safe.owner==msg.sender && safe.amount!=0) {
//                 payable(msg.sender).transfer(safe.amount);
//                 safe.amount=0;
//             }
//         }
        
//     }
// }