// =====================================================================
//  MVE670 Linjär algebra – Föreläsning 23 (7 oktober 2026)
//  Tas in i main.typ med #include "forelasningar/MVE670_F23_diagonalisering.typ"
// =====================================================================
#import "../anteckningar-3b1b.typ": *
#nyforelasning(23, [Diagonalisering], [7 oktober 2026])

#definition[
  #set enum(numbering: fnum("(i)", bla))
  + $lambda$ är ett nollställe med *multiplicitet* $k$ till $p(x)$ om
    $ p(x) = (x - lambda)^k q(x) quad "där" quad q(lambda) != 0. $
  + $lambda$ är ett egenvärde med *multiplicitet* $k$ om $lambda$ är ett nollställe till $p_A (lambda)$ med multiplicitet $k$.
]

= Diagonalisering

#definition[
  $A$ av typ $n times n$ är en *diagonal matris* om den endast har nollskilda element på diagonalen.
  $ mat(a_11, , 0; , dots.down, ; 0, , a_(n n)) $
]

Diagonala matriser är de allra enklaste matriserna, då de nästan beter sig som vanliga tal:
$
  A = mat(a_11, , 0; , dots.down, ; 0, , a_(n n)), quad B = mat(b_11, , ; , dots.down, ; , , b_(n n))
  ==> A B = mat(a_11 b_11, , 0; , dots.down, ; 0, , a_(n n) b_(n n)) = B A
$
$
  A^k = mat(a_11^k, , 0; , dots.down, ; 0, , a_(n n)^k), quad
  A^(-1) = mat(a_11^(-1), , 0; , dots.down, ; 0, , a_(n n)^(-1)) = mat(1\/a_11, , 0; , dots.down, ; 0, , 1\/a_(n n)),
  quad k in ZZ
$

Finns det något sätt att ta del av dessa trevliga egenskaper även för vanliga matriser?

*Svar:* Ibland! Vissa matriser kan _diagonaliseras_, dvs. skrivas
$ A = S D S^(-1) $
där $D$ är en diagonal matris (och $S$ inverterbar).

#ihop[$A = S D S^(-1)$ har egenskaper som liknar de för diagonala matriser, t.ex.:]
$
  A^k & = (S D S^(-1))^k = S D underbrace(S^(-1) dot S, = I) D S^(-1) dot dots dot S D S^(-1)
        = S D I D I dots I D S^(-1) = S D^k S^(-1) = \
      & = S mat(d_11^k, , ; , dots.down, ; , , d_(n n)^k) S^(-1)
$

Den exakta definitionen är:

#definition[
  #set enum(numbering: fnum("(i)", bla))
  + En linjär avbildning $f: RR^n -> RR^n$ sägs vara *diagonaliserbar* om det finns en bas $vb(s)_1, dots, vb(s)_n$ för $RR^n$ sådan att avbildningsmatrisen för $f$ med avseende på $vb(s)_1, dots, vb(s)_n$ är diagonal.
  + En $n times n$-matris $A$ sägs vara *diagonaliserbar* om det finns en inverterbar matris $S$ och en diagonal matris $D$ så att
    $ A = S D S^(-1). $
]

#exempel[
  Låt $f: RR^2 -> RR^2$ vara spegling i linjen $L: t(2, 1)$, $t in RR$.
  #figur({
    import cetz.draw: *
    rutnat(x: (-2, 3), y: (-1, 3))
    let d = (2 / calc.sqrt(5), 1 / calc.sqrt(5))
    line((-2, -1), (3, 1.5), stroke: 1.2pt + objekt3)
    etikett((3, 1.5), $L$, farg: objekt3, anchor: "south-west")
    // rät vinkel mellan s1 och s2
    let r = 0.22
    let p1 = (r * d.at(0), r * d.at(1))
    let p2 = (-r * d.at(1), r * d.at(0))
    line(p1, (p1.at(0) + p2.at(0), p1.at(1) + p2.at(1)), p2, stroke: 0.7pt + textfarg)
    vektor((0, 0), (2, 1), objekt1, etikett: $vb(s)_1$, vid: (2, 1), anchor: "north-west")
    vektor((0, 0), (-1, 2), objekt2, etikett: $vb(s)_2$)
  })
]
#losning[
  Låt $vb(s)_1 = (2, 1)$, $vb(s)_2 = (-1, 2) perp vb(s)_1$. Då är $S = mat(bar.v, bar.v; vb(s)_1, vb(s)_2; bar.v, bar.v)$ en bas för $RR^2$.
  $
    & f(vb(s)_1) = vb(s)_1 \
    & f(vb(s)_2) = -vb(s)_2 ==> "avb.matris" A_S = mat(bar.v, bar.v; f(vb(s)_1), f(vb(s)_2); bar.v, bar.v) = \
    & = mat(bar.v, bar.v; vb(s)_1, -vb(s)_2; bar.v, bar.v) = mat(1, 0; 0, -1)
  $
  $therefore A_S$ är diagonal, så $f$ är diagonaliserbar.
]

