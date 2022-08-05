# Vulnerabilities

- timeout is not called to check when resolving. 
- timeout can be called without a partyB and will go to burn address. 
- In a very rare case the PartyA can front run by continuously listening to guess() and check the inputdata encoded and figure out if it is true or false. Incase the result is not in his favour he/she can call faster and get his/her ether back.
- In a very rare case partyB can figure out the combination of random number and true/false which he/she can pass later to win the bet.uint max limit (2^256-1).

- solution for timeout Issue check if the timestamp for partyB is set or address of partyB is not 0 .