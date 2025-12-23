# Hybrid Post-Quantum TLS 1.2

[`Go Back`](../README.md)

This document provides a more detailed overview of the Hybrid Post-Quantum TLS 1.2 protocol modeled in this repository, including its design goals, message flow, security properties, and the results from formal analysis using **Maude-NPA**.

For the full formal verification repository (specifications, results, and supporting files), see the main [README](./README.md).

## Protocol Overview

The modeled protocol is based on the hybrid post-quantum key exchange mechanism for TLS 1.2 described in the IETF draft [draft-campagna-tls-bike-sike-hybrid](https://datatracker.ietf.org/doc/html/draft-campagna-tls-bike-sike-hybrid).

The core idea is to **combine a classical Elliptic Curve Diffie-Hellman (ECDH) key exchange with a post-quantum Key Encapsulation Mechanism (PQ KEM)**. The two independently computed shared secrets are concatenated and fed into the TLS PRF to derive the premaster secret, which is then used to generate the master secret and session keys.

This hybrid approach ensures:
- Resistance against quantum attacks (provided by the PQ component, as quantum computers can break classical ECDH via Shor's algorithm).
- Backward compatibility and security against classical adversaries (provided by the ECDH component).

The handshake follows the standard TLS 1.2 structure but extends the key exchange messages to include both classical and post-quantum parameters.

## Key Security Properties Analyzed

The formal models specify the protocol under the Dolev-Yao intruder model, extended with the assumption that the intruder can break the classical ECDH component (simulating a quantum-capable adversary).

The following properties are verified:

1. **Secrecy of the classical shared secret**: Expected to be violated (attack found), as the quantum adversary can compute it.
2. **Secrecy of the post-quantum shared secret**: No attack found (property holds up to analyzed depths).
3. **Authentication**: No attack found (property holds up to analyzed depths).

As a consequence, the **master secret remains secret** (since it depends on both secrets, and the PQ part resists the quantum attack).

This aligns closely with the analysis in the reference paper:  
D.D. Tran, C.M. Do, S. Escobar, K. Ogata. "Hybrid post-quantum Transport Layer Security formal analysis in Maude-NPA and its parallel version." *PeerJ Computer Science* 9:e1556 (2023). https://doi.org/10.7717/peerj-cs.1556

The models in this repository imitate that work but explore alternative algebraic refinements for concatenation to achieve **finite-state verification** (bounded state space) while preserving realistic intruder capabilities (and reaching a finite search space).

## Attacks and Results in the Original Model

In the reference model (using `Gather`), the expected attack on the classical secret is found, but the state space can become infinite or too large for complete analysis.

This repository demonstrates that by using **different refinements** (VariadicSymbol), the analysis becomes finite (terminates) while still detecting the expected attack on the classical component and proving no attacks on the PQ component or authentication.

## Protocol Specifications

Four variants are provided, differing only in the algebraic theory used to model message concatenation:

| File Name | Refinement Used | Intruder Decomposition Power | Terminates? |
|-|-|-|-|
| HPQTLS-HeadTail.maude | Head/Tail | Strongest: extracts any contiguous subsequence (chunks) |  No |
| HPQTLS-Gather.maude | Gather | Equivalent to Head/Tail (Maude-native) | No |
| HPQTLS-Associativity.maude| Associativity | Weak: extracts only atomic elements, no chunks | No |
| HPQTLS-VariadicSymbol.maude| VariadicSymbol | Weak: extracts only atomic elements | Yes |

The Associativity and VariadicSymbol refinements limit the intruder's ability to obtain intermediate chunks from concatenated messages. VariadicSymbol reduces the state space dramatically while still being sufficient to reveal the intended quantum attack on the classical part and confirm post-quantum resistance.

Verification outputs for all models are available in the [`results`](../results/README.md) directory.