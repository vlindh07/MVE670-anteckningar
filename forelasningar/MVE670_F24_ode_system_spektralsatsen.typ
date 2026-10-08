// =====================================================================
//  MVE670 Linjär algebra – Föreläsning 24 (8 oktober 2026)
//  Tas in i main.typ med #include "forelasningar/MVE670_F24_ode_system_spektralsatsen.typ"
// =====================================================================
#import "../anteckningar-3b1b.typ": *
#nyforelasning(24, [System av differentialekvationer och spektralsatsen], [8 oktober 2026])

= System av differentialekvationer

En viktig tillämpning av diagonalisering är lösning av linjära system av ODE:n med konstanta koefficienter. För detta behöver vi känna till:

#ihop[ODE:n]
$
  y'(t) = k y(t), quad k in RR quad "har lösn." quad y(t) = C ee^(k t), quad C in RR quad ("nästa kurs")
$

#ihop[Antag nu att vi har ett system av ODE:n:]
$
  cases(
    x'_1 (t) = a_11 x_1 (t) + a_12 x_2 (t) + dots + a_(1 n) x_n (t),
    quad dots.v,
    x'_n (t) = a_(n 1) x_1 (t) + a_(n 2) x_2 (t) + dots + a_(n n) x_n (t),
  )
  \ <==> \
  vb(x)'(t) = A vb(x)(t) quad "där" quad
  vb(x)(t) = vec(x_1 (t), dots.v, x_n (t)), quad
  A = mat(a_11, dots, a_(1 n); dots.v, , dots.v; a_(n 1), dots, a_(n n))
$

#exempel[
  Lös
  $
    cases(x'_1 (t) = x_1 (t) + 2 x_2 (t), x'_2 (t) = -x_1 (t) + 4 x_2 (t))
    quad "där" quad
    cases(x_1 (0) = 1, x_2 (0) = 2)
  $
]
#losning[
  #ihop[Vill lösa:]
  $ vb(x)'(t) = underbrace(mat(1, 2; -1, 4), A) vb(x)(t) $
  $
    det(lambda I - A) & = mat(delim: "|", lambda - 1, -2; 1, lambda - 4) = (lambda - 1)(lambda - 4) + 2 = lambda^2 - 5 lambda + 6 = 0 ==> \
    & ==> lambda = 5/2 plus.minus sqrt(25/4 - (6 dot 4)/4) = 5/2 plus.minus 1/2 \
    & ==> lambda_1 = 3, space lambda_2 = 2
  $

  #ihop[$underline(lambda_1 = 3):$]
  $
    & (3 I - A) vb(s) = vb(0) ==> mat(2, -2, 0; 1, -1, 0; augment: #2) <==> mat(1, -1, 0; 0, 0, 0; augment: #2) <==> \
    & <==> s_1 - s_2 = 0 limits(==>)^(s_2 = u) vb(s) = vec(s_1, s_2) = vec(1, 1) u, quad u != 0
  $

  #ihop[$underline(lambda_2 = 2):$]
  $
    & (2 I - A) vb(s) = vb(0) ==> mat(1, -2, 0; 1, -2, 0; augment: #2) ==> mat(1, -2, 0; 0, 0, 0; augment: #2) <==> s_1 - 2 s_2 = 0 ==> \
    & limits(==>)^(s_2 = u) vb(s) = vec(s_1, s_2) = vec(2, 1) u, quad u != 0
  $

  Låt $D = mat(3, 0; 0, 2)$, $S = mat(1, 2; 1, 1)$. Då:
  $
    & vb(x)'(t) = A vb(x)(t) <==> vb(x)'(t) = S D S^(-1) vb(x)(t) <==> S^(-1) vb(x)'(t) = D S^(-1) vb(x)(t) <==> \
    & <==> (S^(-1) vb(x)(t))' = D S^(-1) vb(x)(t)
  $
  Låt $S^(-1) vb(x)(t) = vb(y)(t)$: $quad vb(y)'(t) = D vb(y)(t)$
  $
    & <==> cases(y'_1 (t) = 3 y_1 (t), y'_2 (t) = 2 y_2 (t))
      ==> cases(y_1 (t) = C_1 ee^(3 t), y_2 (t) = C_2 ee^(2 t)), quad
      vb(y)(t) = S^(-1) vb(x)(t) <==> \
    & <==> vb(x)(t) = S vb(y)(t) = mat(1, 2; 1, 1) vec(C_1 ee^(3 t), C_2 ee^(2 t))
  $
  #ihop[$vb(x)(0) = vec(1, 2)$ ger:]
  $
    mat(1, 2; 1, 1) vec(C_1, C_2) = vec(1, 2) ==> mat(1, 2, 1; 1, 1, 2; augment: #2) <==> dots <==> mat(1, 0, 3; 0, 1, -1; augment: #2)
  $
  $
    therefore vb(x)(t) = mat(1, 2; 1, 1) vec(3 ee^(3 t), -ee^(2 t)) = 3 ee^(3 t) vec(1, 1) - ee^(2 t) vec(2, 1)
  $
]

I allmänhet: Om $A$ av typ $n times n$ är diagonaliserbar med egenvärden $lambda_1, dots, lambda_n$ och motsvarande egenvektorer $vb(s)_1, dots, vb(s)_n$ så har $vb(x)'(t) = A vb(x)(t)$ lösningen:
#formel[
  $ vb(x)(t) = C_1 ee^(lambda_1 t) vb(s)_1 + C_2 ee^(lambda_2 t) vb(s)_2 + dots + C_n ee^(lambda_n t) vb(s)_n $
]

= Symmetriska matriser

Finns det något #underline[enkelt] tillräckligt villkor på en matris $A$ för att $A$ ska vara diagonaliserbar? Ja!

#definition[
  $A$ av typ $n times n$ är *symmetrisk* om $A^T = A$.
]

