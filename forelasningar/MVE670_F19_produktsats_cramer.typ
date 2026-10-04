// =====================================================================
//  MVE670 Linjär algebra – Föreläsning 19 (30 september 2026)
//  Tas in i main.typ med #include "forelasningar/MVE670_F19_produktsats_cramer.typ"
// =====================================================================
#import "../anteckningar-3b1b.typ": *
#nyforelasning(19, [Produktsatsen, kofaktorutveckling och Cramers regel], [30 september 2026])

= Determinanten av en produkt

*Fråga:* $A, B$ typ $n times n$. Gäller
$ det(A + B) attach(=, t: ?) det(A) + det(B)? $

*Svar:* Nej!

#exempel[
  Låt $A = B = I = mat(1, 0; 0, 1)$. Då är
  $ det(A + B) = det(2 I) = 2^2 det(I) = 4 $
  ($det(k A) = k^n det(A)$ om $A$ är $n times n$), men
  $ det(A) + det(B) = 2 det(I) = 2. $
  $therefore det(A + B) != det(A) + det(B)$ i allmänhet.
]

Däremot gäller:

#sats[
  $A, B$ typ $n times n$. Då är $det(A B) = det(A) det(B)$.
]

#bevis[
  Antag $det(B) != 0$.
  $
    B A = B mat(bar.v, , bar.v; vb(a)_1, dots, vb(a)_n; bar.v, , bar.v)
    = mat(bar.v, , bar.v; B vb(a)_1, dots, B vb(a)_n; bar.v, , bar.v)
  $
  #ihop[Studera]
  $
    C(vb(a)_1, dots, vb(a)_n) = det(B A) / det(B) = det(B vb(a)_1 dots B vb(a)_n) / det(B)
    = D(B vb(a)_1, dots, B vb(a)_n) / det(B).
  $
  Denna uppfyller:
  #set enum(numbering: fnum("(i)", guld))
  + $C(vb(a)_1, dots, vb(a)_n) = 0$ om $vb(a)_i = vb(a)_j$, $i != j$, då $B vb(a)_i = B vb(a)_j$.
  + $C(vb(a)_1, dots, vb(a)_n)$ är multilinjär (tänk igenom).
  + $
      C(vb(e)_1, dots, vb(e)_n) = D(B vb(e)_1, dots, B vb(e)_n) / det(B)
      = D(vb(b)_1, dots, vb(b)_n) / det(B) = det(B) / det(B) = 1.
    $
  Det finns endast en funktion av $vb(a)_1, dots, vb(a)_n$ som uppfyller (i)–(iii), nämligen $det(A)$.
  $
    therefore det(A) = C(vb(a)_1, dots, vb(a)_n) = det(B A) / det(B)
    <==> det(B A) = det(B) det(A)
  $
]

=== Geometriskt

#figur({
  import cetz.draw: *
  // Slät "klump" kring (cx, cy) med radie r och liten deformation
  let klump(cx, cy, r, fas) = range(120).map(i => {
    let t = 2 * calc.pi * i / 120
    let rr = r * (1 + 0.16 * calc.sin(2 * t + fas) + 0.08 * calc.cos(3 * t))
    (cx + rr * calc.cos(t), cy + rr * calc.sin(t))
  })
  let ruta(x0, x1) = rect((x0, 0), (x1, 1.6), stroke: 0.8pt + ljusgra)
  let pil(a, b) = bezier(a, b, ((a.at(0) + b.at(0)) / 2, a.at(1) + 0.35), stroke: 0.9pt + ljusgra, mark: (
    end: "stealth",
    fill: ljusgra,
    scale: 0.7,
  ))
  // RR^n, S
  ruta(0, 2.2)
  line(..klump(1.1, 0.8, 0.42, 0), close: true, fill: objekt1.transparentize(72%), stroke: 0.8pt + objekt1)
  etikett((1.1, 0.8), $S$, farg: objekt1)
  etikett((0, 1.6), $RR^n$, anchor: "south-east")
  // RR^n, f_B (S)
  pil((2.4, 1.0), (3.6, 1.0))
  etikett((3.0, 1.45), $f_B$)
  ruta(3.8, 6.4)
  line(..klump(5.1, 0.8, 0.5, 1.2), close: true, fill: objekt2.transparentize(72%), stroke: 0.8pt + objekt2)
  etikett((5.1, 0.8), $f_B (S)$, farg: objekt2)
  etikett((3.8, 1.6), $RR^n$, anchor: "south-east")
  // RR^n, f_A f_B (S)
  pil((6.6, 1.0), (7.8, 1.0))
  etikett((7.2, 1.45), $f_A$)
  ruta(7.9, 11.0)
  line(..klump(9.5, 0.8, 0.72, 2.0), close: true, fill: harlett.transparentize(72%), stroke: 0.8pt + harlett)
  etikett((9.5, 0.8), $f_A f_B (S)$, farg: harlett)
  etikett((11.0, 1.6), $RR^n$, anchor: "south-west")
  // f_A ∘ f_B = f_(A B)
  bezier((1.1, -0.15), (9.5, -0.15), (5.3, -1.6), stroke: 0.9pt + ljusgra, mark: (
    end: "stealth",
    fill: ljusgra,
    scale: 0.7,
  ))
  etikett((5.3, -1.2), $f_A compose f_B = f_(A B)$)
})

