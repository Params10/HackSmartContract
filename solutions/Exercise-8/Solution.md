# Vulnerabilities

## reentrancy attack 

- Withdraw function changes the  coffer.slots[_slot] = 0 after the amount is transferred basic case of reentrancy.

- closeAccount only changes  coffer.nbSlots = 0 which keeps the value at slot as it is. Incase user opens the account again by calling create account ,The mapping will still have the previous value so the user can withdraw again . This way complete contract can be drained.

- Solution add the   coffer.slots[i] = 0 in the for loop of closeAccount() to the code so that the value is set to 0 as well .