= Vilka matriser är diagonaliserbara?

#sats[
  Låt $A$ vara av typ $n times n$. Då gäller att:
  $
    A "diagonaliserbar", space A = S D S^(-1) \
    <==> \
    A "har" n "st. linjärt oberoende egenvektorer."
  $
]
#bevis[
  #ihop[$underline(==>)$ Antag $A$ diagonaliserbar, dvs. $A = S D S^(-1) <==> A S = S D$. Om]
  $
    S = mat(bar.v, , bar.v; vb(s)_1, dots, vb(s)_n; bar.v, , bar.v) quad "och" quad
    D = mat(d_11, , 0; , dots.down, ; 0, , d_(n n))
  $
  #ihop[så]
  $
    & mat(bar.v, , bar.v; A vb(s)_1, dots, A vb(s)_n; bar.v, , bar.v) = A S = S D
      = mat(bar.v, , bar.v; d_11 vb(s)_1, dots, d_(n n) vb(s)_n; bar.v, , bar.v) ==> \
    & ==> A vb(s)_j = d_(j j) vb(s)_j quad forall j = 1, dots, n,
  $
  dvs. alla $d_11, dots, d_(n n)$ är egenvärden till $A$ med motsvarande egenvektorer $vb(s)_1, dots, vb(s)_n$, som är linjärt oberoende då $S$ är inverterbar.

  $underline(<==)$ Antag att $A$ har $n$ st. linjärt oberoende egenvektorer $vb(s)_1, dots, vb(s)_n$ med motsvarande egenvärden $lambda_1, dots, lambda_n$, dvs.
  $ A vb(s)_j = lambda_j vb(s)_j quad forall j = 1, dots, n. $
  #ihop[Låt]
  $
    S = (vb(s)_1 space dots space vb(s)_n) quad "och" quad D = mat(lambda_1, , 0; , dots.down, ; 0, , lambda_n).
  $
  #ihop[Då:]
  $
    A S & = A (vb(s)_1 space dots space vb(s)_n) = (A vb(s)_1 space dots space A vb(s)_n) = (lambda_1 vb(s)_1 space dots space lambda_n vb(s)_n) = \
    & = (vb(s)_1 space dots space vb(s)_n) mat(lambda_1, , 0; , dots.down, ; 0, , lambda_n) = S D
  $
  $
    A S = S D limits(<==>)^({S "inverterbar då kolumnerna är linj. ober."}) A = S D S^(-1)
  $
]

För att diagonalisera en $n times n$-matris $A$ behöver vi alltså bestämma dess egenvärden och egenvektorer.

#exempel[
  Diagonalisera $A = mat(1, 3; 4, 2)$ om möjligt.
]
#losning[
  Vi såg förra föreläsningen att $A$ har egenvärdena $lambda_1 = -2$, $lambda_2 = 5$ med motsvarande egenvektorer $t(1, -1)$, $t != 0$, resp. $t(3, 4)$, $t != 0$.

  Låt nu $vb(s)_1 = (1, -1)$ och $vb(s)_2 = (3, 4)$ $(t = 1)$. Då $vb(s)_1, vb(s)_2$ är linjärt oberoende så är
  $
    S = mat(1, 3; -1, 4), quad D = mat(-2, 0; 0, 5), quad S^(-1) = 1/(4 + 3) mat(4, -3; 1, 1).
  $
  $
    therefore A = mat(1, 3; -1, 4) mat(-2, 0; 0, 5) mat(4\/7, -3\/7; 1\/7, 1\/7)
  $
]

