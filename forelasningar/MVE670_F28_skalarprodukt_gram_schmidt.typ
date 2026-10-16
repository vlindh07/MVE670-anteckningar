// =====================================================================
//  MVE670 Linjär algebra – Föreläsning 28 (16 oktober 2026)
//  Tas in i main.typ med #include "forelasningar/MVE670_F28_skalarprodukt_gram_schmidt.typ"
// =====================================================================
#import "../anteckningar-3b1b.typ": *
#nyforelasning(28, [Skalärprodukt och inre produktrum], [16 oktober 2026])

= Kartesisk produkt

#definition[
  Låt $V, W$ vektorrum över $RR$. Den så kallade *kartesiska produkten* av $V$ & $W$ definieras som
  $ V times W = {(v, w) ; v in V "&" w in W} $
]

= Skalärprodukt i vektorrum

#definition[
  Låt $V$ vara ett vektorrum över $RR$. En *skalärprodukt* (eller *inre produkt*) på $V$ är en funktion:
  $
    chevron.l dot\, dot chevron.r : V times V & -> RR \
                                       (u, v) & |-> chevron.l u\, v chevron.r quad ("tänk" u dot v)
  $
  som är:
  #set enum(numbering: fnum("(i)", bla))
  + *symmetrisk*, dvs. $chevron.l u\, v chevron.r = chevron.l v\, u chevron.r, quad forall u, v in V$
  + *linjär i första variabeln*, dvs. $chevron.l u_1 + u_2\, v chevron.r = chevron.l u_1\, v chevron.r + chevron.l u_2\, v chevron.r$, \
    $chevron.l alpha u_1\, v chevron.r = alpha chevron.l u_1\, v chevron.r, quad forall alpha in RR, thin forall u_1, u_2, v in V$
  + *positivt definit*, dvs. $chevron.l u\, u chevron.r >= 0 quad forall u in V$ och $chevron.l u\, u chevron.r = 0 <==> u = 0$

  Ett vektorrum försett med en skalärprodukt $(V, chevron.l dot\, dot chevron.r)$ kallas *inre produktrum*.
]

#exempel[
  #set enum(numbering: fnum("I.", gron))
  + $V = {"geom. vektorer"}$
    $ chevron.l u\, v chevron.r = u dot v = abs(u) abs(v) cos theta $
  + $V = RR^n$, $quad chevron.l vb(x)\, vb(y) chevron.r = vb(x) dot vb(y) = sum_(j=1)^n x_j y_j = vb(x)^T vb(y)$

  Har sett att dessa uppfyller (i)–(iii).
]

#definition[
  En symmetrisk $n times n$-matris $A$ sägs vara *positivt definit* om:
  #set enum(numbering: fnum("I.", bla))
  + $vb(x)^T A vb(x) >= 0 quad forall vb(x) in RR^n$
  + $vb(x)^T A vb(x) = 0 <==> vb(x) = 0$
]

#ihop[Kan visa: $A$ pos. def. $<==>$ $A$ har endast positiva egenvärden.]

$
  mat(delim: "(", align: #left,
    A "symm." ==> A = S D S^T = {tilde(S) = S^T} = tilde(S)^T D tilde(S);
    vb(x)^T A vb(x) = vb(x)^T tilde(S)^T D tilde(S) vb(x) = (tilde(S) vb(x))^T D (tilde(S) vb(x)) = vb(y)^T D vb(y) = display(mat(y_1, dots, y_n) mat(lambda_1, , 0; , dots.down, ; 0, , lambda_n) vec(y_1, dots.v, y_n)) =;
    = lambda_1 y_1^2 + lambda_2 y_2^2 + dots + lambda_n y_n^2 >= 0)
$

