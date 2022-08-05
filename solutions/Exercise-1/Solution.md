# Vulnerabilities

## reentrancy Attack 
- Safe.amount=0 the state is changed after the transfer which attracts reentrancy attack as attacker can call take() function while the safe.amount= 0 is not executed yet. Hence he/she can withdraw twice .

-Solution : change the state before transfer

## DOS issue 

- Multiple Safe structs can be pushed in the array with msg.value = 0 wei. This will make the contract run out of gas as it has a for loop which will run for all the Safes with value 0 ;

-Solution : change the array to mapping as we can store the value and update in a mapping and iteration of array will not be needed. update the amount parameter of struct incase the user wants to store . 



