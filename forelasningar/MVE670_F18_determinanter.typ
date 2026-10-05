// =====================================================================
//  MVE670 Linjär algebra – Föreläsning 18 (29 september 2026)
//  Tas in i main.typ med #include "forelasningar/MVE670_F18_determinanter.typ"
// =====================================================================
#import "../anteckningar-3b1b.typ": *
#nyforelasning(18, [Determinanter: geometri och beräkning], [29 september 2026])

= Geometrisk verifikation då $n = 2$ och $n = 3$

#definition[Notation][
  $
    det mat(a_11, dots, a_(1 n); dots.v, , dots.v; a_(n 1), dots, a_(n n))
    = mat(delim: "|", a_11, dots, a_(1 n); dots.v, , dots.v; a_(n 1), dots, a_(n n))
  $
  Raka streck!
]

== Fallet $n = 3$

#ihop[Om
  $ A = mat(bar.v, bar.v, bar.v; fg(basx, vb(a)_1), fg(basy, vb(a)_2), fg(basz, vb(a)_3); bar.v, bar.v, bar.v) $
  bör $det(A) = plus.minus "Volym"("Parallellepiped")$.]

#figur({
  let add = cetz.vector.add
  let a1 = (2.6, 0)
  let a2 = (1.1, 0.6)
  let a3 = (0.4, 1.5)
  let a12 = add(a1, a2)
  let a13 = add(a1, a3)
  let a23 = add(a2, a3)
  let a123 = add(a12, a3)
  yta((0, 0), a1, a12, a123, a23, a3, farg: objekt1)
  import cetz.draw: *
  let kant = 0.7pt + ljusgra
  line(a1, a13, a123, a23, a3, stroke: kant)
  line(a1, a12, a123, stroke: kant)
  line(a3, a13, stroke: kant)
  hjalplinje(a2, a12)
  hjalplinje(a2, a23)
  vektor((0, 0), a1, basx, etikett: $vb(a)_1$)
  vektor((0, 0), a2, basy, etikett: $vb(a)_2$, vid: (1.2, 0.56), anchor: "north-west")
  vektor((0, 0), a3, basz, etikett: $vb(a)_3$)
})

#ihop[Vet sedan tidigare att:]
$ (vb(a)_1 times vb(a)_2) dot vb(a)_3 = plus.minus "Volym"("Parallellepiped") $

Låt oss verifiera detta med ett exempel. Men först, minnesregel för $3 times 3$-determinanter:

#formel[Minnesregel för $3 times 3$-determinanter][
  $
    mat(delim: "|", limits(a_11)^+, limits(a_12)^-, limits(a_13)^+; a_21, a_22, a_23; a_31, a_32, a_33)
    = a_11 (a_22 a_33 - a_23 a_32) - a_12 (a_21 a_33 - a_23 a_31) + a_13 (a_21 a_32 - a_22 a_31)
  $
]

#pagebreak()
#exempel[
  Beräkna volymen av den parallellepiped som spänns upp av $vb(v)_1 = (1, 0, 6)$, $vb(v)_2 = (0, 3, 5)$, $vb(v)_3 = (2, 4, 0)$.
]
#losning[
  #set enum(numbering: fnum("1.", gron))
  + $
      mat(delim: "|", bar.v, bar.v, bar.v; vb(v)_1, vb(v)_2, vb(v)_3; bar.v, bar.v, bar.v)
      = mat(delim: "|", limits(1)^+, limits(0)^-, limits(2)^+; 0, 3, 4; 6, 5, 0)
      &= 1 dot (3 dot 0 - 4 dot 5) - 0 dot (dots) + 2 (0 dot 5 - 3 dot 6) \
      &= -20 - 36 = -56
    $
    $therefore "Volym" = 56$.
  + $
      vb(v)_1 times vb(v)_2 = vec(1, 0, 6) times vec(0, 3, 5) = vec(-18, -5, 3)
      ==> (vb(v)_1 times vb(v)_2) dot vb(v)_3 = vec(-18, -5, 3) dot vec(2, 4, 0) = -36 - 20 = -56
    $
    $therefore "Volym" = 56$.
]

#ihop[Kan verifiera i allmänhet att:]
$
  mat(delim: "|", a_11, a_12, a_13; a_21, a_22, a_23; a_31, a_32, a_33) = (vb(a)_1 times vb(a)_2) dot vb(a)_3 quad ("övn.")