#pagebreak()
#exempel[
  Låt $A$ pos. def. matris. Då är $chevron.l vb(x)\, vb(y) chevron.r = vb(x)^T A vb(y)$ en skalärprodukt på $RR^n$. Låt oss kolla.
  #set enum(numbering: fnum("(i)", gron))
  + $chevron.l vb(y)\, vb(x) chevron.r = vb(y)^T A vb(x) = (vb(y)^T A vb(x))^T = vb(x)^T A^T (vb(y)^T)^T = vb(x)^T A vb(y) = chevron.l vb(x)\, vb(y) chevron.r$
  + $
      chevron.l alpha_1 vb(x)_1 + alpha_2 vb(x)_2\, vb(y) chevron.r & = (alpha_1 vb(x)_1 + alpha_2 vb(x)_2)^T A vb(y) = (alpha_1 vb(x)_1^T + alpha_2 vb(x)_2^T) A vb(y) = \
      & = alpha_1 vb(x)_1^T A vb(y) + alpha_2 vb(x)_2^T A vb(y) = alpha_1 chevron.l vb(x)_1\, vb(y) chevron.r + alpha_2 chevron.l vb(x)_2\, vb(y) chevron.r
    $
  + Definitionen av pos. def. matris.
]

#anmarkning[
  "Den vanliga skalärprodukten" på $RR^n$ motsvarar $A = I$:
  $ vb(x)^T vb(y) = vb(x)^T I vb(y) = chevron.l vb(x)\, vb(y) chevron.r $
]

#exempel[
  $ V = C[a, b] = {f : [a, b] -> RR | f "kont."} $
  Då är
  $ chevron.l f\, g chevron.r := integral_a^b f(x) g(x) dd(x) $
  en skalärprodukt på $C[a, b]$.

  (i) & (ii): övning.

  (iii)
  $ chevron.l f\, f chevron.r = integral_a^b underbrace((f(x))^2, >= 0) dd(x) >= 0 quad forall f in C[a, b] $
  $f$ kont. $==>$ likhet omm $f(x) = 0 quad forall x in [a, b]$, dvs. $f = vb(0)$, nollfunktionen i $C[a, b]$.
]

#definition[
  Precis som i $RR^n$ kan vi nu definiera:
  - *Längd* (eller *norm*) $norm(u)$ av $u in V$:
    $ norm(u) = sqrt(chevron.l u\, u chevron.r) $
  - *Avstånd* mellan $u, v in V$: $norm(u - v)$.
  - $u, v in V$ *ortogonala*, $u perp v$, om $chevron.l u\, v chevron.r = 0$.
  - *Vinkel* $theta$ mellan $u, v in V$:
    $ theta = arccos((chevron.l u\, v chevron.r) / (norm(u) norm(v))) $
  - *Ortogonalprojektion*:
    $ "proj"_v (u) = (chevron.l u\, v chevron.r) / norm(v)^2 v $
  - $e_j$ *ON-bas* för $V$ om
    $ chevron.l e_i\, e_j chevron.r = cases(1 quad i = j, 0 quad i != j) $
]

#exempel[forts.][
  $f in C[a, b]$:
  $ norm(f) = sqrt(chevron.l f\, f chevron.r) = sqrt(integral_a^b (f(x))^2 dd(x)) quad ("kallas" L^2"-norm") $
]

#exempel[
  $ p_0(x) = 1, quad p_1(x) = 2x - 1, quad p_2(x) = 6x^2 - 6x + 1 quad in C[0, 1] $
  $p_0, p_1$ & $p_2$ är inbördes ortogonala:
  $ chevron.l p_0\, p_1 chevron.r = integral_0^1 p_0(x) p_1(x) dd(x) = integral_0^1 1 dot (2x - 1) dd(x) = [x^2 - x]_0^1 = 1 - 1 = 0 ==> p_0 perp p_1 $
  Övning: Visa $p_0 perp p_2$, $p_1 perp p_2$.
]

#exempel[
  $ 1, sin(n x), cos(n x), quad n = 1, 2, dots $
  är inbördes ortogonala i $C[-pi, pi]$.

  $->$ Fourieranalys approximerar funktioner i $C[-pi, pi]$ med dessa.
]

= Två olikheter

Två olikheter (viktiga!), som gäller för alla skalärprodukter:

