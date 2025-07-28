#import "cram-snap/lib.typ": cram-snap, theader

#set page(
  paper: "a4",
  flipped: true,
  margin: 1cm,
)
#set text(font: "Arial", size: 11pt)

#let piece(body) = [
  #text(fill: olive, font: "DejaVu Sans Mono", size: 0.9em)[#body]
]

#let alg(body) = [
  #text(fill: blue, font: "DejaVu Sans Mono", size: 0.9em)[#body]
]

#show: cram-snap.with(
  title: [Blindsolving Cheat Sheet by JorisL],
  icon: image("cube.svg"),
)


= Speffz lettering scheme

#image("speffz.png", width: 50%)

#table(
  theader[3x3 steps],
  [Solve edges], [M2 method],
  [Perform parity algorithm?], [Uneven number of edge swaps],
  [Solve corners], [Old Pochmann method],
)

#table(
  theader[4x4 steps],
  [Solve centers], [U2 method],
  [Perform U2 parity algorithm?], [Uneven number of center swaps],
  [Solve edges], [r2 method],
  [Perform r2 parity algorithm?], [Uneven number of wing swaps],
  [Solve corners], [Old Pochmann method],
  [Perform 4x4 OP parity?], [Uneven number of corner swaps],
)

= 3x3 edges: M2

Buffer piece is located on #piece[U].
Swap with piece located on #piece[A].

#table(
  theader[Algorithms],
  [_Non M-slice target_], [Set-up to #piece[A] (without disrupting M-slice), perform #alg[M2], undo set-up],
  [#piece[A]], [#alg[M2]],
  [#piece[Q]], [#alg[(U B' R U' B) M2 (B' U R' B U')]],
  [#piece[C] (even), #piece[W] (uneven)], [#alg[U2 M' U2 M']],
  [#piece[W] (even), #piece[C] (uneven)], [#alg[M U2 M U2]],
  [#piece[I] (even), #piece[S] (uneven)], [#alg[(D M' U) R2 (U' M U) R2 (U' D' M2)]],
  [#piece[S] (even), #piece[I] (uneven)], [#alg[(M2' D U) R2 (U' M' U) R2 (U' M D')]],
  [M2/OP parity], [#alg[(D' L2 D) M2 (D' L2 D)]],
)

= 3x3 corners: OP (Old Pochmann)

Buffer piece is located on #piece[A].
Swap with piece located on #piece[P].
Swap by setting up target piece to #piece[P] (without disrupting #piece[A] or #piece[D]), performing the swapping algorithm, and undoing set-up.

#table(
  theader[Algorithms],
  [Swapping algorithm], [#alg[(R' F) (R2 U' R' U') (R U R' F') (R U R' U')]],
)

= 4x4 centers: U2

Buffer piece is located on #piece[A].
Swap piece is located on #piece[C].

#table(
  theader[Algorithms],
  [_Non U or D face target_], [Set-up to #piece[C] (without disrupting rest of U face), perform #alg[U2], undo set-up],
  [_D face target_], [Set-up to #piece[V], perform #alg[(r2 D' r2 D r2) U2 (r2 D' r2 D r2)], undo set-up],
  [#piece[B] (even), #piece[D] (uneven)], [#alg[(r' u r) U (r' u' r) U (r' u r) U2 (r' u' r) U2]],
  [#piece[D] (even), #piece[B] (uneven)], [#alg[(r' u r) U' (r' u' r) U' (r' u r) U2 (r' u' r) U2]],
  [Parity], [#alg[U2]],
)

= 4x4 wings: r2

The r2 method is mostly similar to the M2 method, with #alg[r2] interchanges instead of #alg[M2]. With the r2 method, there is never a piece 'flipped'; both adjacent edge pieces have a different letter (therefore, #piece[K] is also a specific piece to solve, instead of the buffer flipped).

Each face only names 4 wings: the ones most-clockwise in the edge-pair (there is a gap in between a corner and the edge with the same label).
The other edges get their labels via the other faces.

Buffer is piece located on #piece[U].
Target is piece located on #piece[A].

#table(
  theader[Algorithms],
  [_Non l or r slice piece_], [Set-up to #piece[A] (using same set-up as with M2), perform #alg[r2], undo set-up],
  [#piece[Q]], [perform #alg[(U B' R U' B) r2 (B' U R' B U')]],
  [#piece[C], #piece[K], #piece[W]], [Set-up with #alg[l] rotation to #piece[Q], solve as #piece[Q], undo set-up],
  [#piece[I] (even), #piece[S] (uneven)], [#alg[(D r' U) R2 (U' r' U) R2 (U' D' r2)]],
  [#piece[S] (even), #piece[I] (uneven)], [#alg[(r2' D U) R2 (U' r U) R2 (U' r D')]],
  [Parity], [#alg[r2 (D' L' F) (l' U2 l' U2) (F2 l' F2 r) (U2 r' U2 l2) (F' L D)]],
)

Parity algorithm is based on the following algorithm to swap the BUR and FUR wings: #alg[(l' U2 l' U2) (F2 l' F2 r) (U2 r' U2 l2)].
First a #alg[r2] move is done to fix all pieces, except for the #piece[U] and #piece[A] pieces.
Then the #piece[U] piece is brought to the UFR location, the swapping is performed,
and the #piece[U] piece set-up is undone.

= 4x4 corners: OP (Old Pochmann)

4x4 corners is the same as for a 3x3, but the parity algorithm is different. Now the parity only swaps the wing-pairs that are equivalent to the 3x3 #piece[A] and #piece[D] pieces.

#table(
  theader[Algorithms],
  [Parity], [#alg[(L2 D F2) (r2 U2 r2 Uw2 r2 Uw2) (F2 D' L2)]],
)

This parity algorithm first sets up both 'edges' to the UF and UB spots, performs the standard 4x4 PLL parity algorithm, and undoes the set-up.

= 4x4 tips

== Centers

- Skip U-face pieces when possible, to limit cycle breaks.
- Shoot other pieces to their face in alphabetical order.

== Wings

- Touch finger when single piece on 'edge' memorized, remove when both memorized.