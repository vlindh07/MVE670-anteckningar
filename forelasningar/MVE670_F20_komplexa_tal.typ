// =====================================================================
//  MVE670 Linjär algebra – Föreläsning 20 (1 oktober 2026)
//  Tas in i main.typ med #include "forelasningar/MVE670_F20_komplexa_tal.typ"
// =====================================================================
#import "../anteckningar-3b1b.typ": *
#nyforelasning(20, [Komplexa tal], [1 oktober 2026])

= Komplexa tal

#definition[
  Ett *komplext tal*, $z$, är av formen
  $ z = x + i y quad "där" quad x, y in RR, quad i^2 = -1. $
  $x = Re(z)$ kallas *realdelen* av $z$, \
  $y = Im(z)$ kallas *imaginärdelen* av $z$. \
  Mängden av alla komplexa tal betecknas $CC$.
]

När vi inför nya saker (t.ex. talsystem) ska vi fråga oss:
+ Är detta talsystem logiskt konsekvent, dvs. fritt från motsägelser?
+ Vilka egenskaper har dessa nya tal?
+ Är de användbara i några tillämpningar?
*INTE* "Vad betyder egentligen $sqrt(-1)$?"

Vi väntar lite med 1. och börjar med 2. Vi har operationerna:
- _Likhet:_ $x + i y = u + i v <==> x = u quad "&" quad y = v$.
- _Addition:_ $(x + i y) + (u + i v) = (x + u) + i(y + v)$.
- _Multiplikation med $lambda in RR$:_ $lambda(x + i y) = lambda x + i lambda y$.
- _Multiplikation:_ $(x + i y)(u + i v) = (x u - y v) + i(y u + x v)$.

=== Räkneregler

Addition och multiplikation är kommutativa, associativa, distributiva, … Helt enkelt "räkna på som vanligt", men kom ihåg att $i^2 = -1$.

#definition[
  #set enum(numbering: fnum("(i)", bla))
  + *Konjugatet*, $overline(z)$, till $z = x + i y$ definieras som $overline(z) = x - i y$.
  + *Absolutbeloppet*, $abs(z)$, av $z = x + i y$ definieras som
    $ abs(z) = sqrt(x^2 + y^2) = sqrt(Re(z)^2 + Im(z)^2). $
]

#varning[$y^2$, inte $(i y)^2$.]

#anmarkning[
  #set enum(numbering: fnum("(i)", gra))
  + $overline(z) = z <==> z in RR$, dvs. $Im(z) = y = 0$.
  + $z overline(z) = (x + i y)(x - i y) = x^2 - (i y)^2 = x^2 + y^2 = abs(z)^2$. \
    Speciellt: $z overline(z) in RR$.
]

#sats[
  $overline(z + w) = overline(z) + overline(w), quad overline(z w) = overline(z) dot overline(w)$
]

#definition[Division][
  Låt $z = x + i y$. Talet $1 / z$ definieras som:
  $ 1 / z = 1 / (z overline(z)) dot overline(z) = 1 / abs(z)^2 overline(z), $
  vilket medför att division definieras som $display(w / z = (w overline(z)) / abs(z)^2)$. Om $w = u + i v$ får vi alltså att:
  $
    w / z = ((u + i v)(x - i y)) / (x^2 + y^2) = (x u + y v) / (x^2 + y^2) + i dot (x v - y u) / (x^2 + y^2)
  $
]

#exempel[
  $
    (1 + 2i) / (3 + 4i) = ((3 - 4i)(1 + 2i)) / ((3 - 4i)(3 + 4i)) = dots = 11 / 25 + i 2 / 25
  $
]

= Tillbaka till 1!

Komplexa tal betraktades från början (1500–1600-talet) med skepsis då de inte ansågs uppfylla 1. Vi har t.ex.
$ -1 = (sqrt(-1))^2 = sqrt(-1) dot sqrt(-1) = sqrt(-1 dot (-1)) = sqrt(1) = 1 quad lightning $

I slutet av 1700-talet/början av 1800-talet blev komplexa tal mer accepterade då man visade att det går att definiera dem utan att använda $i^2 = -1$. Nämligen, i stället för att tänka på $z in CC$ som $z = x + i y$, tänk $z = (x, y) in RR^2$, som uppfyller:

+ _Likhet:_ $(x, y) = (u, v) <==> x = u quad "&" quad y = v$
+ _Addition:_ $(x, y) + (u, v) = (x + u, y + v)$
+ _Multiplikation:_ $(x, y) dot (u, v) = (x u - y v, y u + x v)$
+ _Division:_ $display(((u, v)) / ((x, y)) = ((x u + y v) / (x^2 + y^2), (x v - y u) / (x^2 + y^2)))$

#ihop[Identifikationen $z = x + i y <==> (x, y) in RR^2$ ger oss en geometrisk tolkning av $z + w$, $overline(z)$ och $abs(z)$:]

#figur({
  import cetz.draw: *
  let axlar(x0, x1, y0, y1) = {
    let pil = (end: "stealth", fill: ljusgra, scale: 0.7)
    line((x0, 0), (x1, 0), stroke: 0.9pt + ljusgra, mark: pil)
    line((0, y0), (0, y1), stroke: 0.9pt + ljusgra, mark: pil)
    content((x1 + 0.1, 0), text(fill: ljusgra, $"Re"$), anchor: "west")
    content((0, y1 + 0.1), text(fill: ljusgra, $"Im"$), anchor: "south")
  }
  // z + w
  let z = (1.6, 0.5)
  let w = (0.35, 1.4)
  axlar(-0.2, 2.4, -0.2, 2.2)
  hjalplinje(z, cetz.vector.add(z, w))
  hjalplinje(w, cetz.vector.add(z, w))
  vektor((0, 0), z, objekt1, etikett: $z$)
  vektor((0, 0), w, objekt2, etikett: $w$)
  vektor((0, 0), cetz.vector.add(z, w), harlett, etikett: $z + w$)
  // konjugat
  group({
    translate((4.2, 0))
    axlar(-0.2, 2.4, -1.3, 1.6)
    let p = (1.5, 0.9)
    hjalplinje(p, (p.at(0), -p.at(1)))
    vektor((0, 0), p, objekt1, etikett: $z = x + i y$, vid: cetz.vector.add(p, (0.1, 0.05)), anchor: "south-west")
    vektor((0, 0), (p.at(0), -p.at(1)), harlett, etikett: $overline(z) = x - i y$,
      vid: (p.at(0) + 0.1, -p.at(1) - 0.05), anchor: "north-west")
  })
  // absolutbelopp
  group({
    translate((8.6, 0))
    axlar(-0.2, 2.2, -0.2, 1.6)
    let p = (1.5, 1.1)
    hjalplinje(p, (p.at(0), 0))
    hjalplinje(p, (0, p.at(1)))
    vektor((0, 0), p, objekt1, etikett: $z = x + i y$, vid: cetz.vector.add(p, (0.1, 0.05)), anchor: "south-west")
    etikett((0.62, 0.62), $abs(z)$, farg: objekt1, anchor: "south-east")
  })
})

= Polära koordinater

För att få en motsvarande geometrisk tolkning av multiplikation och division behöver vi polära koordinater.

#definition[
  Då $CC arrow.r.hook RR^2$ kan ett komplext tal/en punkt i $RR^2$ uttryckas på två sätt:
  #set enum(numbering: fnum("1.", bla))
  + $z = x + i y$ som vanligt (rätvinkliga koordinater).
  + Genom att ange avståndet från origo, $abs(z)$, och vinkeln moturs till positiva Re-axeln, $theta = arg(z)$ (*argumentet* till $z$).
  $(r, theta)$ kallas för *polära koordinater*.
]

#figur({
  import cetz.draw: *
  rutnat(x: (0, 2.2), y: (0, 1.6), rutor: false, xetikett: $"Re"$, yetikett: $"Im"$)
  let p = flytta((0, 0), 1.9, 38deg)
  vinkel((0, 0), (1, 0), p, etikett: $theta$, radie: 0.55)
  vektor((0, 0), p, objekt1, etikett: $z$)
  etikett(flytta((0, 0), 1.1, 38deg), $r$, farg: objekt1, anchor: "south-east")
})

#varning[
  $theta$ är ej entydigt bestämd: $(r, theta)$ och $(r, theta + 2 pi n)$, där $n in ZZ$, är polära koordinater till samma punkt!
]

#ihop[Hur översätter vi mellan 1 och 2?]

*2 $==>$ 1:* Om $(r, theta)$ är givna så är
$ cases(x = r cos theta, y = r sin theta) $

*1 $==>$ 2:* Om $(x, y)$ är givna så är
$ r = sqrt(x^2 + y^2) = abs(z). $
Från
$
  y / x = (r sin(theta)) / (r cos(theta)) = tan(theta) ==> theta = arctan(y / x) + n pi, quad n in ZZ.
