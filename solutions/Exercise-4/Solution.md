# Vulnerabilities

## reentrancy attack 

- value of balances[msg.sender] is set to 0 after the transaction in the mean time it can be exploited.
- solution rearrange the sequence .