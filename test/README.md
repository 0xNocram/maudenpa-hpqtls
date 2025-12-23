# Test Models: Basic Cryptographic Refinements

[`Go Back`](../README.md)

This `test/` directory contains simple example models demonstrating the four different **cryptographic refinements** for modeling message concatenation and intruder decomposition capabilities.

The purpose of these tests is to illustrate the differences between the refinements (Head/Tail, Gather, Associativity, and VariadicSymbol) in a minimal setting: a dummy protocol where Alice sends a sequence of nonces concatenated together to Bob.

The protocol is intentionally simple:
- Alice generates several fresh nonces.
- She concatenates them.
- She sends the concatenated message to Bob.
- The tools analyze whether the intruder can extract the first, middle and last nonce.



The test models are organized into three subdirectories, one for each verification tool used:

| Folder | Tool | Description |
|-|-|-|
| [`maude-npa/`](./maude-npa/README.md) | Maude-NPA | Contains Maude specifications for all four refinements (Head/Tail, Gather, Associativity, VariadicSymbol). |
| [`tamarin-prover/`](./tamarin-prover/README.md) | Tamarin Prover | Tamarin models corresponding to Head/Tail, Gather and VariadicSymbol. Note that Tamarin does not natively support Maude's `gather` axiom, so "Gather" files here model Tamarin concatenation. |
| [`proverif/`](./proverif/README.md) | ProVerif| ProVerif models corresponding to Head/Tail, Gather and VariadicSymbol. Note that ProVerif does not natively support Maude's `gather` axiom, so "Gather" files here model ProVerif concatenation. |

For detailed information about the models in each tool, including file naming conventions, how the refinements are implemented, expected verification results, and output logs, please refer to the individual `README.md` files inside each subdirectory.

These basic examples serve as a sanity check and tutorial for understanding the impact of the different concatenation refinements before applying them to the full Hybrid Post-Quantum TLS 1.2 protocol in [`src/`](./src/README.md).