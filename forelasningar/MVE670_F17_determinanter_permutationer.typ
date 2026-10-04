// =====================================================================
//  MVE670 Linjär algebra – Föreläsning 17 (28 september 2026)
//  Tas in i main.typ med #include "forelasningar/MVE670_F17_determinanter_permutationer.typ"
// =====================================================================
#import "../anteckningar-3b1b.typ": *
#nyforelasning(17, [Determinanter], [28 september 2026])

= Geometrisk motivering

Antag att $A$ är av typ $n times n$. _Determinanten_ av $A$, betecknas $det(A)$, är ett tal (i $RR$) associerat med $A$, som vi kan tänka på som den $n$-dimensionella "volymen" av den "kropp" som $A$:s kolumner bildar.

== $n = 1$

$A = a in RR$, ett tal. $det(A)$ kan tolkas som $plus.minus$ längden av "sträckan" från $0$ till $a$.

#figur({
  import cetz.draw: *
  line((-2.2, 0), (2.2, 0), stroke: 0.8pt + ljusgra)
  for (x, t) in ((-1.5, $-a$), (0, $0$), (1.5, $a$)) {
    line((x, -0.1), (x, 0.1), stroke: 0.8pt + ljusgra)
    content((x, -0.2), t, anchor: "north")
  }
  line((0, 0), (1.5, 0), stroke: 2pt + objekt1)
})

== $n = 2$

#ihop[$A = (vb(a)_1 space vb(a)_2)$ och]
$ det(A) = plus.minus "arean av parallellogrammen", $
där tecknet beror på orienteringen av $vb(a)_1$ och $vb(a)_2$.

#figur({
  let a1 = (2.5, 0.3)
  let a2 = (0.8, 1.5)
  let a12 = cetz.vector.add(a1, a2)
  yta((0, 0), a1, a12, a2, farg: objekt1)
  hjalplinje(a1, a12)
  hjalplinje(a2, a12)
  vektor((0, 0), a1, basx, etikett: $vb(a)_1$)
  vektor((0, 0), a2, basy, etikett: $vb(a)_2$)
})

== $n = 3$

#ihop[$A = (vb(a)_1 space vb(a)_2 space vb(a)_3)$ och]
$ det(A) = plus.minus "volymen av parallellepipeden". $

#figur({
  import cetz.draw: *
  let add = cetz.vector.add
  let a1 = (2.4, 0)
  let a2 = (0.2, 1.7)
  let a3 = (1.1, 0.9)
  let kant = 0.7pt + ljusgra
  yta((0, 0), a1, add(a1, a3), add(add(a1, a2), a3), add(a2, a3), a2, farg: objekt1)
  line(a2, add(a1, a2), add(a1, a3), stroke: kant)
  line(add(a1, a2), add(add(a1, a2), a3), add(a2, a3), a2, stroke: kant)
  line(a1, add(a1, a3), add(add(a1, a2), a3), stroke: kant)
  line(add(a1, a2), a1, stroke: kant)
  hjalplinje(a3, add(a1, a3))
  hjalplinje(a3, add(a2, a3))
  vektor((0, 0), a1, basx, etikett: $vb(a)_1$)
  vektor((0, 0), a2, basy, etikett: $vb(a)_2$, vid: (-0.1, 1.75), anchor: "east")
  vektor((0, 0), a3, basz, etikett: $vb(a)_3$, vid: (1.2, 0.8), anchor: "north-west")
})

= Önskade egenskaper hos volymfunktionen

Låt $D(vb(a)_1, vb(a)_2, dots, vb(a)_n) = det(A)$, där $A = (vb(a)_1 space dots.c space vb(a)_n)$. Vilka egenskaper bör $D(vb(a)_1, dots, vb(a)_n)$ ha om det ska vara en "$n$-dimensionell volymfunktion"?

#[
  #set enum(numbering: fnum("(i)", bla))
  + $D(vb(a)_1, dots, vb(a)_n) = 0$ om $vb(a)_i = vb(a)_j$ för något $i != j$.

    I detta fall bör det inte existera någon $n$-dimensionell volym.
  + $D(vb(a)_1, dots, vb(a)_n)$ bör vara en så kallad _multilinjär_ funktion av $vb(a)_1, dots, vb(a)_n$, dvs. om alla $vb(a)_i$ är fixa utom $i = j$, så är
    $ f(vb(x)) = D(vb(a)_1, dots, vb(a)_(j-1), vb(x), vb(a)_(j+1), dots, vb(a)_n) $
    en linjär avbildning i $vb(x)$.
  + $D(vb(e)_1, dots, vb(e)_n) = 1$, där $vb(e)_1, dots, vb(e)_n$ är standardbasen i $RR^n$.
]

