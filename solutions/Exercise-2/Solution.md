## Vulnerabilities

# Floating point issues

- User cannot buy above 2 items in this case . 

- Scenario after buying 2 objects -> 1) price() called which returns 333333333333333333 in wei. 
                                     2) buy() with msg.value = 333333333333333333 . Here if we check 333333333333333333*3 will not be equal to 1 ether hence require will fail eventhough the price is returned by function. 

Solution - > change the require statement to   require(msg.value == price());
