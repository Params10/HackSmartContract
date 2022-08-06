# Vulnerabilities

- Cannot withdraw complete amount in first try as the scaling factor and owners slot has fixed value . When trying to withdraw the amount deposited The scaling factor and slot value underflows and hence the transaction is reverted.

- Solution : Use different method to scale or deposit and withdraw like traditional methods.