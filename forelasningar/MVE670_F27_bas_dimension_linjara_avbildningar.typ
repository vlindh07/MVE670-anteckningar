// =====================================================================
//  MVE670 Linjär algebra – Föreläsning 27 (15 oktober 2026)
//  Tas in i main.typ med #include "forelasningar/MVE670_F27_bas_dimension_linjara_avbildningar.typ"
// =====================================================================
#import "../anteckningar-3b1b.typ": *
#nyforelasning(27, [Bas, dimension och linjära avbildningar], [15 oktober 2026])

= Linjärkombination, linjärt oberoende/beroende, bas, …

Vektorrum ska "likna $RR^n$". Vilka begrepp i $RR^n$ är användbara i linjär algebra?

#definition[
  Låt $V$ vara ett vektorrum över $RR$.
  - $v in V$ är en *linjärkombination* av $u_1, dots, u_p in V$ om $exists alpha_1, dots, alpha_p in RR$ så att:
    $ v = alpha_1 u_1 + dots + alpha_p u_p $
  - Om $S$ är en delmängd av $V$ så är
    $ "Span"(S) = {"linj. komb. av element i" S}. $
    $S$ *spänner upp* $"Span"(S)$.
  - $u_1, dots, u_p in V$ är *linjärt oberoende* om
    $ alpha_1 u_1 + dots + alpha_p u_p = vb(0) $
    endast har den triviala lösningen $alpha_1 = dots = alpha_p = 0$. Annars är de *linjärt beroende*.
  - En delmängd $S$ av $V$ är *linjärt oberoende* om det för alla $u_1, dots, u_p in S$ gäller att:
    $ alpha_1 u_1 + dots + alpha_p u_p = vb(0) ==> alpha_1 = dots = alpha_p = 0 $
  - En delmängd $S$ av $V$ är en *bas* för $V$ om
    - $"Span"(S) = V$,
    - $S$ är linjärt oberoende.

    $<==>$ Alla $v$ har en entydigt bestämd framställning
    $ v = alpha_1 u_1 + dots + alpha_p u_p, quad alpha_j in RR, thin u_j in S. $
  - *Dimensionen* av $V$ definieras som:
    $ dim(V) = cases(n & "om" exists "bas med" n "element", oo & "om" exists.not "bas med ändligt många element") $
]

#anmarkning[
  Fungerar likadant för vektorrum över $CC$.
]

#obs[
  Vi tittar bara på "ändliga" linjärkombinationer. Varför?
  #set enum(numbering: fnum("I.", rod))
  + Det är i allmänhet inte klart vad $sum_(i=1)^oo alpha_i u_i$ betyder.
  + Även om vi kan ge mening åt $oo$ linjärkombinationer är det inte klart att $sum_(i=1)^oo alpha_i u_i in V$.
]

#exempel[
  Låt $V = {"polynom"}$. Då är
  $ underbrace(1 + x + 1/2 x^2 + 1/(3!) x^3 + dots, "\"oändlig linj. komb.\" av polynom") = sum_(k=0)^oo x^k/(k!) limits(=)^"nästa kurs" ee^x $
]

#exempel[
  #set enum(numbering: fnum("1)", gron))
  + $CC$ vektorrum över $RR$. En bas är t.ex. $1$ & $i$ $-> dim_RR CC = 2$.

    Låt nu $CC$ vara ett vektorrum över $CC$.

    *Obs!* $1$ & $i$ är inte linjärt oberoende nu, då t.ex. $1 dot 1 + i dot i = 0$.

    En bas här är t.ex. $1 -> dim_CC CC = 1$.
  + $CC^n$ vektorrum över $CC$. Exempel på bas:
    $ vb(e)_1 = vec(1, 0, dots.v, 0), dots, vb(e)_n = vec(0, dots.v, 0, 1) -> dim_CC CC^n = n $

    $CC^n$ vektorrum över $RR$. Exempel på bas:
    $
      vb(e)_j & = (0, dots, 1, dots, 0) quad "och" \
      i vb(e)_j & = (0, dots, i, dots, 0), quad j = 1, dots, n
    $
    $ -> dim_RR CC^n = 2n $
  + $V = {m times n"-matriser"}$ vektorrum över $RR$. Exempel på bas:
    $ mat(1, 0, dots, 0; 0, 0, dots, 0; dots.v, dots.v, , dots.v; 0, 0, dots, 0), mat(0, 1, 0, dots, 0; 0, 0, 0, dots, 0; dots.v, dots.v, dots.v, , dots.v; 0, 0, 0, dots, 0), dots $
    $ e_(i j) = mat(0, dots, dots, 0; dots.v, 1, , dots.v; 0, dots, dots, 0) quad <- "rad" i", kolumn" j $
    $ ==> dim(V) = m n $
  + $P_n = {"reella polynom av grad" <= n}$. Exempel på bas:
    $ 1, x, x^2, dots, x^n -> dim(P_n) = n + 1 $
  + $P = {"polynom"}$. Exempel på bas:
    $ 1, x, x^2, dots, x^n, dots -> dim(P) = oo $
]

