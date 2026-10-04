// =====================================================================
//  MVE670 Linjär algebra – Föreläsning 13 (21 september 2026)
//  Tas in i main.typ med #include "forelasningar/MVE670_F13_hogerinvers_berakning_invers.typ"
// =====================================================================
#import "../anteckningar-3b1b.typ": *
#nyforelasning(13, [Högerinvers, ekvationssystem och beräkning av invers], [21 september 2026])

= Två observationer

+ Om $A$ är $m times n$ och $B$ är $n times p$ så är
  $
    A B = mat(-, vb(a)_1, -; , dots.v, ; -, vb(a)_m, -)
    mat(bar.v, , bar.v; vb(b)_1, dots, vb(b)_p; bar.v, , bar.v)
    = mat(vb(a)_1 dot vb(b)_1, dots, vb(a)_1 dot vb(b)_p; dots.v, , dots.v; vb(a)_m dot vb(b)_1, dots, vb(a)_m dot vb(b)_p),
  $
  där kolonn $j$ i produkten är just $A vb(b)_j$. Dvs.
  $ A B = (A vb(b)_1 quad A vb(b)_2 quad dots quad A vb(b)_p). $

+ Enhetsmatrisen har standardbasvektorerna som kolonner:
  $
    I = mat(1, 0, dots, 0; 0, 1, dots, 0; dots.v, dots.v, dots.down, dots.v; 0, 0, dots, 1)
    = mat(bar.v, , bar.v; vb(e)_1, dots, vb(e)_m; bar.v, , bar.v),
  $
  där $vb(e)_1 = (1, 0, dots, 0)$, $dots$, $vb(e)_m = (0, dots, 0, 1)$ är standardbasen i $RR^m$.

= Högerinvers och ekvationssystem

#sats[
  Låt $A$ vara av typ $m times n$. Då gäller
  $ A "har högerinvers" <==> A vb(x) = vb(b) "är lösbart för alla" vb(b) in RR^m. $
]

#bevis[
  ($==>$) Antag att $H = (vb(h)_1 quad dots quad vb(h)_m)$ av typ $n times m$ uppfyller $A H = I$, dvs.
  $
    A H = (A vb(h)_1 quad dots quad A vb(h)_m) = (vb(e)_1 quad dots quad vb(e)_m) = I
    <==> A vb(h)_j = vb(e)_j, quad j = 1, dots, m.
  $
  #ihop[Givet $vb(b) = (b_1, dots, b_m) in RR^m$, låt]
  $ vb(x) = b_1 vb(h)_1 + b_2 vb(h)_2 + dots + b_m vb(h)_m in RR^n $
  #ihop[(varje $vb(h)_j$ är $n times 1$). Då är]
  $
    A vb(x) = A(b_1 vb(h)_1 + dots + b_m vb(h)_m) = b_1 A vb(h)_1 + dots + b_m A vb(h)_m
    = b_1 vb(e)_1 + dots + b_m vb(e)_m = vb(b).
  $
  Alltså löser $vb(x) = b_1 vb(h)_1 + dots + b_m vb(h)_m$ ekvationen $A vb(x) = vb(b)$, dvs. $A vb(x) = vb(b)$ är lösbart för alla $vb(b) in RR^m$.

  ($<==$) Antag att $A vb(x) = vb(b)$ är lösbart för alla $vb(b) in RR^m$. Låt $vb(h)_j$ vara en lösning till
  $ A vb(x) = vb(e)_j, quad j = 1, dots, m, $
  #ihop[och låt $H = (vb(h)_1 quad dots quad vb(h)_m)$ av typ $n times m$. Då är]
  $ A H = (A vb(h)_1 quad dots quad A vb(h)_m) = (vb(e)_1 quad dots quad vb(e)_m) = I. $
  Alltså är $H$ en högerinvers till $A$.
]

= Sammanfattning

Antag att $A = (vb(a)_1 quad dots quad vb(a)_n)$ är av typ $m times n$.

#formel[Vänsterinvers][
  $
    A "har vänsterinvers" & <==> A vb(x) = vb(0) "har endast lösningen" vb(x) = vb(0) \
    & <==> "Noll"(A) = {vb(0)} <==> "nolldim"(A) = 0 \
    & <==> vb(a)_1, dots, vb(a)_n "linjärt oberoende" limits(==>)^"basatsen" n <= m
  $
]