$

== Fallet $n = 2$

$
  mat(delim: "|", a_11, a_12; a_21, a_22) = underbrace(a_11 a_22 - a_12 a_21, "föreg. föreläsn.")
  attach(=, t: ?) plus.minus "Area"("parallellogrammet")
$

#figur({
  let a1 = (2.4, 0.4)
  let a2 = (0.6, 1.4)
  yta((0, 0), a1, cetz.vector.add(a1, a2), a2, farg: objekt1, kant: true)
  vektor((0, 0), a1, basx, etikett: $vb(a)_1$)
  vektor((0, 0), a2, basy, etikett: $vb(a)_2$)
})

Tänk på $vb(a)_1, vb(a)_2$ som vektorer i $RR^3$, dvs. $vb(a)_1 = (a_11, a_21, 0)$, $vb(a)_2 = (a_12, a_22, 0)$.

#ihop[Då är]
$
  "Area"("Parallellogram") & = "Volym"("Parallellepiped" vb(a)_1, vb(a)_2, vb(e)_3) \
                           & = mat(delim: "|", limits(a_11)^+, limits(a_12)^-, limits(0)^+; a_21, a_22, 0; 0, 0, 1)
                             = a_11 a_22 - a_12 a_21 + 0 = mat(delim: "|", a_11, a_12; a_21, a_22) quad "ok!"
$

#ihop[Låt $f_A : RR^2 -> RR^2$ vara en linjär avbildning,
  $ f_A (vb(x)) = A vb(x) = (fg(basx, vb(a)_1) space fg(basy, vb(a)_2)) vb(x). $]

#let _a1 = (1.4, 0.35)
#let _a2 = (0.35, 1.0)
#let _A(p) = (_a1.at(0) * p.at(0) + _a2.at(0) * p.at(1), _a1.at(1) * p.at(0) + _a2.at(1) * p.at(1))

#figur(langd: 1.3cm, {
  import cetz.draw: *
  // Enhetskvadraten S
  rutnat(x: (0, 1.6), y: (0, 1.6), rutor: false, xetikett: none, yetikett: none)
  yta((0, 0), (1, 0), (1, 1), (0, 1), farg: objekt1, kant: true)
  vektor((0, 0), (1, 0), basx, etikett: $vb(e)_1$, vid: (1, -0.12), anchor: "north")
  vektor((0, 0), (0, 1), basy, etikett: $vb(e)_2$)
  etikett((0.5, 0.5), $S$, farg: objekt1)
  etikett((0.6, -0.75), $"Area"(S) = 1$)
  // f_A
  bezier((1.9, 1.1), (3.1, 1.1), (2.5, 1.6), stroke: 0.9pt + ljusgra, mark: (end: "stealth", fill: ljusgra, scale: 0.7))
  etikett((2.5, 1.65), $f_A$)
  // Bilden f_A(S)
  group({
    translate((3.6, 0))
    rutnat(x: (0, 2.1), y: (0, 1.6), rutor: false, xetikett: none, yetikett: none)
    yta((0, 0), _a1, _A((1, 1)), _a2, farg: harlett, kant: true)
    vektor((0, 0), _a1, basx, etikett: $vb(a)_1$)
    vektor((0, 0), _a2, basy, etikett: $vb(a)_2$)
    etikett(cetz.vector.add(_A((1, 1)), (0.15, 0.05)), $tilde(S) = f_A (S)$, farg: harlett, anchor: "west")
  })
})

$ "Area"(tilde(S)) = plus.minus det(A) dot underbrace("Area"(S), = 1) $

