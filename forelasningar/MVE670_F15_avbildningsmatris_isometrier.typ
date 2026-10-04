// =====================================================================
//  MVE670 Linjär algebra – Föreläsning 15 (25 september 2026)
//  Tas in i main.typ med #include "forelasningar/MVE670_F15_avbildningsmatris_isometrier.typ"
// =====================================================================
#import "../anteckningar-3b1b.typ": *
#nyforelasning(15, [Linjära avbildningar (forts.)], [25 september 2026])

= Avbildningsmatrisen

#sats[
  En avbildning $f : RR^n -> RR^m$ är linjär om och endast om den är av formen
  $ f(vb(x)) = A vb(x) $
  för någon $m times n$-matris $A$.
]

#bevis[
  ($==>$) Antag att $f$ är linjär. Då är
  $
    f(vb(x)) & = f(x_1 vb(e)_1 + x_2 vb(e)_2 + dots + x_n vb(e)_n)
    limits(=)^(f "linjär") x_1 underbrace(f(vb(e)_1), m times 1) + x_2 underbrace(f(vb(e)_2), m times 1)
    + dots + x_n underbrace(f(vb(e)_n), m times 1) \
    & = underbrace(mat(bar.v, bar.v, , bar.v; f(vb(e)_1), f(vb(e)_2), dots, f(vb(e)_n); bar.v, bar.v, , bar.v), A "av typ" m times n)
    vec(x_1, x_2, dots.v, x_n) = A vb(x).
  $

  ($<==$) Antag att $f(vb(x)) = A vb(x)$ där $A$ är av typ $m times n$. Då är $f : RR^n -> RR^m$. Dessutom gäller för alla $vb(u)_1, vb(u)_2 in RR^n$ och $lambda_1, lambda_2 in RR$ att
  $
    f(lambda_1 vb(u)_1 + lambda_2 vb(u)_2) = A(lambda_1 vb(u)_1 + lambda_2 vb(u)_2)
    = lambda_1 A vb(u)_1 + lambda_2 A vb(u)_2 = lambda_1 f(vb(u)_1) + lambda_2 f(vb(u)_2),
  $
  så $f$ är linjär.
]

Matrisen $A$ kallas för $f$:s *(avbildnings)matris*. Man skriver ibland $f = f_A$.

= Exempel på linjära avbildningar

Det finns väldigt många linjära avbildningar.

== Ortogonal projektion på linje genom origo

*(i)* Ortogonal projektion av en punkt på en linje genom origo är en linjär avbildning, dvs. $f : RR^3 -> RR^3$ sådan att $f(arrow(O P)) = arrow(O P')$.

#figur({
  import cetz.draw: *
  let O = (0, 0)
  let r = 30deg
  let P = (1.0, 2.2)
  let t = P.at(0) * calc.cos(r) + P.at(1) * calc.sin(r)
  let Pp = flytta(O, t, r)
  line(flytta(O, -0.6, r), flytta(O, 3.6, r), stroke: 0.8pt + ljusgra)
  etikett(flytta(O, 3.85, r), $L$)
  hjalplinje(P, Pp)
  vektor(O, P, objekt1, etikett: $arrow(O P)$, vid: (0.35, 1.25), anchor: "east")
  vektor(O, Pp, harlett, etikett: $P'$, vid: cetz.vector.add(Pp, (0.1, -0.1)), anchor: "north-west")
  vektor(O, flytta(O, 0.8, r), objekt2, etikett: $vb(v)$, vid: (0.75, 0.25), anchor: "north-west")
  punkt(O, etikett: $O$, anchor: "north-east")
  etikett(P, $P$, anchor: "south")
})

#ihop[Vi har att]
$ f(arrow(O P)) = arrow(O P)_(vb(v)) = (arrow(O P) dot vb(v)) / abs(vb(v))^2 vb(v). $
#ihop[Om $arrow(O P) = vb(u)$ så är $f(vb(u)) = display((vb(u) dot vb(v)) / abs(vb(v))^2) vb(v)$. Låt oss kolla linjäriteten:]
$
  f(lambda_1 vb(u)_1 + lambda_2 vb(u)_2) = ((lambda_1 vb(u)_1 + lambda_2 vb(u)_2) dot vb(v)) / abs(vb(v))^2 vb(v)
  = lambda_1 (vb(u)_1 dot vb(v)) / abs(vb(v))^2 vb(v) + lambda_2 (vb(u)_2 dot vb(v)) / abs(vb(v))^2 vb(v)
  = lambda_1 f(vb(u)_1) + lambda_2 f(vb(u)_2)
$
för alla $vb(u)_1, vb(u)_2 in RR^3$ och alla $lambda_1, lambda_2 in RR$.

#anmarkning[
  Om $L$ inte går genom origo så är den ortogonala projektionen _inte_ linjär, eftersom $f(vb(0)) != vb(0)$. Man får då en så kallad *affin avbildning*, dvs. en funktion av formen
  $ f(vb(u)) = A vb(u) + vb(b) quad ("linjär" + "konstant"). $
]