#pagebreak()
#exempel[
  Diagonalisera $A = mat(1, 2; 0, 1)$ om möjligt.
]
#losning[
  #set enum(numbering: fnum("I.", gron))
  + Beräkna egenvärden:
    $
      & det(lambda I - A) = 0 <==> mat(delim: "|", lambda - 1, -2; 0, lambda - 1) = 0 <==> (lambda - 1)^2 = 0 \
      & ==> A "har egenvärde" lambda = 1 "med multiplicitet" 2.
    $
  + Hitta egenvektorer:

    $underline(lambda = 1):$ Lös
    $
      & (1 dot I - A) vb(x) = vb(0) <==> mat(0, -2; 0, 0) vec(x_1, x_2) = vec(0, 0) <==> \
      & <==> -2 x_2 = 0, space x_1 "fri" ==> "Egenvekt." vb(x) = vec(x_1, x_2) = vec(t, 0) = vec(1, 0) t, quad t != 0.
    $
  $exists.not$ 2 linjärt oberoende egenvektorer $==> A$ ej diagonaliserbar.
]

#ihop[*Hypotes:* #strike[Om $A$ har egenvärde av multiplicitet $> 1$ så är $A$ ej diagonaliserbar?]]

*Svar:* Nej!

#exempel[
  $A = mat(2, , 0; , 2, ; 0, , 3)$. Då är $lambda = 2$ egenvärde med multiplicitet $2 > 1$!

  *Men:* $t vb(e)_1$, $t != 0$, $s vb(e)_2$, $s != 0$ är motsvarande linjärt oberoende egenvektorer.
]

Hmmmm… Vet att $A$ behöver $n$ st. linjärt oberoende egenvektorer för att vara diagonaliserbar. Finns det något som vi kan säga säkert? Ja:

#sats[
  Låt $A$ vara av typ $n times n$ med egenvärden $lambda_1, dots, lambda_n$. Om $lambda_i != lambda_j$ då $i != j$ så är $A$ diagonaliserbar.

  _Alt:_ Egenvektorer svarande mot olika egenvärden är linjärt oberoende.
]
#bevis[
  Låt $vb(s)_j != vb(0)$ vara egenvektor till $lambda_j$, dvs. $A vb(s)_j = lambda_j vb(s)_j$. Vill visa att $vb(s)_1, dots, vb(s)_n$ är linjärt oberoende.

  #ihop[Studera:]
  $ x_1 vb(s)_1 + x_2 vb(s)_2 + dots + x_n vb(s)_n = vb(0) quad (*) $
  #ihop[Multiplicera med $A - lambda_1 I$ från vänster:]
  $
    & x_1 (A - lambda_1 I) vb(s)_1 + x_2 (A - lambda_1 I) vb(s)_2 + dots + x_n (A - lambda_1 I) vb(s)_n = vb(0) \
    & = x_1 (underbrace(A vb(s)_1, lambda_1 vb(s)_1) - lambda_1 vb(s)_1)
      + x_2 (underbrace(A vb(s)_2, lambda_2 vb(s)_2) - lambda_1 vb(s)_2) + dots
      + x_n (underbrace(A vb(s)_n, lambda_n vb(s)_n) - lambda_1 vb(s)_n) = vb(0)
  $
  $ x_2 (lambda_2 - lambda_1) vb(s)_2 + dots + x_n (lambda_n - lambda_1) vb(s)_n = vb(0) $
  #ihop[Multiplicera med $A - lambda_2 I$ från vänster:]
  $
    x_2 (lambda_2 - lambda_1) (underbrace(A vb(s)_2, lambda_2 vb(s)_2) - lambda_2 vb(s)_2) + dots
    + x_n (lambda_n - lambda_1) (underbrace(A vb(s)_n, lambda_n vb(s)_n) - lambda_2 vb(s)_n) = vb(0)
  $
  #ihop[Fortsätter vi med $A - lambda_3 I$, $A - lambda_4 I$, …, $A - lambda_(n-1) I$ får vi då till slut:]
  $ x_n (lambda_n - lambda_1)(lambda_n - lambda_2) dot dots dot (lambda_n - lambda_(n-1)) vb(s)_n = vb(0) $
  #ihop[Då $lambda_i != lambda_j$ och $vb(s)_n != vb(0)$ ger detta $x_n = 0$, så]
  $ (*) <==> x_1 vb(s)_1 + x_2 vb(s)_2 + dots + x_(n-1) vb(s)_(n-1) = vb(0). $
  #ihop[Upprepa nu proceduren ovan ($n - 2$ ggr) för att få att $x_(n-1) = 0$, och sedan igen för $x_(n-2) = 0$, … Till slut får vi:]
  $ x_1 = x_2 = dots = x_n = 0, $
  dvs. $vb(s)_1, dots, vb(s)_n$ är linjärt oberoende.
]
