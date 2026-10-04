// =====================================================================
//  MVE670 Linjär algebra – Föreläsning 14 (23 september 2026)
//  Tas in i main.typ med #include "forelasningar/MVE670_F14_minsta_kvadrat_linjara_avbildningar.typ"
// =====================================================================
#import "../anteckningar-3b1b.typ": *
#nyforelasning(14, [Minsta kvadratmetoden och linjära avbildningar], [23 september 2026])

= Minsta kvadratmetoden

Överbestämda linjära ekvationssystem (fler ekvationer än obekanta) saknar nästan alltid lösning, men dyker ofta upp i tillämpningar.

#exempel[
  Antag att vi utför något experiment i någon labb och får följande mätdata:
  #align(center, table(columns: 6, $x$, $1$, $2$, $3$, $4$, $5$, $y$, $3$, $5$, $8$, $10$, $13$))
  Antag vidare att vi vet att $y = k x + m$, och att poängen med labben är att vi ska använda vår mätdata för att bestämma $k$ och $m$.
]

#grid(
  columns: (1fr, 1.4fr),
  align: horizon,
  $
    cases(
      k + m = 3,
      2 k + m = 5,
      3 k + m = 8,
      4 k + m = 10,
      5 k + m = 13,
    )
  $,
  graf(
    width: 6.5cm,
    height: 4.6cm,
    xlim: (0, 5.8),
    ylim: (0, 14.5),
    xaxis: (ticks: (1, 2, 3, 4, 5)),
    yaxis: (ticks: (3, 5, 8, 10, 13)),
    xlabel: $x$,
    ylabel: $y$,
    lq.plot((1, 2, 3, 4, 5), (3, 5, 8, 10, 13), stroke: none, color: textfarg, mark-size: 4pt),
  ),
)

Det är uppenbart att det inte finns någon exakt lösning på detta linjära ekvationssystem $A vb(x) = vb(b)$.

#definition[Minsta kvadratmetoden][
  *Minsta kvadratmetoden* går ut på att hitta det $vb(x)$ som minimerar $abs(A vb(x) - vb(b))$.
]

*Strategi:* Studera fallet 3 ekvationer, 2 obekanta och lös genom resonerande. Visa sedan att lösningen gäller i allmänhet.

#ihop[Antag att $A$ är av typ $3 times 2$, $vb(b) in RR^3$ och $vb(x) in RR^2$, så att $A vb(x) = vb(b)$ är ett överbestämt linjärt ekvationssystem. Då gäller]
$ A vb(x) in "kolonn"(A) = "Span"(vb(a)_1, vb(a)_2), $
som är ett plan i $RR^3$ genom origo, och därmed $A vb(x) - vb(b) in RR^3$.

#figur(langd: 1.1cm, {
  import cetz.draw: *
  let O = (0, 0)
  let Ax = (3.2, 0.35)
  let Axh = (1.9, 0.8)
  let b = (1.9, 3.3)
  // Planet kolonn(A)
  yta((-0.5, -0.3), (3.8, 0.1), (4.8, 1.9), (0.5, 1.5), farg: objekt3, kant: true)
  etikett((4.9, 1.2), $"kolonn"(A)$, farg: objekt3, anchor: "west")
  // Rät vinkel vid A x̂
  let s = 0.2
  line((Axh.at(0), Axh.at(1) + s), (Axh.at(0) + s, Axh.at(1) + s + 0.08), (Axh.at(0) + s, Axh.at(1) + 0.08),
    stroke: 0.7pt + harlett)
  hjalplinje(b, Ax)
  etikett((2.65, 2.1), $A vb(x) - vb(b)$, farg: hjalp, anchor: "west")
  vektor(O, b, objekt1, etikett: $vb(b)$)
  vektor(O, Ax, objekt2, etikett: $A vb(x)$, vid: (3.25, 0.12), anchor: "north-west")
  vektor(O, Axh, harlett, etikett: $A hat(vb(x))$, vid: (1.55, 0.95), anchor: "south-east")
  vektor(b, Axh, harlett, etikett: $A hat(vb(x)) - vb(b)$, vid: (2.0, 2.5), anchor: "west")
  punkt(O, etikett: $vb(0)$, anchor: "north-east")
})

#ihop[Vi ser att $abs(A vb(x) - vb(b))$ bör vara minimal för det $vb(x) in RR^2$ som uppfyller att]
$ A vb(x) - vb(b) perp "kolonn"(A) = "Span"(vb(a)_1, vb(a)_2), $
#ihop[dvs. $vb(a)_j dot (A vb(x) - vb(b)) = 0$, $j = 1, 2$. Alltså]
$
  vb(0) = vec(0, 0) = vec(vb(a)_1 dot (A vb(x) - vb(b)), vb(a)_2 dot (A vb(x) - vb(b)))
  = mat(-, vb(a)_1, -; -, vb(a)_2, -) underbrace((A vb(x) - vb(b)), 3 times 1)
  = A^T (A vb(x) - vb(b)) = A^T A vb(x) - A^T vb(b).
$
Därmed uppfyller $vb(x)$ matrisekvationen $A^T A vb(x) = A^T vb(b)$.

#formel[Normalekvationen][
  $ A^T A vb(x) = A^T vb(b) $
]