$

#exempel[
  Bestäm de polära koordinaterna till punkten $(-sqrt(3), 1)$.
]
#losning[
  $ r = abs(z) = sqrt((-sqrt(3))^2 + 1^2) = sqrt(4) = 2 $
  $
    theta = arctan(1 / (-sqrt(3))) + n pi = -arctan(1 / sqrt(3)) + n pi = -pi / 6 + n pi, quad n in ZZ
  $
]

Oftast brukar vi välja $n = 0$ om $x > 0$ och $n = 1$ om $x < 0$, dvs.
$
  theta = cases(arctan(y / x) & "om" x > 0, pi + arctan(y / x) quad & "om" x < 0)
$
(så $theta = (5 pi) / 6$ i föregående exempel).

#definition[
  $z in CC$ är på *polär form* om $z = r cos(theta) + i r sin(theta)$.
]

#ihop[Låt nu $z = abs(z)(cos(theta) + i sin(theta))$ och $w = abs(w)(cos(phi) + i sin(phi))$. Då är]
$
  z w &= abs(z) abs(w) (cos theta + i sin theta)(cos phi + i sin phi) \
  &= abs(z) abs(w) (cos theta cos phi - sin theta sin phi + i(sin theta cos phi + cos theta sin phi)) \
  &= abs(z) abs(w) (cos(theta + phi) + i sin(theta + phi))
$

#ihop[På samma sätt kan vi visa:]
$ z / w = abs(z) / abs(w) (cos(theta - phi) + i sin(theta - phi)) $

#ihop[Vi ser att:]
#[
  #set enum(numbering: "I.")
  + $abs(z w) = abs(z) abs(w), quad arg(z w) = arg(z) + arg(w)$
  + $display(abs(z / w) = abs(z) / abs(w)), quad display(arg(z / w) = arg(z) - arg(w))$
]

#figur(langd: 1.5cm, {
  import cetz.draw: *
  let th = 40deg
  let ph = 70deg
  let z = flytta((0, 0), 1.4, th)
  let w = flytta((0, 0), 1.6, ph)
  let zw = flytta((0, 0), 1.4 * 1.6, th + ph)
  let zdw = flytta((0, 0), 1.4 / 1.6, th - ph)
  rutnat(x: (-1.4, 2.4), y: (-1.0, 2.4), rutor: false, xetikett: $"Re"$, yetikett: $"Im"$)
  vinkel((0, 0), (1, 0), z, radie: 0.75)
  vinkel((0, 0), (1, 0), w, radie: 0.42)
  vinkel((0, 0), (1, 0), zw, radie: 1.8, farg: harlett)
  vinkel((0, 0), zdw, (1, 0), radie: 0.55, farg: harlett)
  // Vinkeletiketter placerade för hand (bisektrisen skär vektorerna)
  etikett(flytta((0, 0), 0.95, 18deg), $theta$)
  etikett(flytta((0, 0), 0.6, 57deg), $phi$)
  etikett(flytta((0, 0), 1.9, 22deg), $theta + phi$, farg: harlett, anchor: "west")
  etikett(flytta((0, 0), 0.75, -16deg), $theta - phi$, farg: harlett, anchor: "west")
  vektor((0, 0), z, objekt1, etikett: $z$)
  vektor((0, 0), w, objekt2, etikett: $w$)
  vektor((0, 0), zw, harlett, etikett: $z w$)
  vektor((0, 0), zdw, harlett, etikett: $z / w$)
})

= de Moivres formel

#ihop[Antag $z in CC$ sådant att $abs(z) = 1$, dvs. $z = cos theta + i sin theta$. Då är]
$
  (cos theta + i sin theta)^2 &= z^2 = z dot z = cos(2 theta) + i sin(2 theta) \
  (cos theta + i sin theta)^3 &= z^3 = z^2 dot z = cos(3 theta) + i sin(3 theta) \
  &dots.v \
  (cos theta + i sin theta)^n &= cos(n theta) + i sin(n theta)
$

Inte svårt att visa att detta gäller även för $n = 0$ och $n$ negativt heltal. Detta är känt som:

#sats[de Moivres formel][
  $ (cos theta + i sin theta)^n = cos(n theta) + i sin(n theta), quad n in ZZ $
]

#ihop[de Moivres formel kan verka mirakulös, men detta mirakel bleknar i jämförelse med:]
$ ee^(i theta) = cos theta + i sin theta $
