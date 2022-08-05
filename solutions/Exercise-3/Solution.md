# Vulnerabilities

- Chosen is set to false after the transfer of ether. attacker can try the transaction before the chosen is set to false and get his/her lost money back.

-Solution : set chosen to false before transfer.

- once we check the transaction on the scan we can figure out if the value is set to true/false by looking at the input decoded. Guesser can use that data and guess the correct answer to win.

- Solution : change the implementation by encoding the input maybe from keccak256 similar to exercise-5.

- provided code is only for 1st issues second one can be found in exercise - 5 .