#sats[
  Låt $A$ vara av typ $m times n$, $m > n$, och $vb(b) in RR^m$. Om $hat(vb(x))$ är en lösning till
  $ A^T A vb(x) = A^T vb(b) quad (*) $
  så gäller att
  $ abs(A hat(vb(x)) - vb(b)) = min_(vb(x) in RR^n) abs(A vb(x) - vb(b)). $
]

#bevis[
  Låt $vb(x) in RR^n$ vara godtycklig. Med $abs(vb(u) + vb(v))^2 = (vb(u) + vb(v)) dot (vb(u) + vb(v)) = abs(vb(u))^2 + 2 thin vb(u) dot vb(v) + abs(vb(v))^2$ får vi
  $
    abs(A vb(x) - vb(b))^2 & = abs((A vb(x) - A hat(vb(x))) + (A hat(vb(x)) - vb(b)))^2 \
    & = abs(A vb(x) - A hat(vb(x)))^2 + 2 thin (A vb(x) - A hat(vb(x))) dot (A hat(vb(x)) - vb(b)) + abs(A hat(vb(x)) - vb(b))^2. quad (**)
  $
  #ihop[Vi vet att (i) $vb(a) dot vb(b) = vb(a)^T vb(b)$ och (ii) $(A B)^T = B^T A^T$. Från dessa följer]
  $
    (A vb(x) - A hat(vb(x))) dot (A hat(vb(x)) - vb(b))
    & limits(=)^"(i)" (A(vb(x) - hat(vb(x))))^T (A hat(vb(x)) - vb(b))
    limits(=)^"(ii)" (vb(x) - hat(vb(x)))^T A^T (A hat(vb(x)) - vb(b)) \
    & = (vb(x) - hat(vb(x)))^T underbrace((A^T A hat(vb(x)) - A^T vb(b)), = vb(0)) = 0
  $
  #ihop[på grund av att $hat(vb(x))$ är en lösning till $(*)$. Om $hat(vb(x))$ är en lösning till $(*)$ så ger alltså $(**)$]
  $
    abs(A vb(x) - vb(b))^2 = underbrace(abs(A(vb(x) - hat(vb(x))))^2, >= 0) + abs(A hat(vb(x)) - vb(b))^2
    >= abs(A hat(vb(x)) - vb(b))^2,
  $
  dvs. $abs(A hat(vb(x)) - vb(b)) = min_(vb(x) in RR^n) abs(A vb(x) - vb(b))$.
]

#exempel[forts.][
  Bestäm $k$ och $m$ i exemplet ovan med minsta kvadratmetoden.
]
#losning[
  Det linjära ekvationssystemet är
  $
    underbrace(mat(1, 1; 2, 1; 3, 1; 4, 1; 5, 1), A) underbrace(vec(k, m), vb(x))
    = underbrace(vec(3, 5, 8, 10, 13), vb(b)).
  $
  #ihop[Vi beräknar]
  $
    A^T A & = mat(1, 2, 3, 4, 5; 1, 1, 1, 1, 1) mat(1, 1; 2, 1; 3, 1; 4, 1; 5, 1) = mat(55, 15; 15, 5), \
    A^T vb(b) & = mat(1, 2, 3, 4, 5; 1, 1, 1, 1, 1) vec(3, 5, 8, 10, 13) = vec(142, 39).
  $
  #ihop[Normalekvationen $A^T A vb(x) = A^T vb(b)$ ger]
  $
    mat(55, 15, 142; 15, 5, 39; augment: #2) <==> "krångligt" <==>
    mat(1, 0, 5\/2; 0, 1, 3\/10; augment: #2).
  $
  #ihop[Alltså är den bästa anpassningen i minsta kvadratmening]
  $ y = 5/2 x + 3/10. $
]

= Linjära avbildningar

#ihop[Avbildningar = funktioner. Från analysen vet vi:]
$ f : X -> Y quad "är en funktion från" X "till" Y, quad x |-> y = f(x). $
$X$ kallas för $f$:s _definitionsmängd_ och $Y$ för $f$:s _målmängd_.

#definition[Linjär avbildning][
  En funktion $f : RR^n -> RR^m$ sägs vara *linjär* om
  #set enum(numbering: fnum("(i)", bla))
  + $f(vb(u)_1 + vb(u)_2) = f(vb(u)_1) + f(vb(u)_2)$ för alla $vb(u)_1, vb(u)_2 in RR^n$,
  + $f(lambda vb(u)) = lambda f(vb(u))$ för alla $vb(u) in RR^n$, $lambda in RR$.
]

#definition[Alternativ definition][
  $f : RR^n -> RR^m$ är *linjär* om
  $
    f(lambda_1 vb(u)_1 + lambda_2 vb(u)_2) = lambda_1 f(vb(u)_1) + lambda_2 f(vb(u)_2)
    quad "för alla" vb(u)_1, vb(u)_2 in RR^n, thin lambda_1, lambda_2 in RR.
  $
]

#exempel[
  Låt $f : RR^2 -> RR^3$ vara linjär och
  $ f vec(1, 0) = vec(3, 1, 5) quad "och" quad f vec(0, 1) = vec(7, -2, 4). $
  Beräkna $f display(vec(3, 2))$.
]
#losning[
  $ f vec(3, 2) = 3 f vec(1, 0) + 2 f vec(0, 1) = vec(23, -1, 23). $
]