#let _k1 = 2
#let _k2 = 1.5
#figur(langd: 1.1cm, {
  import cetz.draw: *
  rutnat(x: (0, 2.4), y: (0, 1.9), rutor: false, xetikett: none, yetikett: none)
  yta((0, 0), (_k1, 0), (_k1, _k2), (0, _k2), farg: objekt1, kant: true)
  vektor((0, 0), (_k1, 0), basx, etikett: $k_1 vb(e)_1$, vid: (_k1, -0.3), anchor: "north")
  vektor((0, 0), (0, _k2), basy, etikett: $k_2 vb(e)_2$, vid: (-0.15, _k2), anchor: "east")
  etikett((_k1 / 2, _k2 / 2), $S$, farg: objekt1)
  etikett((_k1 / 2, -1.0), $"Area"(S) = k_1 k_2$)
  group({
    translate((4.2, 0))
    let p1 = _A((_k1, 0))
    let p2 = _A((0, _k2))
    rutnat(x: (0, 3.5), y: (0, 2.4), rutor: false, xetikett: none, yetikett: none)
    yta((0, 0), p1, _A((_k1, _k2)), p2, farg: harlett, kant: true)
    vektor((0, 0), p1, basx, etikett: $k_1 vb(a)_1$, vid: cetz.vector.add(p1, (0.1, -0.15)), anchor: "north-west")
    vektor((0, 0), p2, basy, etikett: $k_2 vb(a)_2$)
    etikett(cetz.vector.add(_A((_k1, _k2)), (0.15, 0)), $tilde(S) = f_A (S)$, farg: harlett, anchor: "west")
  })
})

$
  "Area"(tilde(S)) = plus.minus mat(delim: "|", k_1 vb(a)_1, k_2 vb(a)_2)
  = plus.minus k_1 k_2 mat(delim: "|", vb(a)_1, vb(a)_2) = plus.minus det(A) dot "Area"(S)
$

#figur(langd: 1cm, {
  import cetz.draw: *
  let n = 160
  let S = range(n).map(i => {
    let t = 2 * calc.pi * i / n
    let r = 0.75 + 0.18 * calc.sin(2 * t) + 0.1 * calc.cos(3 * t)
    (1.3 + r * calc.cos(t), 1.25 + r * calc.sin(t))
  })
  rutnat(x: (0, 2.6), y: (0, 2.5), rutor: false)
  line(..S, close: true, fill: objekt1.transparentize(72%), stroke: 0.8pt + objekt1)
  etikett((1.3, 1.25), $S$, farg: objekt1)
  bezier((2.9, 1.9), (4.4, 1.9), (3.65, 2.5), stroke: 0.9pt + ljusgra, mark: (
    end: "stealth",
    fill: ljusgra,
    scale: 0.7,
  ))
  etikett((3.65, 2.5), $f_A$)
  group({
    translate((4.9, 0))
    rutnat(x: (0, 4), y: (0, 2.7), rutor: false)
    line(..S.map(_A), close: true, fill: harlett.transparentize(72%), stroke: 0.8pt + harlett)
    etikett((3.75, 2.55), $tilde(S) = f_A (S)$, farg: harlett, anchor: "west")
  })
})

$ "Area"(tilde(S)) = plus.minus det(A) "Area"(S) $

Detta gäller på samma sätt för volymer i $RR^3$ och i allmänhet:

#formel[
  $
    f_A : RR^n -> RR^n "linjär med" f_A (vb(x)) = A vb(x)
    ==> "Vol"_n (f_A (S)) = plus.minus det(A) "Vol"_n (S)
  $
]

= Beräkningar av determinanter

Någon minnesregel för $n times n$-matris där $n > 3$ finns ej (och skulle ej vara användbar om den fanns, då t.ex. $n = 5 ==> sum_(p in S_n) sigma(p) dots$ består av 120 termer).

Vi måste utveckla andra beräkningsmetoder.

#ihop[Om vi bildar $tilde(A)$ genom att addera en multipel av en kolumn till en annan kolumn i $A$ (t.ex. $tilde(A) = (vb(a)_1 + k vb(a)_2, vb(a)_2, dots, vb(a)_n)$), så är $det(tilde(A)) = det(A)$:
  $ det(tilde(A)) = det(A) + k underbrace(det(vb(a)_2, vb(a)_2, dots, vb(a)_n), = 0) = det(A) $]

#ihop[Detta ger:]

#sats[
  Låt
  $ A = mat(1, *, dots, *; 0, , , ; dots.v, , A_11, ; 0, , , ; augment: #(hline: 1, vline: 1)), $
  där $A_11$ är $(n-1) times (n-1)$-matrisen man får om man stryker rad 1, kolumn 1 i $A$. Då är $det(A) = det(A_11)$.
]