#formel[Högerinvers][
  $
    "rang"(A) = m & <==> "Kolonn"(A) = RR^m <==> A vb(x) = vb(b) "lösbar för alla" vb(b) in RR^m \
    & <==> A "har högerinvers" \
    & <==> vb(a)_1, dots, vb(a)_n "spänner upp" RR^m limits(==>)^"basatsen" n >= m
  $
]

= Kvadratiska matriser

#ihop[Antag nu att $m = n$. Då ger basatsen]
$
  underbrace(vb(a)_1\, dots\, vb(a)_n "linj. ober.", <==> A "har" V)
  <==> underbrace("Span"(vb(a)_1, dots, vb(a)_n) = RR^n, <==> A "har" H)
  <==> underbrace(lr(\{ mat(delim: #none, align: #left, vb(a)_1\, dots\, vb(a)_n "linj. ober."; "Span"(vb(a)_1, dots, vb(a)_n) = RR^n) \}) (*), <==> A "har både" V "och" H (**))
$
där $V$ betecknar en vänsterinvers och $H$ en högerinvers.

Per definition gäller $(*) <==> vb(a)_1, dots, vb(a)_n$ är en bas för $RR^n$.

Enligt lemmat från föreläsning 12 gäller $(**) <==> A$ är inverterbar med $A^(-1) = V = H$.

Dessa observationer ger:

#sats[
  Om $A$ är inverterbar så är $m = n$.
]

#bevis[
  $
    A "inverterbar" <==> cases(A "har" V, A "har" H) ==> cases(n <= m, n >= m) <==> n = m.
  $
]

#sats[
  Antag att $m = n$.
  #set enum(numbering: fnum("(a)", guld))
  + Om $A$ har en högerinvers $H$, så är $A$ inverterbar och $A^(-1) = H$.
  + Om $A$ har en vänsterinvers $V$, så är $A$ inverterbar och $A^(-1) = V$.
]

#sats[
  Låt $A$ vara av typ $n times n$. Följande påståenden är ekvivalenta:
  - $A$ är inverterbar.
  - $A vb(x) = vb(b)$ är lösbar för alla $vb(b) in RR^n$.
  - $A vb(x) = vb(b)$ har entydig lösning för alla $vb(b) in RR^n$.
  - $A vb(x) = vb(0)$ har endast lösningen $vb(x) = vb(0)$.
]

= Beräkning av inversen

Antag att $A$ av typ $n times n$ är inverterbar och att vi vill beräkna $A^(-1)$. Det räcker att hitta en $n times n$-matris $X$ $(= H = A^(-1))$ sådan att $A X = I$.

#ihop[Om $X = (vb(x)_1 quad dots quad vb(x)_n)$ så är $A X = (A vb(x)_1 quad dots quad A vb(x)_n)$, och]
$ A X = I <==> (A vb(x)_1 quad dots quad A vb(x)_n) = (vb(e)_1 quad dots quad vb(e)_n). $

#ihop[För att beräkna $X = A^(-1)$ behöver vi alltså "bara" lösa $n$ st. linjära ekvationssystem:]
$ A vb(x)_1 = vb(e)_1, quad A vb(x)_2 = vb(e)_2, quad dots, quad A vb(x)_n = vb(e)_n. $