$
               "Vol"(f_A (f_B (S))) & = plus.minus det(A) "vol"(f_B (S)) = plus.minus det(A) det(B) "vol"(S) \
  #rotate(90deg, reflow: true)[$=$] & \
                 "vol"(f_(A B) (S)) & = plus.minus det(A B) "Vol"(S)
$

$ "“"therefore"”" quad det(A B) = det(A) det(B) $

#foljdsats[
  Om $A$ är inverterbar så är $det(A) != 0$ och $det(A^(-1)) = 1 / det(A)$.
]

#bevis[
  $A$ inverterbar $<==> exists A^(-1) : I = A^(-1) A$.
  $ 1 = det(I) = det(A^(-1) A) = det(A^(-1)) det(A) $
  $ therefore det(A) != 0 quad "&" quad det(A^(-1)) = 1 / det(A) $
]

#sats["Huvudsatsen"][
  $det(A) != 0 <==> A "inverterbar" <==>$ massa andra påståenden.
]

= Kofaktorutveckling

#definition[
  Om $A$ är av typ $n times n$ låter vi $D_(i j)$ beteckna determinanten av den matris vi får om vi stryker rad $i$ och kolumn $j$ i $A$. ($D_(i j)$ kallas *kofaktor*? *underdeterminant*.)
]

#exempel[
  $
    A = mat(1, -1, 2; 3, 1, 0; 4, 5, 0), quad
    D_32 = mat(delim: "|", 1, 2; 3, 0) = -6
  $
]

#sats[
  Antag $A$ typ $n times n$. Då gäller att:
  #set enum(numbering: fnum("(i)", guld))
  + $ det(A) = sum_(i = 1)^n (-1)^(i + j) a_(i j) D_(i j) quad "(utveckling efter kolumn" j")" $
  + $ det(A) = sum_(j = 1)^n (-1)^(i + j) a_(i j) D_(i j) quad "(utveckling efter rad" i")" $
]

#pagebreak()
#exempel[
  Beräkna $det(A)$ för $A$ i föregående exempel, genom utveckling efter rad 2 respektive kolumn 3.
]
#losning[
  #ihop[Utveckla efter rad 2:]
  $
    mat(delim: "|", 1, -1, 2; limits(3)^fg(hjalp, -), limits(1)^fg(hjalp, +), limits(0)^fg(hjalp, -); 4, 5, 0)
    &= (-1)^(2 + 1) dot 3 dot mat(delim: "|", -1, 2; 5, 0)
    + (-1)^(2 + 2) dot 1 dot mat(delim: "|", 1, 2; 4, 0) + 0 dot dots \
    &= -3 dot (-10) + 1 dot 1 dot (-8) + 0 = 22
  $
  #ihop[Utveckla efter kolumn 3:]
  $
    mat(delim: "|", 1, -1, limits(2)^fg(hjalp, +); 3, 1, limits(0)^fg(hjalp, -); 4, 5, limits(0)^fg(hjalp, +))
    = 2 dot mat(delim: "|", 3, 1; 4, 5) - 0 dot dots + 0 dot dots = 2 dot 11 = 22
  $
]

