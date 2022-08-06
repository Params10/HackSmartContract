# Vulnerabilities

- Time may exceed uint64 in future case.
- encoding pattern can result in collision in rare case as there are lot more combinations of name nonce and surname.
- Solution - use different encoding pattern instead of packed just the encode . set timestamp to uint.