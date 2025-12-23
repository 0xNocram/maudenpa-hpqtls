# Maude-NPA Test Models

[`Go Back`](../README.md)

This directory contains simple test models for **Maude-NPA** that demonstrate the differences between the four cryptographic refinements (Head/Tail, Gather, Associativity, and VariadicSymbol) when modeling message concatenation and intruder decomposition.

## Dummy Protocol Description

The modeled protocol is intentionally minimal:

- Alice generates **9 fresh nonces**: `n1, n2, n3, n4, n5, n6, n7, n8, n9`.
- She concatenates them into a single message: `n1 ; n2 ; n3 ; n4 ; n5 ; n6 ; n7 ; n8 ; n9`.
- She sends this concatenated message to Bob over an insecure channel (controlled by the Dolev-Yao intruder).

The verification goal is to analyze whether the intruder can learn specific nonces from the intercepted message, depending on the algebraic properties of the concatenation operator in each refinement.

Specifically, we check reachability of the following **attack states** (from the intruder's perspective):

- `n1 in IK` → Can the intruder learn the **1st** nonce?
- `n5 in IK` → Can the intruder learn the **5th** nonce?
- `n9 in IK` → Can the intruder learn the **9th** nonce?

These positions are chosen to distinguish the decomposition capabilities: the 1st and 9th are at the ends, while the 5th is in the middle.

## Available Models

The following Maude-NPA specification files are provided:

| File Name | Refinement| Expected Intruder Knowledge | Analysis Outcome |
|-|-|-|-|
| `HeadTail.maude` | Head/Tail | Can extract **any contiguous subsequence**, including single elements at any position. Thus, learns **n1, n5, and n9**. | Attacks found on all three nonces |
| `Gather.maude` | Gather  | Uses Maude's `gather(e E)` axiom; equivalent decomposition power to Head/Tail. Learns **n1, n5, and n9**. | Attacks found on all three nonces |
| `Associativity.maude` | Associativity | Only associativity of `;`. Intruder can extract **only individual atomic elements** (all 9 nonces) via repeated deconstruction. Still learns **n1, n5, and n9**. | Attacks found on all three nonces |
| `VariadicSymbol.maude` | VariadicSymbol | Concatenation modeled as variadic symbol `f`. Equations allow extracting each individual argument directly. Learns **n1, n5, and n9**. | Attacks found on all three nonces |

**Key observation**: In this simple protocol with only concatenation (no encryption or other operations hiding parts of the message), **all four refinements allow the intruder to learn every individual nonce**, including the targeted 1st, 5th, and 9th positions.

More detailed results can be found at [`results/Example/maude-npa`](../../results/Example/maude-npa/README.md).