#definition[
  Antag $A$ typ $n times n$. *Adjunkten* till $A$ är den $n times n$-matris vars $(i, j)$-element är $(-1)^(i + j) D_(j i)$ (Obs! omvänd ordning), dvs.
  $
    "adj"(A) = mat(D_11, -D_21, D_31, dots; -D_12, D_22, dots, ; dots.v, , dots.down,)
  $
]

#sats[
  $A$ typ $n times n$.
  $ A("adj"(A)) = ("adj"(A)) A = det(A) dot I $
  *Speciellt:* Om $det(A) != 0$ så är
  $ A^(-1) = 1 / det(A) "adj"(A). $
]

#exempel[
  $A = mat(1, 2; 3, 4)$. Bestäm $A^(-1)$.
]
#losning[
  $
    A = mat(1, 2; 3, 4) ==> "adj"(A) = mat(4, -2; -3, 1), quad det(A) = 4 - 6 = -2 != 0
  $
  $
    A^(-1) = 1 / det(A) "adj"(A) = 1 / (-2) mat(4, -2; -3, 1)
  $
]

#ihop[I allmänhet då $n = 2$: $A = mat(a, b; c, d)$. Om $det(A) = a d - b c != 0$ så är]
$
  A^(-1) = 1 / det(A) "adj"(A) = 1 / (a d - b c) mat(d, -b; -c, a).
$

#pagebreak()
= Cramers regel

Detta resultat är nära besläktat med:

#sats[Cramers regel][
  Antag $A = mat(bar.v, , bar.v; vb(a)_1, dots, vb(a)_n; bar.v, , bar.v)$ typ $n times n$ med $det(A) != 0$. Då har $A vb(x) = vb(b)$ den entydiga lösningen
  $
    vb(x) = vec(x_1, dots.v, x_n) quad "där" quad
    x_j = mat(delim: "|", bar.v, , bar.v, , bar.v; vb(a)_1, dots, vb(b), dots, vb(a)_n; bar.v, , bar.v, , bar.v) / det(A)
  $
  (byt ut kolumn $vb(a)_j$ mot $vb(b)$).
]

#bevis[
  Vi har att $x_1 vb(a)_1 + dots + x_n vb(a)_n = vb(b)$, så
  $
    mat(delim: "|", vb(a)_1, dots, underbrace(vb(b), "kolumn" j), dots, vb(a)_n)
    &= D(vb(a)_1, dots, vb(b), dots, vb(a)_n) \
    &= D(vb(a)_1, dots, sum_(k = 1)^n x_k vb(a)_k, dots, vb(a)_n) = lr(\{ "multilinj." \}) \
    &= sum_(k = 1)^n x_k D(vb(a)_1, dots, vb(a)_k, dots, vb(a)_n) = lr(\{ "alla termer" = 0 "utom" k = j \}) \
    &= x_j D(vb(a)_1, dots, vb(a)_j, dots, vb(a)_n) = x_j det(A)
  $
  $
    <==> x_j = mat(delim: "|", vb(a)_1, dots, vb(b), dots, vb(a)_n) / det(A)
  $
]

#exempel[
  Studera matrisekvationen
  $
    mat(1, -1, 2; 3, 1, 0; 4, 5, 0) vec(x_1, x_2, x_3) = vec(1, 2, 3).
  $
  Beräkna $x_2$.
]
#losning[
  Vi vet att $det(A) = 22 != 0$. Cramers regel:
  $
    x_2 &= 1 / 22 mat(delim: "|", 1, 1, limits(2)^fg(hjalp, +); 3, 2, limits(0)^fg(hjalp, -); 4, 3, limits(0)^fg(hjalp, +)) \
    &= 1 / 22 dot 2 dot mat(delim: "|", 3, 2; 4, 3) + 0 dot dots + 0 dot dots = 1 / 22 dot 2 dot 1 = 1 / 11
  $
]