För symmetriska matriser har vi den fantastiska:

#sats[Spektralsatsen][
  Antag att $A$ av typ $n times n$ är symmetrisk. Då gäller att:
  #set enum(numbering: fnum("(i)", guld))
  + $A$:s egenvärden är reella.
  + $exists$ ortogonal matris $S$ och diagonal matris $D$ så att
    $ A = S D S^T. $
]

#pagebreak()
#exempel[
  Låt $A = mat(-3, 4; 4, 3)$. $A$ är symmetrisk, så $S$ och $D$ bör existera enligt spektralsatsen.
]
#losning[
  #ihop[Vi räknar på som vanligt:]
  $
    det(lambda I - A) & = mat(delim: "|", lambda + 3, -4; -4, lambda - 3) = (lambda + 3)(lambda - 3) - 16 = lambda^2 - 25 = 0 \
    & ==> lambda_1 = 5, space lambda_2 = -5
  $

  #ihop[$underline(lambda_1 = 5):$]
  $
    & (5 I - A) vb(x) = vb(0) ==> mat(8, -4, 0; -4, 2, 0; augment: #2) <==> mat(2, -1, 0; 0, 0, 0; augment: #2) <==> \
    & <==> 2 x_1 - x_2 = 0 limits(==>)^(x_1 = t) vec(x_1, x_2) = vec(t, 2 t) = vec(1, 2) t, quad t != 0
  $

  #ihop[$underline(lambda_2 = -5):$]
  $
    & (-5 I - A) vb(x) = vb(0) ==> mat(-2, -4, 0; -4, -8, 0; augment: #2) <==> mat(1, 2, 0; 0, 0, 0; augment: #2) <==> \
    & <==> x_1 + 2 x_2 = 0 limits(==>)^(x_2 = s) vec(x_1, x_2) = vec(-2 s, s) = vec(-2, 1) s, quad s != 0
  $

  Ser direkt att $vec(1, 2) t perp vec(-2, 1) s$.

  Låt $vb(s)_1 = vec(1, 2)$, $vb(s)_2 = vec(-2, 1)$. Dessa har ej längd 1:
  $ abs(vb(s)_1) = abs(vb(s)_2) = sqrt(4 + 1) = sqrt(5) $
  Låt $vu(s)_1 = 1/sqrt(5) vec(1, 2)$, $vu(s)_2 = 1/sqrt(5) vec(-2, 1)$, dvs. $s = t = 1/sqrt(5)$.

  #ihop[Om]
  $ S = mat(1\/sqrt(5), -2\/sqrt(5); 2\/sqrt(5), 1\/sqrt(5)) = 1/sqrt(5) mat(1, -2; 2, 1) $
  #ihop[så är $S$ ortogonal $==>$]
  $
    ==> A = S D S^(-1) = S D S^T = 1/sqrt(5) mat(1, -2; 2, 1) mat(5, 0; 0, -5) 1/sqrt(5) mat(1, 2; -2, 1) quad ("övn: kolla!")
  $
]

#pagebreak()
Beviset av spektralsatsen är utanför kursen, men vi kan visa en liten del:

#lemma[
  Antag att $A$ av typ $n times n$ är symmetrisk, $vb(s)_j$ egenvektor med egenvärde $lambda_j$ och $vb(s)_k$ egenvektor med egenvärde $lambda_k$. Om $lambda_j != lambda_k$ så är $vb(s)_j perp vb(s)_k$.
]
#bevis[
  Bygger på att $vb(u) dot vb(v) = vb(u)^T vb(v)$.

  #ihop[Vill visa: $vb(s)_j dot vb(s)_k = 0 <==> vb(s)_j^T vb(s)_k = 0$.]
  $
    lambda_j vb(s)_j^T vb(s)_k & limits(=)^(lambda_j in RR) (lambda_j vb(s)_j)^T vb(s)_k = (A vb(s)_j)^T vb(s)_k
      = vb(s)_j^T A^T vb(s)_k = {A^T = A} = vb(s)_j^T A vb(s)_k = \
    & = vb(s)_j^T (lambda_k vb(s)_k) = lambda_k vb(s)_j^T vb(s)_k <==> \
    & <==> (lambda_j - lambda_k) vb(s)_j^T vb(s)_k = 0 limits(==>)^(lambda_j != lambda_k) vb(s)_j^T vb(s)_k = 0 <==> vb(s)_j dot vb(s)_k = 0
  $
  $therefore vb(s)_j perp vb(s)_k$
]

