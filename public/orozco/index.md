---
title: "Orozco blindsove method"
subtitle: "'intuitive' method for blindfolded speedcubing"
author: "JorisL"
author-url: 'https://blog.jorisl.nl'
date: "January '24"
---

# Introduction

...

Assumed is already some background knowledge with:

* Blindsolving (for example using the OP or M2 methods)
* The [Speffz lettering scheme](https://www.speedsolving.com/wiki/index.php/Speffz)
* [Rubik's cube notation](https://ruwix.com/the-rubiks-cube/notation/)
* Commutators & Conjugates

# Notation

* A commutator is in the form `A B A' B'`, where `A` and `B` are sets of moves and where `A'` and `B'` are their inverses. `A B A' B'` in shortened notation is written as `[A, B]`.
* A conjugate is in the form `C D C'`, where `C` and `D` are sets of moves, and where `C'` is the inverse of `C`. `C D C'` in shortened notation is written as `[C: D]`.
  * Note: `C` in this context is often a set-up move for commutator `D`.
* A commutator `[A, B]` with set-up move `C` can be written as `[C: [A, B]]`

Inverting rules:

* the inverse of `[A, B]` is `[B, A]`
* the inverse of `[C: D]` is `[C: D'`]
* the inverse of `[C: [A, B]]` is `[C: [B, A]]`

# Method overview

## Commutators & Conjugates

## Speffz lettering scheme

# Algorithms

These are the algorithms I generally use. Note that these are not the most
optimal algoritms in every case, but for me these are easiest to remember.

For both corners and edges, the C sticker is the buffer location and D sticker
the helper location.

## Corners

The corners are split up into 4 groups with similar algorithms:

* D-layer, but not on D-face
* D-face
* UL pieces
* UBR piece (helper)

### D-layer, but not on D-face

In general all can be solved using a pure commutator, except for K and T. These
require a set-up move to first move them out of the R layer.

| **Letter** | **Algorithm (odd)**  | **Links** |
|------------|----------------------|-----------|
| G          | `[U, R' D R]`        | [odd](https://cubedb.net/?puzzle=3&alg=%5BU%2C_R-_D_R%5D&type=alg), [even](https://cubedb.net/?puzzle=3&alg=%5BR-_D_R%2C_U%5D&type=alg) |
| K          | `[D': [U, R' D R]]`  | [odd](https://cubedb.net/?puzzle=3&alg=%5BD-%3A_%5BU%2C_R-_D_R%5D%5D&type=alg), [even](https://cubedb.net/?puzzle=3&alg=%5BD-%3A_%5BR-_D_R%2C_U%5D%5D&type=alg) |
| O          | `[R D R', U']`       | [odd](), [even]() |
| S          | `[U, R' D2 R]`       | [odd](), [even]() |
| H          | `[R D' R', U']`      | [odd](), [even]() |
| L          | `[R D2 R', U']`      | [odd](), [even]() |
| P          | `[U, R' D' R]`       | [odd](), [even]() |
| T          | `[D: [R D' R', U']]` | [odd](), [even]() |

### D-face

All the D-face targets use the "R2 D' R2 D R2" algorithm to swith the C and V
stickers. Other pieces (U, W, X) first do a D-face set-up to allign the piece in
the DFR position. If the piece is odd (first in a pair), the V-piece first has
to be exchanged with the helper B. Therefore the odd pieces will be in form " U,
interchange, U', interchange' ". If the piece is even it has to be switched
first with the buffer C, therefore even pieces will be in form " interchange, U,
interchange' U' "

Note that the interchange algorim is the same when inverted.

| **Letter** | **Algorithm (odd)**         | **Links** |
|------------|-----------------------------|-----------|
| V          | `[U, R2 D' R2' D R2]`       | [odd](https://cubedb.net/?puzzle=3&alg=%5BU%2C_R2_D-_R2-_D_R2%5D&type=alg), [even](https://cubedb.net/?puzzle=3&alg=%5BR2_D-_R2-_D_R2%2C_U%5D&type=alg) |
| U          | `[D: [U, R2 D' R2' D R2]]`  | [odd](), [even]() |
| W          | `[D': [U, R2 D' R2' D R2]]` | [odd](), [even]() |
| X          | `[D2: [U, R2 D' R2' D R2]]` | [odd](), [even]() |

### UL pieces

For these pieces an L, L', or L2 set-up move is used, after which it is solved
the same as a the D-layer piece.

| **Letter** | **Algorithm (odd)**   | **Links** |
|------------|-----------------------|-----------|
| A          | `[L': [U, R' D2 R]]`  | [odd](), [even]() |
| D          | `[L: [R D2 R', U']]`  | [odd](), [even]() |
| E          | `[L': [R D' R', U']]` | [odd](), [even]() |
| F          | `[L: [U, R' D R]]`    | [odd](), [even]() |
| I          | `[L2: [U, R' D2 R]]`  | [odd](), [even]() |
| R          | `[L2: [R D2 R', U']]` | [odd](), [even]() |

### UBR piece (helper)

If the helper sticker (B) is encountered, no algorimn needs to be performed. If
another sticker on that piece (N or Q) is encountered, the pieces in the buffer
and helper locations must be rotated.

Note: the N and Q algorithms are each others inverses. E.g. the N odd algoritm
and Q even algorithm are the same, and vice-versa.

| **Letter** | **Algorithm (odd)**      | **Links** |
|------------|--------------------------|-----------|
| B          | _no algoritm_            | _N/A_     |
| N          | [`R' D' R D R' D' R, U]` | [odd](), [even]() |
| Q          | `[U, R' D' R D R' D' R]` | [odd](), [even]() |

## Edges

The edges are split up into 5 groups with similar algorithms:

* D-layer, but not on D-face
* D-face
* E-layer
* UB, UL pieces
* UR piece (helper)

### D-layer, but not on D-face

These algoritms first put the piece in either the LD or RD position (G or O
sticker), and then use a `M D M'` or `M D' M'` sequence to place that piece in
the C position.

| **Letter** | **Algorithm (odd)** | **Links** |
|------------|---------------------|-----------|
| G          | `[U, M D M']`       | [odd](), [even]() |
| K          | `[D': [U, M D M']]` | [odd](), [even]() |
| O          | `[U, M D' M']`      | [odd](), [even]() |
| S          | `[D: [U, M D M']]`  | [odd](), [even]() |

### D-face

These algorithms first put the piece in the DF position (U sticker), and then
use a `M D2 M'` sequence to place that piece in the C position.

| **Letter** | **Algorithm (odd)**  | **Links** |
|------------|----------------------|-----------|
| U          | `[U, M D2 M']`       | [odd](), [even]() |
| V          | `[D': [U, M D2 M']]` | [odd](), [even]() |
| W          | `[D2: [U, M D2 M']]` | [odd](), [even]() |
| X          | `[D: [U, M D2 M']]`  | [odd](), [even]() |

### E-layer

These algoritms use a `R E R'` sequence (or any variation thereof) to place the
piece in the B position. If requred a set-up move is first performed to remove
the piece from the R layer.

| **Letter** | **Algorithm (odd)**   | **Links** |
|------------|-----------------------|-----------|
| R          | `[R' E2 R, U']`       | [odd](), [even]() |
| H          | `[R E' R', U']`       | [odd](), [even]() |
| F          | `[R' E R, U']`        | [odd](), [even]() |
| L          | `[R E2 R', U']`       | [odd](), [even]() |
| J          | `[E': [R' E R, U']`   | [odd](), [even]() |
| P          | `[E': [R E2 R', U']]` | [odd](), [even]() |
| N          | `[E: [R' E2 R, U']]`  | [odd](), [even]() |
| T          | `[E: [R E' R', U']]`  | [odd](), [even]() |

### UB, UL pieces

These pieces first have a set-up move to put them from the U layer into the
E-layer, and then they are solved using one of the E-layer pieces.

| **Letter** | **Algorithm (odd)**   | **Links** |
|------------|-----------------------|-----------|
| A          | `[B: [R E' R', U']]`  | [odd](), [even]() |
| Q          | `[B: [R' E2 R, U']]`  | [odd](), [even]() |
| D          | `[L: [R E2 R', U']]`  | [odd](), [even]() |
| E          | `[L: [R' E R, U']]`   | [odd](), [even]() |

### UR piece (helper)

If the helper sticker (B) is encountered, no algorimn needs to be performed. If
the other sticker (M) is encountered, the pieces in the buffer and helper
locations must be rotated.

Note: the rotation algorithm for even cases is the same.

| **Letter** | **Algorithm (odd)**      | **Links** |
|------------|--------------------------|-----------|
| B          | _no algoritm_            | _N/A_     |
| M          | [`M D' M' D M D2 M', U]` | [odd](), [even]() |

# Tips and tricks

## Choosing target pieces for new cycles

## Skipping targets

# Example solves

* [Sune](https://cubedb.net/?puzzle=3&scramble=R_U_R-_U_R_U2_R-&alg=%2F%2F_Corners%3A_RI_BD%0A%0A%5BL2%3A_%5BR_D2_R-%2C_U-%5D_%5D_%2F%2F_R_odd%0A%5BL2%3A_%5BR-_D2_R%2C_U%5D_%5D__%2F%2F_I_even%0A%0A%2F%2F_B%3A_skipp%0A%5BL%3A_%5BU-%2C_R_D2_R-%5D_%5D__%2F%2F_D_even%0A%0A%0A%2F%2F_Edges%3A_AB_DA%0A%0A%5BB%3A_%5BR_E-_R-%2C_U-%5D%5D_%2F%2F_A_odd%0A%2F%2F_B%3A_skip%0A%0A%5BL-%3A_%5BR-_E2_R%2C_U-%5D%5D_%2F%2F_D_odd%0A%5BB%3A_%5BU-%2C_R_E-_R-%2C%5D%5D_%2F%2F_A_even)
