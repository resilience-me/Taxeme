# Taxeme
A component of the Resilience taxation system.

## Rules

Each individual in the system sets a proportional tax rate that defines their personal "taxeme".

An individual can change their personal taxeme at any time to any rate.

Whenever A sends currency (ETH) to B, B pays the rate defined by their lowest taxeme, and then B's lowest taxeme is passed to A.

If B's lowest taxeme is their personal taxeme, then instead of being passed to A, a copy is passed to A.

If B's lowest taxeme is a copy of A's personal taxeme, then instead of being passed to A, the copy is removed.
