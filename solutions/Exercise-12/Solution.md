# Vulnerabilities

## Mathematical problem

- Floating point support similar to Exercise 2. Here we are dividing by 1 ether which is not necessary and rounds of the amount. 

- Solution : Remove the round of pattern by changing to uint _newBalance = _balance + msg.value. This will result in 18 decimal so 1 token = 1 wei here.

