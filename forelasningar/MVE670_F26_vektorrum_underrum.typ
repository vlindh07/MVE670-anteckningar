// =====================================================================
//  MVE670 Linjär algebra – Föreläsning 26 (14 oktober 2026)
//  Tas in i main.typ med #include "forelasningar/MVE670_F26_vektorrum_underrum.typ"
// =====================================================================
#import "../anteckningar-3b1b.typ": *
#nyforelasning(26, [Vektorrum], [14 oktober 2026])

= Vektorrum

Mycket av det vi har gjort hittills kan abstraheras. Ett vektorrum är en mängd element som "liknar $RR^n$" eller "beter sig som $RR^n$".

#definition[
  Ett *vektorrum* (eller *linjärt rum*) över $RR$ (reellt vektorrum) är en icke-tom mängd $V$ med operationerna:
  #[
    #set enum(numbering: fnum("(i)", bla))
    + *addition*: $forall u, v in V$, $exists! thin u + v in V$
    + *multiplikation med skalär*: $forall alpha in RR$, $u in V$, $exists! thin alpha u in V$
  ]
  och ett speciellt element $vb(0) in V$ (*nollelement*) som $forall u, v, w in V$, $forall alpha, beta in RR$ uppfyller:
  #[
    #set enum(numbering: fnum("1)", bla))
    + $u + v = v + u$
    + $(u + v) + w = u + (v + w)$
    + $vb(0) + u = u + vb(0) = u$
    + $forall u in V$, $exists -u in V$ s.a. $u + (-u) = vb(0)$
    + $alpha(beta u) = (alpha beta) u$
    + $1 dot u = u$
    + $alpha(u + v) = alpha u + alpha v$
    + $(alpha + beta) u = alpha u + beta u$
  ]
  Elementen i $V$ kallas *vektorer*.
]

#anmarkning[
  Ett vektorrum över $CC$ definieras analogt, men skalärerna tar värden i $CC$ ($alpha, beta in CC$).
]

#exempel[
  #set enum(numbering: fnum("1)", gron))
  + Geometriska vektorer i planet eller rummet: vektorrum över $RR$.
    #figur({
      let u = (2.2, 0.3)
      let v = (1.4, 1.3)
      let uv = (u.at(0) + v.at(0), u.at(1) + v.at(1))
      vektor((0, 0), u, objekt1, etikett: $u$, vid: (1.1, -0.1), anchor: "north")
      vektor(u, uv, objekt2, etikett: $v$, vid: (3.05, 0.85), anchor: "west")
      vektor((0, 0), uv, harlett, etikett: $u + v$, vid: (1.6, 1.0), anchor: "south-east")
      vektor((5.3, 0.3), (6.3, 0.3), objekt1, etikett: $u$, vid: (5.8, 0.2), anchor: "north")
      vektor((6.7, 0.3), (8.2, 0.3), harlett, etikett: $alpha u$, vid: (7.45, 0.2), anchor: "north")
    })
  + $RR^n = {(x_1, dots, x_n) ; x_j in RR}$: vektorrum över $RR$.
  + $CC^n = {(z_1, dots, z_n) ; z_j in CC}$.

    Addition: $(z_1, dots, z_n) + (w_1, dots, w_n) = (z_1 + w_1, dots, z_n + w_n)$ \
    Multiplikation med $alpha in CC$: $alpha (z_1, dots, z_n) = (alpha z_1, dots, alpha z_n)$ \
    ger ett vektorrum över $CC$.

    Om vi bara tillåter $alpha in RR$ $->$ $CC^n$ vektorrum över $RR$.
  + ${m times n"-matriser"}$.

    Vanlig matrisaddition och multiplikation med $alpha in RR$, $vb(0)$ = nollmatrisen (har sett att de uppfyller räknereglerna): vektorrum över $RR$.
  + #underline[Nytt, viktigt exempel:]
    Låt $X$ vara en mängd, $Y$ ett vektorrum över $RR$, och låt
    $ F(X, Y) = {"funktioner från" X "till" Y} = {f : X -> Y}. $
    #ihop[Definiera operationerna:]
    #[
      #set enum(numbering: fnum("(i)", gron))
      + addition: $(f + g)(x) = f(x) + g(x)$
      + multiplikation med $alpha in RR$: $(alpha f)(x) = alpha f(x)$
    ]
    *Obs!* Väldefinierat då $Y$ är ett vektorrum, så $f(x) + g(x)$ och $alpha dot f(x)$ är väldefinierade.

    Låt $vb(0)$ = nollfunktionen, $vb(0)(x) = vb(0)$ (nollan i $Y$).

    Övning: kolla att $F(X, Y)$ uppfyller 1)–8) i definitionen av vektorrum. Detta ger att $F(X, Y)$ är ett vektorrum över $RR$.
]

En poäng med vektorrum (och abstrakt algebra i allmänhet) är att om vi bevisar något endast med hjälp av räknereglerna i definitionen av vektorrum, så gäller det vi har bevisat för alla exempel 1)–5). Vi slipper "uppfinna hjulet på nytt" varje gång.