#exempel[Multilinearitet för $n = 2$][
  $ D(2 vb(a)_1, vb(a)_2) = 2 thin D(vb(a)_1, vb(a)_2) $

  #figur({
    let add = cetz.vector.add
    let a1 = (1.8, 0.4)
    let a1d = (3.6, 0.8)
    let a2 = (0.35, 0.9)
    yta((0, 0), a1, add(a1, a2), a2, farg: objekt1)
    yta(a1, a1d, add(a1d, a2), add(a1, a2), farg: objekt1)
    hjalplinje(a2, add(a1d, a2))
    hjalplinje(a1d, add(a1d, a2))
    hjalplinje(a1, add(a1, a2))
    vektor((0, 0), a1d, harlett, etikett: $2 vb(a)_1$)
    vektor((0, 0), a1, basx, etikett: $vb(a)_1$, vid: (1.8, 0.25), anchor: "north")
    vektor((0, 0), a2, basy, etikett: $vb(a)_2$, vid: (0.25, 0.95), anchor: "east")
  })

  $ D(vb(a)_1 + tilde(vb(a))_1, vb(a)_2) = D(vb(a)_1, vb(a)_2) + D(tilde(vb(a))_1, vb(a)_2) $

  #figur({
    let add = cetz.vector.add
    let a1 = (1.5, 0)
    let at = (1.2, 0.45)
    let a2 = (0.4, 1.0)
    let s = add(a1, at)
    yta((0, 0), a1, add(a1, a2), a2, farg: objekt1)
    yta(a1, s, add(s, a2), add(a1, a2), farg: objekt2)
    hjalplinje(a2, add(s, a2))
    hjalplinje(s, add(s, a2))
    vektor((0, 0), a1, basx, etikett: $vb(a)_1$, vid: (0.75, -0.2), anchor: "north")
    vektor(a1, s, objekt2, etikett: $tilde(vb(a))_1$, vid: (2.3, 0.1), anchor: "north-west")
    vektor((0, 0), a2, basy, etikett: $vb(a)_2$, vid: (0.25, 1.0), anchor: "east")
  })
]

Vi ska se att det endast finns en funktion $D$ som uppfyller (i)–(iii).

#sats[
  #set enum(numbering: fnum("(I)", guld))
  + För alla $i, j$ gäller
    $
      D(vb(a)_1, dots, vb(a)_i, dots, vb(a)_j, dots, vb(a)_n)
      = -D(vb(a)_1, dots, vb(a)_j, dots, vb(a)_i, dots, vb(a)_n).
    $
  + Om $vb(a)_1, dots, vb(a)_n$ är linjärt beroende så är $D(vb(a)_1, dots, vb(a)_n) = 0$.
]

#bevis[
  (I) Låt $vb(a)_i = vb(a)$, $vb(a)_j = vb(b)$ och skriv $D(vb(a), vb(b)) = D(vb(a)_1, dots, vb(a), dots, vb(b), dots, vb(a)_n)$. Då är
  $
    D(vb(a), vb(b)) & limits(=)^"(i)" D(vb(a), vb(b)) + D(vb(a), vb(a))
    limits(=)^"(ii)" D(vb(a), vb(b) + vb(a))
    limits(=)^"(i)" D(vb(a), vb(a) + vb(b)) - D(vb(a) + vb(b), vb(a) + vb(b)) \
    & limits(=)^"(ii)" D(vb(a) - (vb(a) + vb(b)), vb(a) + vb(b)) = D(-vb(b), vb(a) + vb(b))
    limits(=)^"(ii)" D(-vb(b), vb(a)) + D(-vb(b), vb(b)) \
    & limits(=)^"(ii)" -D(vb(b), vb(a)) - D(vb(b), vb(b)) limits(=)^"(i)" -D(vb(b), vb(a)).
  $

  (II) Om $vb(a)_1, dots, vb(a)_n$ är linjärt beroende kan något $vb(a)_i$, säg $vb(a)_1$, skrivas som en linjärkombination av de andra: $vb(a)_1 = k_2 vb(a)_2 + dots + k_n vb(a)_n$. Då är
  $
    D(vb(a)_1, vb(a)_2, dots, vb(a)_n) & = D(k_2 vb(a)_2 + dots + k_n vb(a)_n, vb(a)_2, dots, vb(a)_n) \
    & limits(=)^"(ii)" k_2 thin D(vb(a)_2, vb(a)_2, dots, vb(a)_n) + dots + k_n thin D(vb(a)_n, vb(a)_2, dots, vb(a)_n)
    limits(=)^"(i)" 0.
  $
]

= Permutationer

Låt $[n]$ beteckna mängden ${1, dots, n}$, $n in NN$.

#definition[Permutation][
  En *permutation* av $[n]$ är en bijektiv funktion $p: [n] -> [n]$, dvs.
  $ p: {1, dots, n} -> {1, dots, n} quad "bijektiv". $
]

