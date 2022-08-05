# Vulnerabilities

- Rest of the things look fine in the contract but the definition has the issue. the balance value is declared int instead of uint which implies it can have negative value. Hence if the user tries to send some value even though the user has 0 balance it will send and the balance will be negative for the user and positive for the receiver. 

- Solution -> declare the balances mapping from address to uint.