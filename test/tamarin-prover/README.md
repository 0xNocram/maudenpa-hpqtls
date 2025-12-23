# Tamarin Prover Test Models

[`Go Back`](../README.md)

This directory contains simple test models for **Tamarin Prover** that demonstrate the differences between the cryptographic refinements (Head/Tail, Gather, and VariadicSymbol) when modeling message concatenation and intruder decomposition.

## Dummy Protocol Description

The modeled protocol is intentionally minimal:

- Alice generates **30 fresh nonces**: `n1, n2, ..., n30`.
- She concatenates them into a single message: `n1, n2, ..., n30`.
- She sends this concatenated message to Bob over an insecure channel (controlled by the Dolev-Yao intruder).

The verification goal is to analyze whether the intruder can learn specific nonces from the intercepted message, depending on how concatenation and its destructors are modeled in each refinement.

Specifically, we check the following secrecy lemmas (from the intruder's perspective):

- `get_1st_nonce` → Can the intruder learn the **1st** nonce? (at one end)
- `get_15th_nonce` → Can the intruder learn the **15th** nonce? (roughly in the middle)
- `get_30th_nonce` → Can the intruder learn the **30th** nonce? (at the other end)

These positions are chosen to highlight potential differences in decomposition capabilities: end positions vs. a middle position in a long concatenation.

## Available Models

The following Tamarin Prover specification files are provided:

| File Name | Refinement| Expected Intruder Knowledge | Analysis Outcome |
|-|-|-|-|
| `HeadTail.spthy` | Head/Tail | Can extract **any contiguous subsequence**, including single elements at any position. Thus, learns **n1, n15, and n30**. | Attacks found on all three nonces |
| `Gather.spthy` | Gather  | Uses ProVerif built in concatenation; equivalent decomposition power to Head/Tail. Learns **n1, n15, and n30**. | Attacks found on all three nonces |
| `VariadicSymbol.spthy` | VariadicSymbol | Concatenation modeled as variadic symbol `f`. Equations allow extracting each individual argument directly. Learns **n1, n15, and n30**. | Attacks found on all three nonces |

**Key observation**: In this simple protocol with a long plain concatenation (30 elements, no encryption or other operations hiding parts of the message), **all refinements allow the intruder to learn every individual nonce**, including the targeted 1st, 15th, and 30th positions.

More detailed results can be found at [`results/Example/tamarin-prover`](../../results/Example/tamarin-prover/README.md).