#pagebreak()
#exempel[
  $[4] = {1, 2, 3, 4}$ och $p(1) = 4$, $p(2) = 3$, $p(3) = 2$, $p(4) = 1$. Sparr:
  $
    p: mat(delim: #none, 1, 2, 3, 4; arrow.b, arrow.b, arrow.b, arrow.b; 4, 3, 2, 1)
    quad "alt." quad
    p = mat(delim: #none, 1, 2, 3, 4; 4, 3, 2, 1; augment: #(hline: 1)).
  $
]

#ihop[Vi skriver]
$
  p: mat(delim: #none, 1, 2, , n; arrow.b, arrow.b, dots, arrow.b; p_1, p_2, , p_n)
  quad "som" quad p = [p_1, p_2, dots, p_n].
$
Så exemplet ovan blir $p = [4, 3, 2, 1]$.

#definition[
  #set enum(numbering: fnum("(a)", bla))
  + $S_n$ = mängden av alla permutationer av $[n]$ $= {p | p: [n] -> [n] "bijektion"}$.
  + En *defekt* i en permutation $p = [p_1, p_2, dots, p_n]$ är ett par $j, k$ där $j < k$ men $p_j > p_k$.
  + $p$ sägs vara *jämn* om antalet defekter i $p$ är jämnt, och *udda* om antalet defekter är udda.
  + *Signaturen* av $p$, $sigma(p)$, är
    $ sigma(p) = cases(1 & "om" p "jämn", -1 & "om" p "udda".) $
]

#exempel[$n = 2$ och $n = 3$][
  #align(center, table(
    columns: 3,
    align: (left, center, center),
    [Perm. av $[2] = [1, 2]$], [\# defekter], [$sigma(p)$],
    [$p = [1, 2]$], [$0$], [$1$],
    [$p = [2, 1]$], [$1$], [$-1$],
  ))
  #align(center, table(
    columns: 3,
    align: (left, center, center),
    [Perm. av $[3] = [1, 2, 3]$], [\# defekter], [$sigma(p)$],
    [$p = [1, 2, 3]$], [$0$], [$1$],
    [$p = [1, 3, 2]$], [$1$], [$-1$],
    [$p = [2, 1, 3]$], [$1$], [$-1$],
    [$p = [2, 3, 1]$], [$2$], [$1$],
    [$p = [3, 1, 2]$], [$2$], [$1$],
    [$p = [3, 2, 1]$], [$3$], [$-1$],
  ))
]

= Tillbaka till determinanter

#ihop[Vi studerar $D(vb(a)_1, dots, vb(a)_n)$ där $vb(a)_1, dots, vb(a)_n$ är kolumnerna i $n times n$-matrisen $A$:]
$ vb(a)_j = vec(a_(1 j), a_(2 j), dots.v, a_(n j)) = a_(1 j) vb(e)_1 + a_(2 j) vb(e)_2 + dots + a_(n j) vb(e)_n. $
Stoppar vi in dessa i $D(vb(a)_1, dots, vb(a)_n)$ och använder multilinearitet får vi väldigt många termer.

== $n = 2$

$
  D(vb(a)_1, vb(a)_2) & = D(a_11 vb(e)_1 + a_21 vb(e)_2, vb(a)_2) = a_11 D(vb(e)_1, vb(a)_2) + a_21 D(vb(e)_2, vb(a)_2) \
  & = a_11 D(vb(e)_1, a_12 vb(e)_1 + a_22 vb(e)_2) + a_21 D(vb(e)_2, a_12 vb(e)_1 + a_22 vb(e)_2) \
  & = a_11 a_12 underbrace(D(vb(e)_1, vb(e)_1), = 0) + a_11 a_22 underbrace(D(vb(e)_1, vb(e)_2), = 1)
  + a_21 a_12 underbrace(D(vb(e)_2, vb(e)_1), = -1) + a_21 a_22 underbrace(D(vb(e)_2, vb(e)_2), = 0) \
  & = a_11 a_22 - a_12 a_21.
$

== $n = 3$

$
  & D(underbrace(a_11 vb(e)_1 + a_21 vb(e)_2 + a_31 vb(e)_3, vb(a)_1), underbrace(a_12 vb(e)_1 + a_22 vb(e)_2 + a_32 vb(e)_3, vb(a)_2), underbrace(a_13 vb(e)_1 + a_23 vb(e)_2 + a_33 vb(e)_3, vb(a)_3)) \
  & = a_11 a_22 a_33 overbrace(D(vb(e)_1, vb(e)_2, vb(e)_3), = 1) + a_11 a_32 a_23 overbrace(D(vb(e)_1, vb(e)_3, vb(e)_2), = -1)
  + a_21 a_12 a_33 overbrace(D(vb(e)_2, vb(e)_1, vb(e)_3), = -1) \
  & quad + a_21 a_32 a_13 underbrace(D(vb(e)_2, vb(e)_3, vb(e)_1), = 1)
  + underbrace(a_31 a_12 a_23, [3, 1, 2]) underbrace(D(vb(e)_3, vb(e)_1, vb(e)_2), = sigma([3, 1, 2]))
  + a_31 a_22 a_13 underbrace(D(vb(e)_3, vb(e)_2, vb(e)_1), = sigma([3, 2, 1]))
$

#definition[Determinant][
  *Determinanten*, $det(A)$, av en $n times n$-matris
  $ A = mat(a_11, dots, a_(1 n); a_21, dots, a_(2 n); dots.v, , dots.v; a_(n 1), dots, a_(n n)) $
  är talet
  $ det(A) = sum_(p in S_n) sigma(p) thin a_(p_1 1) thin a_(p_2 2) dots.c a_(p_n n). $
]