#sats[
  Låt $V$ vara ett vektorrum över $RR \/ CC$.
  #set enum(numbering: fnum("(i)", guld))
  + $0 u = vb(0) quad forall u in V$
  + $alpha vb(0) = vb(0) quad forall alpha in RR \/ CC$
  + $vb(0)$ är entydigt bestämd.
  + $-u$ är entydigt bestämd och $-u = (-1) u$.
]

#bevis[av (i)][
  $
    0 u & limits(=)^"3)" 0 u + vb(0) limits(=)^"4)" 0 u + u + (-u) limits(=)^"6)" 0 u + 1 u + (-u) limits(=)^"8)" (0 + 1) u + (-u) = 1 dot u + (-u) = \
        & limits(=)^"6)" u + (-u) = vb(0)
  $
]

(ii)–(iv): övning.

= Underrum

#definition[
  Ett *underrum* (eller *delrum*) till ett vektorrum $V$ är en icke-tom delmängd $M subset V$ s.a. $M$ är ett vektorrum m.a.p. operationerna i $V$.
]

#sats[
  Antag att $M$ är en icke-tom delmängd till ett vektorrum $V$ över $RR$. Då gäller att:
  $
    M "underrum" <==> cases(
      "(i)" & u\, v in M ==> u + v in M,
      "(ii)" & alpha in RR \/ CC\, thin u in M ==> alpha u in M
    ) quad (ast)
  $
  #ihop[Alternativ till $(ast)$:]
  $ alpha, beta in RR \/ CC, thin u, v in M ==> alpha u + beta v in M quad (ast ast) $
]

#exempel[
  #set enum(numbering: fnum("1)", gron))
  + Låt $V = {"geom. vektorer i" RR^3}$. Typiska underrum:
    #[
      #set enum(numbering: fnum("I.", gron))
      + linjer genom origo,
      + plan genom origo.
    ]
  + $A = (vb(a)_1 space dots space vb(a)_n)$ $m times n$-matris.
    $ "Noll"(A) = {vb(x) in RR^n ; A vb(x) = vb(0)} $
    är ett underrum till $RR^n$.
    $ "kolonn"(A) = "Span"(vb(a)_1, dots, vb(a)_n) $
    är ett underrum till $RR^m$.
  + Antag att $lambda$ är ett egenvärde till $A$ (typ $n times n$).
    $ E_lambda := {vb(x) in RR^n ; A vb(x) = lambda vb(x)} $
    är ett underrum till $RR^n$ (kallas *egenrum*).
  + $V = {n times n"-matris"}$. Avgör om följande delmängder till $V$ är underrum:
    #[
      #set enum(numbering: fnum("(a)", gron))
      + ${"symmetriska" n times n"-matriser"}$
      + ${"inverterbara" n times n"-matriser"}$
      + ${"uppåt triangulära" mat(ast, , ast; , dots.down, ; 0, , ast) "matriser"}$
    ]
]

#losning[
  #set enum(numbering: fnum("(a)", gron))
  + Kolla $(ast ast)$. Antag $A, B$ symmetriska, $alpha, beta in RR$. Då
    $
      (alpha A + beta B)^T & = (alpha A)^T + (beta B)^T = alpha A^T + beta B^T = {A, B "symm."} = \
                           & = alpha A + beta B
    $
    $therefore alpha A + beta B$ symmetrisk, så ${"symm. matr."}$ är ett underrum till $V$.
  + Antag $A$ inverterbar. Låt $B = -A$. Då är $B$ också inverterbar, men
    $ A + B = A - A = vb(0) "ej inverterbar". $
    $therefore {"inverterbara matr."}$ är ej ett underrum till $V$.

    #anmarkning[Följer att $vb(0) in M$ om $M$ är ett underrum.]
  + Övning.
]

#exempel[
  #enum(
    numbering: fnum("1)", gron),
    start: 5,
    [
      #underline[Funktionsrum:]
      Låt $V = F(RR, RR) = F(RR) = {"funktioner" f : RR -> RR}$.

      #underline[Underrum:]
      - $C(RR) = {f : RR -> RR ; f "kontinuerliga"}$. \
        Har visat i analysen att om $f, g$ kont., $alpha, beta in RR$ så är $alpha f + beta g$ kont.
      - $C^oo (RR) = {f : RR -> RR | f "har kont. derivator av alla ordningar"}$ $<-$ *glatta* funktioner.
      - $P = {p : RR -> RR ; p "polynom"}$
      - $P_n = {p : RR -> RR | p "polynom av grad" <= n}$
    ],
  )
]

#exempel[
  Avgör om följande är underrum till $F(RR)$:
  #set enum(numbering: fnum("(a)", gron))
  + ${"växande funktioner" f : RR -> RR}$
  + ${"polynom av grad" = n in NN without {0}}$
]

#losning(qed: false)[
  #set enum(numbering: fnum("(a)", gron))
  + Antag $f$ strängt växande, då är $(-1) f$ strängt avtagande. $(ast)$, (ii) ej uppfylld.

    $therefore {"växande fkn."}$ är ej ett underrum.
  + $vb(0) = p(x) = 0$ är ej av grad $n in NN without {0}$, så ${"polynom av grad" = n}$ är ej ett underrum. #qed
]
