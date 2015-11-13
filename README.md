# Taxeme
A component of the Resilience taxation system.

## Rules

Everyone issues a proportional tax rate that defines their personal "taxeme".

An individual can change their personal taxeme at any time to have any rate from 0% to 100%.

Anyone can have multiple taxemes at once, but only the master copy of their personal taxeme.

Additional copies of taxemes have a limited volume in units of currency (ETH).

Taxemes are ordered by their associated tax rates.

Whenever A sends X amount of currency (ETH) to B, B pays the rate defined by their lowest taxeme (% of X), and then X volume of B's lowest taxeme is passed to A.

Volume of a taxeme is passed by subtracting it from the sender's copy of the taxeme and adding it to the receiver's copy of the taxeme (creating a new copy when one does not already exist as issued by the same person at the same rate).

If B's lowest taxeme was issued by A, then instead of passing volume on to A, the volume that would be passed is deleted.