#sats[Cauchy–Schwarz olikhet][
  $ abs(chevron.l u\, v chevron.r) <= norm(u) norm(v) quad forall u, v in V $
  Likhet omm $u$ & $v$ linjärt beroende.
]

#sats[Triangelolikheten][
  $ norm(u + v) <= norm(u) + norm(v) quad forall u, v in V $
]

#exempel[forts.][
  #set enum(numbering: fnum("I.", gron))
  + Geom. vektorer
    $ "CS:" quad abs(chevron.l u\, v chevron.r) / (norm(u) norm(v)) = abs(u dot v) / (abs(u) abs(v)) = abs(abs(u) abs(v) cos theta) / (abs(u) abs(v)) = (abs(u) abs(v) abs(cos theta)) / (abs(u) abs(v)) = abs(cos theta) <= 1 $
    $ therefore abs(chevron.l u\, v chevron.r) <= norm(u) norm(v) $
    $ Delta"-olikh.:" quad norm(u + v) <= norm(u) + norm(v) quad <==> quad abs(u + v) <= abs(u) + abs(v) $
  + $vb(x) dot vb(y)$ i $RR^n$
    $ "CS:" quad abs(vb(x) dot vb(y)) <= abs(vb(x)) abs(vb(y)) <==> abs(sum_(i=1)^n x_i y_i) <= sqrt(sum_(i=1)^n x_i^2) sqrt(sum_(i=1)^n y_i^2) $
]

#exempel[forts.][
  $chevron.l f\, g chevron.r$ i $C[a, b]$
  $ "CS:" quad abs(chevron.l f\, g chevron.r) <= norm(f) norm(g) <==> abs(integral_a^b f(x) g(x) dd(x)) <= sqrt(integral_a^b (f(x))^2 dd(x)) dot sqrt(integral_a^b (g(x))^2 dd(x)) $
]

= Gram–Schmidts metod

#sats[
  Låt $(V, chevron.l dot\, dot chevron.r)$ inre produktrum. Antag att $0 < dim(V) < oo$. Då har $V$ en ON-bas.
]

#bevis[(Gram–Schmidts metod)][
  Antag $dim(V) = n$, och låt $v_1, dots, v_n$ godtycklig bas för $V$.
  #set enum(numbering: fnum("1)", guld))
  + Låt $e'_1 = v_1$.
  + Betrakta $e'_1$ & $v_2$.
    #figur({
      vektor((0, 0), (3, 0), objekt2, etikett: $e'_1$)
      vektor((0, 0), (1.9, 0), harlett, etikett: $v_2^parallel$, vid: (0.95, -0.35))
      hjalplinje((1.9, 1.9), (1.9, 0))
      vektor((0, 0), (0, 1.9), objekt3, etikett: $v_2^perp$)
      vektor((0, 0), (1.9, 1.9), objekt1, etikett: $v_2$)
    })
    Precis som för geom. vektorer gäller att
    $ fg(objekt1, v_2) = fg(harlett, v_2^parallel) + fg(objekt3, v_2^perp) quad "där" quad fg(harlett, v_2^parallel) parallel fg(objekt2, e'_1), quad fg(objekt3, v_2^perp) perp fg(objekt2, e'_1) $
    Låt
    $ e'_2 = v_2^perp = v_2 - v_2^parallel = v_2 - "proj"_(e'_1) (v_2) $

  Låt nu
  $ e'_3 = v_3 - "proj"_(e'_1) (v_3) - "proj"_(e'_2) (v_3) $
  Då $e'_3 perp e'_1$ & $e'_3 perp e'_2$.
  $
    e'_4 & = v_4 - "proj"_(e'_1) (v_4) - "proj"_(e'_2) (v_4) - "proj"_(e'_3) (v_4) \
         & dots.v \
    e'_n & = v_n - sum_(i=1)^(n-1) "proj"_(e'_i) (v_n)
  $
  Då är $e'_1, dots, e'_n$ ortogonala. Låt slutligen
  $ e_j = e'_j / norm(e'_j). $
  Då är $e_1, dots, e_n$ en ON-bas.
]