== Ortogonal projektion på plan genom origo

*(ii)* Ortogonal projektion på ett plan genom origo är en linjär avbildning, dvs. $f : RR^3 -> RR^3$ sådan att $f(arrow(O P)) = arrow(O P')$ är linjär. Det visas på samma sätt som i (i).

#figur({
  import cetz.draw: *
  let O = (0, 0)
  let Pp = (1.3, 0.35)
  let nr = (-0.3, 0.95)
  let P = cetz.vector.add(Pp, cetz.vector.scale(nr, 2.3))
  yta((-1.3, -0.5), (1.6, -0.5), (2.6, 0.9), (-0.3, 0.9), farg: objekt3, kant: true)
  etikett((2.45, 0.35), $pi$, farg: objekt3)
  hjalplinje(P, Pp)
  vektor(O, P, objekt1)
  vektor(O, Pp, harlett, etikett: $P'$, vid: cetz.vector.add(Pp, (0.12, 0.05)), anchor: "west")
  vektor(O, cetz.vector.scale(nr, 0.85), objekt2, etikett: $vb(n)$, vid: (-0.3, 0.85), anchor: "east")
  punkt(O, etikett: $O$, anchor: "north")
  etikett(P, $P$, anchor: "south")
})

#exempel[
  Bestäm avbildningsmatrisen för ortogonal projektion på planet
  $ pi: thick x + 2 y + z = 0. $
]
#losning[
  $pi: x + 2 y + z = 0 ==> vb(n) = (1, 2, 1)$, så $abs(vb(n))^2 = 6$. Vi har att
  $
    f(arrow(O P)) = arrow(O P') = arrow(O P) - arrow(O P)_(vb(n))
    = arrow(O P) - (arrow(O P) dot vb(n)) / abs(vb(n))^2 vb(n),
    quad "dvs." quad f(vb(u)) = vb(u) - (vb(u) dot vb(n)) / abs(vb(n))^2 vb(n).
  $
  #ihop[Bilderna av basvektorerna blir]
  $
    f(vb(e)_1) & = f vec(1, 0, 0) = vec(1, 0, 0) - 1/6 vec(1, 2, 1) = 1/6 vec(5, -2, -1), \
    f(vb(e)_2) & = 1/6 vec(-2, 2, -2), quad f(vb(e)_3) = 1/6 vec(-1, -2, 5).
  $
  #ihop[Alltså är]
  $
    A = (f(vb(e)_1) quad f(vb(e)_2) quad f(vb(e)_3)) = 1/6 mat(5, -2, -1; -2, 2, -2; -1, -2, 5).
  $
]

#pagebreak()
== Speglingar

*(iii)* Spegling i en linje genom origo är en linjär avbildning.

#exempel[
  Låt $f : RR^2 -> RR^2$ vara speglingen i linjen $L: t(1, 1)$, $t in RR$.
]
#losning[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 8mm,
    align: horizon,
    cetz.canvas(length: 1cm, {
      rutnat(x: (-1.4, 1.4), y: (-1.4, 1.4), rutor: false, xetikett: none, yetikett: none)
      import cetz.draw: *
      line((-1.3, -1.3), (1.4, 1.4), stroke: 1pt + objekt1)
      etikett((1.4, 1.4), $L$, farg: objekt1, anchor: "south-west")
      vektor((0, 0), (1, 0), basx, etikett: $vb(e)_1$, vid: (1, -0.12), anchor: "north")
      vektor((0, 0), (0, 1), basy, etikett: $vb(e)_2$, vid: (-0.12, 1), anchor: "east")
    }),
    [
      Då gäller att
      $ f(vb(e)_1) = vb(e)_2, quad f(vb(e)_2) = vb(e)_1. $
      Alltså har $f$ avbildningsmatrisen
      $ A = mat(0, 1; 1, 0). $
    ],
  )
]

*(iv)* Spegling i ett plan genom origo är en linjär avbildning.

== Rotationer

*(v)* Rotationer är linjära avbildningar, dvs. $f : RR^2 -> RR^2$ sådan att $f(vb(x)) = vb(x)$ roterad moturs $theta$ radianer är en linjär avbildning.

Det är intuitivt klart att detta är linjärt. Vad blir avbildningsmatrisen?

#figur({
  import cetz.draw: *
  let R = 1.5
  let th = 35deg
  rutnat(x: (-2, 2), y: (-2, 2), rutor: false)
  circle((0, 0), radius: R, stroke: (paint: hjalp, thickness: 0.7pt, dash: "dashed"))
  vektor((0, 0), (R, 0), basx, etikett: $vb(e)_1$, vid: (R + 0.1, -0.12), anchor: "north-west", streckad: true, tjocklek: 1.1pt)
  vektor((0, 0), (0, R), basy, etikett: $vb(e)_2$, vid: (0.1, R + 0.1), anchor: "south-west", streckad: true, tjocklek: 1.1pt)
  vektor((0, 0), flytta((0, 0), R, th), basx, etikett: $f(vb(e)_1)$)
  vektor((0, 0), flytta((0, 0), R, 90deg + th), basy, etikett: $f(vb(e)_2)$)
  vinkel((0, 0), (1, 0), flytta((0, 0), 1, th), etikett: $theta$, radie: 0.6)
  vinkel((0, 0), (0, 1), flytta((0, 0), 1, 90deg + th), etikett: $theta$, radie: 0.6)
})

