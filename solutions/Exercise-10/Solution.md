# Vulnerabilities

## DOS attack

- Even the contracts can be in the sides . So incase a contract side is a winner and it is not having the receive function to receive the money the funds will be in the contract and it will keep on reverting the transaction.Someone else can call the function and freeze the funds.

- solution allow only the participants to call the payRewards() function 
