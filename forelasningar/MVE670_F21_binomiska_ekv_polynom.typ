// =====================================================================
//  MVE670 Linjär algebra – Föreläsning 21 (2 oktober 2026)
//  Tas in i main.typ med #include "forelasningar/MVE670_F21_binomiska_ekv_polynom.typ"
// =====================================================================
#import "../anteckningar-3b1b.typ": *
#nyforelasning(21, [Binomiska ekvationer och komplexa polynom], [2 oktober 2026])

= Binomiska ekvationer

#definition[
  En *binomisk ekvation* är en ekvation av formen
  $ z^n = w quad "där" n in NN, w in CC "givna". $
]

#exempel[
  Lös ekvationen $z^3 = -8i$.
]
#losning[
  (Lösningsskiss.)

  *Steg 1:* Skriv om HL på polär form och lägg till $k$ varv, $k in ZZ$:
  $ -8i = 8 ee^(-i pi / 2) = 8 ee^(i(-pi / 2 + 2 pi k)), quad k in ZZ $

  *Steg 2:* Låt $z = r ee^(i theta)$ och identifiera $r$ och $theta$:
  $
    z = r ee^(i theta): quad r^3 ee^(i 3 theta) = 8 ee^(i(-pi / 2 + 2 pi k)), quad k in ZZ
  $
  $
    ==> cases(r^3 = 8, 3 theta = -pi / 2 + 2 pi k)
    <==> cases(r = 2, theta = -pi / 6 + (2 pi) / 3 k","quad k in ZZ)
  $
  Nu svarar inte längre olika värden för $k$ mot hela varv. Vi får olika värden för olika $k$.

  *Steg 3:* Beräkna de olika lösningarna.
  $ z = 2 ee^(i(-pi / 6 + (2 pi) / 3 k)), quad k in ZZ $
  $
    k = 0: & quad z_1 = 2 ee^(-i pi / 6) \
    k = 1: & quad z_2 = dots = 2 ee^(i pi / 2) \
    k = 2: & quad z_3 = dots = 2 ee^(i (7 pi) / 6)
  $

  *Steg 4:* Skriv rötterna på formen $a + i b$ och rita ut dem.
  $
    z_1 &= dots = sqrt(3) - i \
    z_2 &= dots = 2i \
    z_3 &= dots = -sqrt(3) - i
  $
  #figur({
    import cetz.draw: *
    rutnat(x: (-2.6, 2.6), y: (-2.6, 2.6), rutor: false, xetikett: $"Re"$, yetikett: $"Im"$)
    circle((0, 0), radius: 2, stroke: (paint: hjalp, thickness: 0.8pt, dash: "dashed"))
    let z1 = (calc.sqrt(3), -1)
    let z2 = (0, 2)
    let z3 = (-calc.sqrt(3), -1)
    hjalplinje((0, 0), z1)
    hjalplinje((0, 0), z3)
    punkt(z1, farg: objekt1, etikett: $z_1$, anchor: "north-west", radie: 0.08)
    punkt(z2, farg: objekt1, etikett: $z_2$, anchor: "south-west", radie: 0.08)
    punkt(z3, farg: objekt1, etikett: $z_3$, anchor: "north-east", radie: 0.08)
  })
]

= Andragradsekvationer

#definition[
  Ett (komplext) *polynom* är en funktion:
  $ p(z) = a_n z^n + a_(n - 1) z^(n - 1) + dots + a_1 z + a_0 $
  där $a_0, dots, a_n in CC$, $n in NN$. Om $a_n != 0$ sägs $p$ ha *grad* $n$.
]

För allmänna $n$:te-gradsekvationer har vi:

#sats[Algebrans fundamentalsats][
  Varje komplex polynomekvation $p(z) = 0$ där $"grad" p >= 1$ har minst en komplex rot.
]

Då faktorsatsen och polynomdivision gäller även för komplexa polynom ger detta:

#foljdsats[
  Varje polynom $p(z) = a_n z^n + dots + a_1 z + a_0$ där $a_0, dots, a_n in CC$, $a_n != 0$, kan delas upp i förstagradsfaktorer som:
  $ p(z) = a_n (z - z_1)(z - z_2) dot dots dot (z - z_n) $
  där $z_1, dots, z_n$ är nollställena till $p(z)$ och varje rot räknas så många gånger som multipliciteten anger (dvs. att t.ex. en dubbelrot räknas 2 gånger).
]

Lösning av komplexa andragradsekvationer skiljer sig från reella.