= Linjära avbildningar

#definition[
  Låt $U, V$ vara vektorrum över $RR \/ CC$. Då är $f : U -> V$ *linjär* om:
  #set enum(numbering: fnum("(i)", bla))
  + $f(u_1 + u_2) = f(u_1) + f(u_2), quad forall u_1, u_2 in U$
  + $f(alpha u) = alpha f(u), quad forall alpha in RR \/ CC, thin forall u in U$
  Alternativt:
  $ f(alpha_1 u_1 + alpha_2 u_2) = alpha_1 f(u_1) + alpha_2 f(u_2), quad forall alpha_1, alpha_2 in RR, thin forall u_1, u_2 in U $
]

#pagebreak()
#exempel[Förra föreläsningen][
  $ C^oo (RR) = {f : RR -> RR | f thin oo "deriverbar"} $
  Låt
  $
    D : C^oo (RR) & -> C^oo (RR) \
             g(x) & |-> D g(x) = g'(x) = dv(g, x)
  $
  #ihop[$D$ är linjär då:]
  $
    D(alpha_1 g_1(x) + alpha_2 g_2(x)) & = dv(, x) (alpha_1 g_1(x) + alpha_2 g_2(x)) = {"analys"} = \
    & = alpha_1 dv(, x) g_1(x) + alpha_2 dv(, x) g_2(x) = alpha_1 D g_1(x) + alpha_2 D g_2(x)
  $
]

Nollrum, kolonnrum (värderum), egenvärden & egenvektorer definieras som tidigare.

#exempel[forts.][
  $ "Nollrum"(D) = {g in C^oo (RR) | D g = 0} = {"konstanta funktionerna"} $
  Egenvärden & egenvektorer?

  $g(x)$ är en egenvektor (kallas ofta egenfunktion) om $D g(x) = g'(x) = alpha g(x)$ för något $alpha in RR$.
  $ ==> g(x) = beta ee^(alpha x), quad beta in RR $
  $therefore beta ee^(alpha x)$, $beta != 0$, är en egenvektor (egenfunktion) med egenvärde $alpha$.

  *Obs!* $oo$ många egenvärden.
]

#exempel[Högre ordningens derivator][
  $ D^k : C^oo (RR) -> C^oo (RR), quad k in NN $
  $ D^k g(x) = g^((k))(x) quad "linj. avb." $
  Kan även definiera polynom i $D$, t.ex. $p(D) = 1 - 3D + D^2$:
  $ p(D) g(x) = g(x) - 3g'(x) + g''(x) quad "linj. avb." $
  $ "Nollrum"(p(D)) = {g in C^oo (RR) | g''(x) - 3g'(x) + g(x) = 0} $
  #align(center)[Lösning till ODE (nästa kurs).]
]

#pagebreak()
#exempel["Integrering"][
  Låt
  $ C[a, b] = {g : [a, b] -> RR | g "kont."} $
  $
    F_1 : C[a, b] & -> C[a, b] \
             g(x) & |-> integral_a^x g(t) dd(t), quad x in [a, b]
  $
  $
    F_2 : C[a, b] & -> RR \
             g(x) & |-> integral_a^b g(x) dd(x)
  $
  $F_1$ & $F_2$ är linjära avbildningar.
]

#anmarkning[
  En linjär avbildning mellan funktionsrum kallas ofta *operator*.

  En linjär avbildning från funktionsrum till $RR$ kallas ofta *funktional*.
]