#bevis[
  Genom att addera lämpliga multipler av kolumn 1 till de övriga kolumnerna i $A$ får vi:
  $
    det(A) = det mat(1, 0, dots, 0; 0, , , ; dots.v, , A_11, ; 0, , , ; augment: #(hline: 1, vline: 1))
    = det mat(1, 0, dots, 0; 0, , , ; dots.v, tilde(vb(a))_1, dots, tilde(vb(a))_(n-1); 0, , , ; augment: #(hline: 1, vline: 1))
    = D(tilde(vb(a))_1, dots, tilde(vb(a))_(n-1))
  $
  (tänk på HL som $D(tilde(vb(a))_1, dots, tilde(vb(a))_(n-1))$). Denna funktion uppfyller (i)–(iii), så då måste $D(tilde(vb(a))_1, dots, tilde(vb(a))_(n-1)) = det(A_11)$.

  $therefore det(A) = det(A_11)$.
]

#foljdsats[
  Om
  $ A = mat(a_11, , , *; , a_22, , ; , , dots.down, ; 0, , , a_(n n)) $
  (allt under diagonalen $= 0$, övrigt vad som helst) så är
  $ det(A) = a_11 a_22 dot.c dots dot.c a_(n n) = product_(j = 1)^n a_(j j). $
]

#bevis[(skiss)][
  $
    det mat(a_11, , , *; , a_22, , ; , , dots.down, ; 0, , , a_(n n))
    &= a_11 det mat(1, , , *; , a_22, , ; , , dots.down, ; 0, , , a_(n n))
    limits(=)^"prop." a_11 det mat(a_22, , *; , dots.down, ; 0, , a_(n n)) \
    &= a_11 a_22 det mat(1, , *; , dots.down, ; 0, , a_(n n)) = dots = a_11 a_22 dot.c dots dot.c a_(n n)
  $
]

#pagebreak()
#exempel[
  $
    mat(delim: "|", 1, 4, 5; 2, 2, 5; 3, 0, 1)
    = mat(delim: "|", -14, 4, 5; -13, 2, 5; 0, 0, 1)
    = 2 mat(delim: "|", -14, 2, 5; -13, 1, 5; 0, 0, 1)
    = 2 mat(delim: "|", 12, 2, 5; 0, 1, 5; 0, 0, 1)
    = 2 dot 12 dot 1 dot 1 = 24
  $
  I första steget adderas $(-3)$ gånger kolumn 3 till kolumn 1, i andra steget bryts faktorn $2$ ut ur kolumn 2 och i tredje steget adderas $13$ gånger kolumn 2 till kolumn 1.
]

Jobbigt att addera kolumner. Finns det något sätt att överföra detta till rader? Ja! $A^T$ = byt plats på rader och kolumner i $A$.

Vad är relationen mellan $det(A^T)$ och $det(A)$?

#sats[
  $ det(A^T) = det(A) $
]

#bevis[
  Läs s. 225 i Sparr.
]

Detta medför bl.a. att:
#[
  #set enum(numbering: fnum("(a)", bla))
  + determinanten är multilinjär i både rader och kolumner,
  + determinanten är alternerande i både rader och kolumner.
]

Alltså kan vi beräkna determinanter genom att Gaussa som vanligt, _nästan_:

#exempel[
  $
    mat(delim: "|", 2, 3, 2, 1; 5, -2, 3, 2; 4, 3, 0, 1; 8, -1, 4, 1)
    &= - mat(delim: "|", 1, 3, 2, 2; 2, -2, 3, 5; 1, 3, 0, 4; 1, -1, 4, 8)
    = - mat(delim: "|", 1, 3, 2, 2; 0, -8, -1, 1; 0, 0, -2, 2; 0, -4, 2, 6) \
    &= mat(delim: "|", 1, 3, 2, 2; 0, -4, 2, 6; 0, 0, -2, 2; 0, -8, -1, 1)
    = mat(delim: "|", 1, 3, 2, 2; 0, -4, 2, 6; 0, 0, -2, 2; 0, 0, -5, -11) \
    &= -2 mat(delim: "|", 1, 3, 2, 2; 0, -4, 2, 6; 0, 0, 1, -1; 0, 0, -5, -11)
    = dots = -128
  $
  Först byter kolumn 1 och 4 plats (teckenbyte). Sedan radoperationerna: rad 1 gånger $(-2)$ adderas till rad 2 och gånger $(-1)$ till rad 3 och 4; rad 2 och 4 byter plats; rad 2 gånger $(-2)$ adderas till rad 4; faktorn $-2$ bryts ut ur rad 3; rad 3 gånger $5$ adderas till rad 4.
]