#exempel[
  Lös ekvationen
  $ z^2 - (1 + i) z + 2 + 2i = 0. $
]
#losning[
  #ihop[Kvadratkomplettera:]
  $
    z^2 - 2 (1 + i) / 2 z + 2 + 2i = z^2 - 2 (1 + i) / 2 z + ((1 + i) / 2)^2 - ((1 + i) / 2)^2 + 2 + 2i = 0
  $
  $
    <==> (z - (1 + i) / 2)^2 = (1 + i)^2 / 4 - 2 - 2i
  $
  #ihop[där]
  $
    (1 + i)^2 / 4 - 2 - 2i = (1 + 2i + i^2) / 4 - 2 - 2i = i / 2 - 2 - (4i) / 2 = -2 - (3i) / 2
  $
  $
    <==> (z - (1 + i) / 2)^2 = -2 - (3i) / 2 quad arrow.l "dra" #emph[inte] "roten ur!"
  $
  Låt $w = z - (1 + i) / 2$. Då är
  $ w^2 = -2 - 3 / 2 i. quad (*) $

  Två metoder:
  #set enum(numbering: fnum("I.", gron))
  + Binomisk ekvation som tidigare.
  + "Rektangulär form", dvs. antag att $w = u + i v$, där $u, v in RR$ $==> w^2 = u^2 - v^2 + i dot 2 u v$.

  #ihop[Då är]
  $
    (*) <==> u^2 - v^2 + i 2 u v = -2 - 3 / 2 i
    <==> cases(
      "I" & quad u^2 - v^2 = -2,
      "II" & quad 2 u v = -3 / 2,
      "III" & quad u^2 + v^2 = 5 / 2,
    )
  $
  $
    "I" + "III" ==> 2 u^2 = -2 + 5 / 2 <==> u^2 = 1 / 4 <==> u = plus.minus 1 / 2
  $
  #ihop[II:]
  $
    2 dot 1 / 2 v = -3 / 2 & ==> (u_1, v_1) = (1 / 2, -3 / 2) \
    2 dot (-1 / 2) v = -3 / 2 & ==> (u_2, v_2) = (-1 / 2, 3 / 2)
  $
  #ihop[Detta ger:]
  $
    1 / 2 - 3 / 2 i &= w_1 = z_1 - 1 / 2 - 1 / 2 i \
    -1 / 2 + (3i) / 2 &= w_2 = z_2 - 1 / 2 - 1 / 2 i
  $
  $ therefore z_1 = 1 - i, quad z_2 = 2i $
]

#exempel[
  Faktorisera polynomet
  $ p(z) = z^4 - 2z^3 + 3z^2 - 2z + 2. $
  _Ledning:_ $p(z)$ har (minst) ett rent imaginärt nollställe.
]
#losning[
  $z = a i$, $a in RR$, löser $p(z) = 0$
  $
    ==> p(a i) &= (a i)^4 - 2(a i)^3 + 3(a i)^2 - 2(a i) + 2 \
    &= a^4 + 2a^3 i - 3a^2 - 2a i + 2 = (a^4 - 3a^2 + 2) + i(2a^3 - 2a) attach(=, t: "vill") 0
  $
  $
    ==> cases(a^4 - 3a^2 + 2 = 0, 2a(a^2 - 1) = 0 ==> a_1 = 0"," thin a_2 = 1"," thin a_3 = -1)
  $
  $a_1 = 0$: $2 = 0 quad lightning$ \
  $a = plus.minus 1$: $1 - 3 + 2 = 0$ ok!

  $therefore z_1 = i$, $z_2 = -i$ är nollställen till $p(z)$
  $
    &==> (z - i) "och" (z + i) "är faktorer i" p(z) \
    &==> (z - i)(z + i) = z^2 - i^2 = z^2 + 1 "är en faktor i" p(z)
  $
  #ihop[Polynomdivision ger]
  $ p(z) = (z^2 + 1)(z^2 - 2z + 2) $
  $ z^2 - 2z + 2 = 0 ==> z = 1 plus.minus sqrt(1 - 2) = 1 plus.minus i $
  $ therefore p(z) = (z - i)(z + i)(z - (1 + i))(z - (1 - i)) $
]

I föregående exempel är $z_2 = overline(z_1)$ och $z_4 = overline(z_3)$. Detta är ingen slump.

#sats[
  Låt $p(z) = a_n z^n + dots + a_1 z + a_0$ vara ett komplext polynom med _reella_ koefficienter (dvs. $a_n, dots, a_0 in RR$). Om $w in CC$, $Im(w) != 0$, är en rot till $p(z)$, så är även $overline(w)$ en rot till $p(z)$.
]

#bevis[Övning (P-B, s. 465).]

#exempel[
  Polynomet
  $ p(z) = z^4 - 6z^3 + 17z^2 - 26z + 20 $
  har roten $z = 1 - i sqrt(3)$. Bestäm övriga rötter.
]
#losning[
  $p(z)$ har endast reella koefficienter
  $
    &==> overline(z) = 1 + i sqrt(3) "också rot till" p(z) \
    &==> (z - (1 + i sqrt(3))) "och" (z - (1 - i sqrt(3))) "är faktorer i" p(z) \
    &==> (z - (1 - i sqrt(3)))(z - (1 + i sqrt(3))) = dots = z^2 - 2z + 4 "är en faktor i" p(z)
  $
  #ihop[Polynomdivision ger: …]
  $ p(z) = (z^2 - 2z + 4)(z^2 - 4z + 5) $
  $ z^2 - 4z + 5 = 0 ==> z = 2 plus.minus sqrt(4 - 5) = 2 plus.minus i $
  $
    therefore z_1 = 1 - i sqrt(3), quad z_2 = 1 + i sqrt(3), quad z_3 = 2 + i, quad z_4 = 2 - i
  $
]