#exempel[
  Låt $A = mat(1, 1; 3, 4)$. Beräkna $A^(-1)$.
]
#losning[
  $A vb(x)_1 = vb(e)_1$:
  $
    mat(1, 1, 1; 3, 4, 0; augment: #2)
    limits(<==>)^(R_2 - 3 R_1) mat(1, 1, 1; 0, 1, -3; augment: #2)
    limits(<==>)^(R_1 - R_2) mat(1, 0, 4; 0, 1, -3; augment: #2)
    ==> vb(x)_1 = vec(4, -3).
  $
  $A vb(x)_2 = vb(e)_2$:
  $
    mat(1, 1, 0; 3, 4, 1; augment: #2)
    limits(<==>)^(R_2 - 3 R_1) mat(1, 1, 0; 0, 1, 1; augment: #2)
    limits(<==>)^(R_1 - R_2) mat(1, 0, -1; 0, 1, 1; augment: #2)
    ==> vb(x)_2 = vec(-1, 1).
  $
  #ihop[Alltså är]
  $ X = A^(-1) = mat(4, -1; -3, 1). $
]

#anmarkning[
  *Viktig observation:* Vi utför exakt samma radoperationer i båda fallen ovan. Vi kan bespara oss en hel del arbete genom att "utföra alla fallen på en och samma gång".
]

#exempel[
  Låt $A = mat(1, 0, -2; -3, 1, 4; 2, -3, 4)$. Beräkna $A^(-1)$.
]
#losning[
  $
    & mat(1, 0, -2, 1, 0, 0; -3, 1, 4, 0, 1, 0; 2, -3, 4, 0, 0, 1; augment: #3)
    limits(<==>)^(R_2 + 3 R_1 \ R_3 - 2 R_1)
    mat(1, 0, -2, 1, 0, 0; 0, 1, -2, 3, 1, 0; 0, -3, 8, -2, 0, 1; augment: #3) \
    & limits(<==>)^(R_3 + 3 R_2)
    mat(1, 0, -2, 1, 0, 0; 0, 1, -2, 3, 1, 0; 0, 0, 2, 7, 3, 1; augment: #3)
    limits(<==>)^(1/2 R_3 \ R_1 + 2 R_3, thin R_2 + 2 R_3)
    mat(1, 0, 0, 8, 3, 1; 0, 1, 0, 10, 4, 1; 0, 0, 1, 7/2, 3/2, 1/2; augment: #3).
  $
  #ihop[Alltså är]
  $ A^(-1) = mat(8, 3, 1; 10, 4, 1; 7/2, 3/2, 1/2). $
]

#formel[Algoritm för att beräkna $A^(-1)$][
  $ (A thin | thin I) limits(<==>)^"Gausselimination" (I thin | thin A^(-1)) $
]

#exempel[
  Låt $A = mat(1, 2; 2, 4)$ och beräkna $A^(-1)$ om möjligt.
]
#losning[
  $
    (A thin | thin I) = mat(1, 2, 1, 0; 2, 4, 0, 1; augment: #2)
    limits(<==>)^(R_2 - 2 R_1) mat(1, 2, 1, 0; 0, 0, -2, 1; augment: #2) quad "– går ej!"
  $
  $A$:s kolonner är linjärt beroende, så $A$ är inte inverterbar.
]

= Matrisekvationer

#exempel[
  Lös matrisekvationen
  $ A X B = C - 2 X B, $
  där
  $
    A = mat(-1, 2, 3; 2, 1, 1; 1, 1, -1), quad
    B = mat(0, 1; 1, 0), quad
    C = mat(1, 7; -2, 4; 0, 3).
  $
]
#losning[
  $
    A X B + 2 X B = C & <==> (A X + 2 X) B = C <==> A X + 2 X = C B^(-1) \
    & <==> (A + 2 I) X = C B^(-1) <==> X = (A + 2 I)^(-1) C B^(-1).
  $

  #anmarkning[
    Att räkna ut $(A + 2 I)^(-1)$ och sedan multiplicera är korrekt men onödigt krångligt. Lös i stället $(A + 2 I) X = C B^(-1)$ direkt med Gausselimination.
  ]

  #ihop[Först $B^(-1)$:]
  $
    (B thin | thin I) <==> mat(1, 0, 0, 1; 0, 1, 1, 0; augment: #2)
    ==> B^(-1) = B = mat(0, 1; 1, 0).
  $
  #ihop[Vidare är]
  $
    C B^(-1) = dots = mat(7, 1; 4, -2; 3, 0), quad quad
    A + 2 I = mat(1, 2, 3; 2, 3, 1; 1, 1, 1).
  $
  #ihop[Här är $A + 2 I$ av typ $3 times 3$ och $C B^(-1)$ av typ $3 times 2$, så $X$ är av typ $3 times 2$. Gausselimination:]
  $
    (A + 2 I thin | thin C B^(-1)) <==> dots <==> (I thin | thin X) ==> dots ==> X = mat(1, 0; 0, -1; 2, 1).
  $
]