#foljdsats[
  Antag att $A$ av typ $n times n$ är symmetrisk och att $A$ har $n$ olika egenvärden. Då $exists S$ ortogonal och $D$ diagonal så att
  $ A = S D S^T. $
]

= Mer om egenvärden

#sats[
  Låt $A$ vara av typ $n times n$.
  #set enum(numbering: fnum("I.", guld))
  + $A$ inverterbar $<==>$ alla egenvärden $lambda_j != 0$.
  + Om $A$ är inverterbar och $vb(s)$ egenvektor till $A$ med $A vb(s) = lambda vb(s)$, så är
    $ A^(-1) vb(s) = 1/lambda vb(s). $
]
#bevis[
  #set enum(numbering: fnum("I.", guld))
  + Vi visar: $A$ har egenvärde $lambda = 0 <==> A$ ej inverterbar.
    $
      & A "har egenvärde" lambda = 0 <==> exists vb(x) != vb(0) "s.a." A vb(x) = lambda vb(x) = 0 dot vb(x) = vb(0) <==> \
      & <==> exists "icke-trivial lösn. till" A vb(x) = vb(0) \
      & <==> A":s kolumner är linjärt beroende" \
      & <==> A "ej inverterbar."
    $
  + $A$ inverterbar och $A vb(s) = lambda vb(s)$, $vb(s) != vb(0)$:
    $
      & <==> A^(-1) A vb(s) = A^(-1) (lambda vb(s)) <==> {"I." ==> lambda != 0} <==> \
      & <==> 1/lambda vb(s) = A^(-1) vb(s)
    $
]

#pagebreak()
#sats[
  #set enum(numbering: fnum("(i)", guld))
  + $A$ och $A^T$ har samma karakteristiska polynom, dvs. $p_A (lambda) = p_(A^T) (lambda)$.
  + Om $B = S^(-1) A S$ $(<==> A = S B S^(-1))$ så är $p_A (lambda) = p_B (lambda)$.
]
#bevis[
  #set enum(numbering: fnum("(i)", guld))
  + $
      p_A (lambda) & = det(lambda I - A) = det((lambda I - A)^T) = det((lambda I)^T - A^T) = \
      & = det(lambda I - A^T) = p_(A^T) (lambda)
    $
  + $
      p_B (lambda) & = det(lambda I - B) = det(lambda I - S^(-1) A S) = det(lambda S^(-1) S - S^(-1) A S) = \
      & = det(S^(-1) (lambda I - A) S) = det(S^(-1)) det(lambda I - A) det(S) = \
      & = det(S^(-1)) det(S) det(lambda I - A) = det(S^(-1) S) det(lambda I - A) = det(lambda I - A) = p_A (lambda)
    $
]