#ihop[Kolonnerna är bilderna av basvektorerna:]
$ A = (f(vb(e)_1) quad f(vb(e)_2)) = mat(cos theta, -sin theta; sin theta, cos theta). $

= Egenskaper via avbildningsmatrisen

Det som bland annat gör linjära avbildningar lätta att hantera är att egenskaper hos $f : RR^n -> RR^m$ som vi är intresserade av att undersöka (svåra i allmänhet) kan "göras om" till egenskaper hos $f$:s avbildningsmatris $A$ (entydigt). Vi har till exempel följande välkända egenskaper från analysen, där $A = (vb(a)_1 quad dots quad vb(a)_n)$:

#align(center, table(
  columns: (13em, 1fr),
  align: left,
  [$f : RR^n -> RR^m$], [$A = (vb(a)_1 quad dots quad vb(a)_n)$],
  [$f$ *injektiv*, dvs. för varje $vb(b) in RR^m$ finns högst ett $vb(x) in RR^n$ s.a. $f(vb(x)) = vb(b)$],
  [
    $A vb(x) = vb(b)$ har högst en lösning \
    $<==> A vb(x) = vb(0)$ har endast lösningen $vb(x) = vb(0)$ \
    $<==> "Noll"(A) = {vb(0)} <==> "nolldim"(A) = 0 <==> A$ har en vänsterinvers \
    $<==> vb(a)_1, dots, vb(a)_n$ linjärt oberoende $==> n <= m$
  ],
  [$f$ *surjektiv*, dvs. för varje $vb(b) in RR^m$ finns minst ett $vb(x) in RR^n$ s.a. $f(vb(x)) = vb(b)$],
  [
    $A vb(x) = vb(b)$ lösbar för alla $vb(b) in RR^m$ \
    $<==> "Kolonn"(A) = RR^m <==> "rang"(A) = m$ \
    $<==> A$ har en högerinvers \
    $<==> "Span"(vb(a)_1, dots, vb(a)_n) = RR^m ==> n >= m$
  ],
  [$f$ *bijektiv* (eller inverterbar), dvs. för varje $vb(b) in RR^m$ finns exakt ett $vb(x) in RR^n$ s.a. $f(vb(x)) = vb(b)$],
  [
    $A vb(x) = vb(b)$ har _exakt en_ lösning för alla $vb(b) in RR^m$ \
    $<==> A$ inverterbar matris $<==> dots$ \
    $<==> vb(a)_1, dots, vb(a)_n$ bas för $RR^n$; speciellt $n = m$
  ],
))

= Isometrier och ortogonala matriser

#definition[
  #set enum(numbering: fnum("(i)", bla))
  + En linjär avbildning $f : RR^n -> RR^m$ sägs vara en *isometri* om $abs(f(vb(x))) = abs(vb(x))$ för alla $vb(x) in RR^n$.
  + En $n times n$-matris $A = (vb(a)_1 quad dots quad vb(a)_n)$ sägs vara *ortogonal* om $vb(a)_1, dots, vb(a)_n$ är en ON-bas för $RR^n$.
]

#sats[
  $ A "ortogonal" <==> A^T A = I <==> A^(-1) = A^T. $
]

#sats[
  Låt $f : RR^n -> RR^n$ vara linjär med $f(vb(x)) = A vb(x)$. Då gäller
  $ f "isometri" <==> A "ortogonal". $
]

Vi har att $A$ ortogonal $==> A$ inverterbar, så en isometri $f_A$ är alltid inverterbar.

#exempel[
  Låt $f : RR^2 -> RR^2$ vara rotation $theta$ radianer moturs. Vi vet att
  $ f(vb(x)) = mat(cos theta, -sin theta; sin theta, cos theta) vb(x) = A vb(x). $
]
#losning[
  Det är intuitivt klart att detta är en isometri, så då måste $A^T A = I$, dvs. $A^(-1) = A^T$. Mycket riktigt:
  $
    A^T A = mat(cos theta, sin theta; -sin theta, cos theta) mat(cos theta, -sin theta; sin theta, cos theta)
    = mat(1, 0; 0, 1).
  $
  #ihop[Alltså är]
  $ A^(-1) = A^T = mat(cos theta, sin theta; -sin theta, cos theta). $
]

#anmarkning[
  *Övning:* Undersök för (i)–(iv) ovan om $f$ är injektiv, surjektiv, bijektiv respektive en isometri.
]
