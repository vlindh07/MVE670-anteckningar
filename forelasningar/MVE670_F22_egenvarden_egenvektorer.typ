// =====================================================================
//  MVE670 Linjär algebra – Föreläsning 22 (5 oktober 2026)
//  Tas in i main.typ med #include "forelasningar/MVE670_F22_egenvarden_egenvektorer.typ"
// =====================================================================
#import "../anteckningar-3b1b.typ": *
#nyforelasning(22, [Egenvärden och egenvektorer], [5 oktober 2026])

Låt $A$ vara av typ $n times n$ och $vb(x) in RR^n$. I många praktiska sammanhang vill man veta vad
$ A^k vb(x) = underbrace(A dot A dot dots dot A, k "ggr.") vb(x) $
är då $k$ är stort.

#exempel[
  För studenterna i en F/TM-klass gäller att av dem som är friska en viss dag, är 90 % friska dagen därpå, och av dem som är sjuka en viss dag, är hälften också sjuka dagen därpå. Antag att andelen friska och sjuka studenter från början är 60 % respektive 40 %. Hur stor andel är sjuka/friska efter lång tid?
]
#losning[
  Låt
  $
    x_1^((j)) & = "andel friska studenter dag" j, \
    x_2^((j)) & = "andel sjuka studenter dag" j.
  $
  #ihop[Då vet vi att:]
  $
    x_1^((j + 1)) & = 0,9 dot x_1^((j)) + 0,5 dot x_2^((j)), quad & x_1^((0)) = 0,6 \
    x_2^((j + 1)) & = 0,1 dot x_1^((j)) + 0,5 dot x_2^((j)), quad & x_2^((0)) = 0,4
  $
  $
    <==> underbrace(vec(x_1^((j + 1)), x_2^((j + 1))), vb(x)^((j + 1)))
    = underbrace(mat(0\,9, 0\,5; 0\,1, 0\,5), A) underbrace(vec(x_1^((j)), x_2^((j))), vb(x)^((j))),
    quad vb(x)^((0)) = vec(0\,6, 0\,4).
  $
  #ihop[Därtill gäller:]
  $
    vb(x)^((1)) = A vb(x)^((0)), quad vb(x)^((2)) = A vb(x)^((1)) = A A vb(x)^((0)) = A^2 vb(x)^((0)),
    quad dots quad vb(x)^((k)) = A^k vb(x)^((0)), quad k in NN.
  $
]

Vi är alltså intresserade av $A^k vb(x)^((0))$ då $k -> oo$. För detta behöver vi egenvärden och egenvektorer.

= Egenvärden och egenvektorer

#definition[
  #set enum(numbering: fnum("(i)", bla))
  + Antag att $f: RR^n -> RR^n$ är en linjär avbildning. Om $lambda in RR$, $vb(x) in RR^n$, $vb(x) != vb(0)$ uppfyller
    $ f(vb(x)) = lambda vb(x), $
    så kallas $lambda$ ett *egenvärde* och $vb(x)$ en *egenvektor* för $f$.
  + Antag att $A$ är av typ $n times n$. Om $lambda in RR$, $vb(x) in RR^n$, $vb(x) != vb(0)$ uppfyller
    $ A vb(x) = lambda vb(x), $
    så kallas $lambda$ ett *egenvärde* och $vb(x)$ en *egenvektor* till $A$.
]

#varning[
  $vb(x) != vb(0)$, annars är alla $lambda in RR$ egenvärden.
]

#exempel[
  Låt $f: RR^3 -> RR^3$, $vb(x) |-> $ ortogonala projektionen av $vb(x)$ på $x y$-planet, dvs.
  $ (x, y, z) |-> (x, y, 0). $
  #figur({
    import cetz.draw: *
    // sned projektion: x-axeln ritas snett nedåt vänster
    let ex = (-0.6, -0.6)
    let pt(x, y, z) = (y + x * ex.at(0), z + x * ex.at(1))
    let pil = (end: "stealth", fill: ljusgra, scale: 0.7)
    line(pt(0, 0, 0), pt(0, 2.3, 0), stroke: 0.9pt + ljusgra, mark: pil)
    line(pt(0, 0, 0), pt(0, 0, 2), stroke: 0.9pt + ljusgra, mark: pil)
    line(pt(0, 0, 0), pt(1.8, 0, 0), stroke: 0.9pt + ljusgra, mark: pil)
    content(pt(0, 2.45, 0), text(fill: ljusgra, $y$), anchor: "west")
    content(pt(0, 0, 2.15), text(fill: ljusgra, $z$), anchor: "south")
    content(pt(1.95, 0, 0), text(fill: ljusgra, $x$), anchor: "north-east")
    let P = pt(0.4, 1.4, 1.5)
    let Pp = pt(0.4, 1.4, 0)
    hjalplinje(P, Pp)
    punkt(P, farg: objekt1, etikett: $vb(x)$, anchor: "west", radie: 0.07)
    punkt(Pp, farg: harlett, etikett: $f(vb(x))$, anchor: "west", radie: 0.07)
  })
]
#losning[
  #ihop[*Egenvärden:*]
  #set enum(numbering: fnum("I.", gron))
  + $f(vb(x)) = vb(x)$ om $vb(x)$ ligger i $x y$-planet.
  + $f(vb(x)) = vb(0) = 0 dot vb(x)$ om $vb(x)$ ligger på $z$-axeln.

  Annars är $f(vb(x)) != lambda vb(x)$.

  $therefore$ Två egenvärden:
  - $lambda_1 = 1$ med motsvarande egenvektorer $x y$-planet $without {vb(0)}$,
  - $lambda_2 = 0$ med motsvarande egenvektorer $z$-axeln $without {vb(0)}$.
]

#exempel[
  $f: RR^2 -> RR^2$, $vb(x) |-> vb(x)$ roterat $theta$ rad moturs.
  #figur({
    let R = 1.6
    let a = 30deg
    let th = 110deg
    rutnat(x: (-2, 2), y: (-0.8, 2), rutor: false)
    vektor((0, 0), flytta((0, 0), R, a), objekt1, etikett: $vb(x)$)
    vektor((0, 0), flytta((0, 0), R, a + th), harlett, etikett: $f(vb(x))$)
    vinkel((0, 0), flytta((0, 0), 1, a), flytta((0, 0), 1, a + th), radie: 0.55)
    etikett(flytta((0, 0), 0.85, 68deg), $theta$)
  })
]
#losning[
  Om $theta$ ej är delbar med $pi$ så saknas egenvektorer, då $f(vb(x))$ aldrig är parallell med $vb(x)$.

  Om $theta = pi$ så är $f(vb(x)) = -vb(x)$ $forall vb(x) in RR^2$, så $lambda = -1$ är ett egenvärde med motsvarande egenvektorer $RR^2 without {vb(0)}$.
]

#exempel[
  #set enum(numbering: fnum("I.", gron))
  + $A = I ==> I vb(x) = vb(x) quad forall vb(x) ==> lambda = 1$ är ett egenvärde med egenvektorer $RR^n without {vb(0)}$.
  + $A = 0 ==> 0 vb(x) = vb(0) quad forall vb(x) ==> lambda = 0$ är ett egenvärde med egenvektorer $RR^n without {vb(0)}$.
]

#lemma[
  Antag att $vb(x)$ är en egenvektor till $A$ med egenvärde $lambda$ (dvs. $vb(x) != vb(0)$ och $A vb(x) = lambda vb(x)$). Då är $vb(x)$ en egenvektor till:
  #set enum(numbering: fnum("(i)", guld))
  + $A^k$ med egenvärde $lambda^k$, $k in NN$;
  + $c A$, $c in RR$, med egenvärde $c lambda$.
]
#bevis[
  #set enum(numbering: fnum("(i)", guld))
  + Låt $A^3 = B$.
    $
      B vb(x) & = A^3 vb(x) = A dot A dot A dot vb(x) = A dot A dot lambda dot vb(x) = lambda dot A dot A dot vb(x)
                = lambda dot A dot lambda dot vb(x) = lambda^2 dot A dot vb(x) \
              & = lambda^3 vb(x)
    $
  + Låt $c A = D$.
    $ D vb(x) = c A vb(x) = c lambda vb(x) $
]

#exempel[
  Låt $f(vb(x)) = A vb(x)$ där $A = mat(1, 3; 4, 2)$. Bestäm $A$:s egenvärden och egenvektorer.
]
#losning[
  Vi vill hitta $lambda in RR$, $vb(x) != vb(0)$ sådana att
  $ A vb(x) = lambda vb(x) <==> vb(0) = lambda vb(x) - A vb(x) = (lambda I - A) vb(x). $
  $(lambda I - A) vb(x) = vb(0)$ ska alltså ha en icke-trivial lösning $vb(x) != vb(0)$
  $
    & <==> (lambda I - A) "ej inverterbar" <==> det(lambda I - A) = 0 <==> \
    & det(lambda mat(1, 0; 0, 1) - mat(1, 3; 4, 2)) = 0 <==> det mat(lambda - 1, -3; -4, lambda - 2) = 0 <==> \
    & <==> (lambda - 1)(lambda - 2) - (-4)(-3) = 0 <==> dots <==> lambda^2 - 3 lambda - 10 = 0 <==> dots <==> \
    & <==> lambda_1 = -2 quad "&" quad lambda_2 = 5
  $
  $therefore A$ har egenvärdena $lambda_1 = -2$ & $lambda_2 = 5$.

  För att bestämma egenvektorerna behöver vi lösa $(lambda I - A) vb(x) = vb(0)$ med $lambda_1 = -2$ resp. $lambda_2 = 5$.

  #ihop[$underline(lambda_1 = -2):$]
  $
    & (-2 dot I - A) vb(x) = vb(0) <==> mat(-3, -3; -4, -4) vb(x) = vec(0, 0) \
    & ==> mat(-3, -3, 0; -4, -4, 0; augment: #2)
      limits(<==>)^(-1/3 R_1) mat(1, 1, 0; -4, -4, 0; augment: #2)
      <==> mat(1, 1, 0; 0, 0, 0; augment: #2) <==> \
    & <==> x_1 + x_2 = 0 ==> {x_2 = t} ==> vec(x_1, x_2) = vec(-t, t), quad t in RR without {0}.
  $

  #ihop[$underline(lambda_2 = 5):$]
  $
    & (5 I - A) vb(x) = vb(0) <==> mat(4, -3; -4, 3) vb(x) = vec(0, 0) ==> \
    & ==> mat(4, -3, 0; -4, 3, 0; augment: #2)
      limits(<==>)^(R_2 + R_1) mat(4, -3, 0; 0, 0, 0; augment: #2)
      <==> 4 x_1 - 3 x_2 = 0 \
    & ==> {x_2 = t} ==> cases(x_1 = 3/4 t, x_2 = t)
      limits(<==>)_(t = 4 s) cases(x_1 = 3 s, x_2 = 4 s) , quad s in RR without {0}.
  $

  #set enum(numbering: fnum("(i)", gron))
  $therefore A$ har:
  + $lambda_1 = -2$ med egenvektorer $t(-1, 1)$, $t in RR without {0}$,
  + $lambda_2 = 5$ med egenvektorer $s(3, 4)$, $s in RR without {0}$.
]

#ihop[*Allmän strategi:*]
- Lös $det(lambda I - A) = 0$ för att hitta egenvärden.
- Lös sedan $(lambda I - A) vb(x) = vb(0)$ för dessa $lambda$ för att hitta egenvektorer.

#definition[
  Låt $A$ vara av typ $n times n$.
  #set enum(numbering: fnum("(i)", bla))
  + $P_A (lambda) := det(lambda I - A)$ kallas för det *karakteristiska polynomet* för $A$.
  + Ekvationen $P_A (lambda) = 0$ kallas för den *karakteristiska ekvationen* för $A$.
]

#anmarkning[
  $P_A (lambda)$ är ett polynom av grad $n$ $==>$ antal reella egenvärden $<= n$.
]

#exempel[
  $A$ och $A^T$ har samma egenvärden, då:
  $
    P_(A^T) (lambda) = det(lambda I - A^T) = det(lambda I^T - A^T) = det((lambda I - A)^T) = det(lambda I - A) = P_A (lambda).
  $
  Samma egenvektorer?
]
#losning[
  *Svar:* Nej, i allmänhet.
  $
    & A = mat(0, 1; 0, 0), quad vb(x) = vec(1, 0) ==> A vb(x) = vec(0, 0) = 0 dot vec(1, 0) ==> \
    & ==> vb(x) "egenvektor till" A "med egenvärde" 0.
  $
  $
    A^T vb(x) = mat(0, 0; 1, 0) vec(1, 0) = vec(0, 1) != lambda vb(x) ==> vb(x) "ej egenvektor till" A^T.
  $
]

= Första exemplet (forts.)

$ vb(x)^((j + 1)) = A vb(x)^((j)), quad vb(x)^((0)) = vec(0\,6, 0\,4). $

Vill beräkna: $A^k vb(x)^((0))$ då $k -> oo$.

#ihop[Beräkna egenvärden och egenvektorer till $A = mat(0\,9, 0\,5; 0\,1, 0\,5)$:]
$
  P_A (lambda) & = det(lambda I - A) = mat(delim: "|", lambda - 0\,9, -0\,5; -0\,1, lambda - 0\,5)
                 = (lambda - 0,9)(lambda - 0,5) - 0,1 dot 0,5 = \
               & = lambda^2 - 1,4 lambda + 0,4 = 0 ==> lambda = 0,7 plus.minus sqrt(0\,49 - 0\,4) = 0,7 plus.minus 0,3 ==> \
               & ==> lambda_1 = 0,4, quad lambda_2 = 1
$

#ihop[$underline(lambda_1 = 0\,4):$]
$
  & (0,4 I - A) vb(x) = vb(0) ==> mat(-0\,5, -0\,5, 0; -0\,1, -0\,1, 0; augment: #2) <==> dots <==> \
  & <==> mat(1, 1, 0; 0, 0, 0; augment: #2) <==> x_1 + x_2 = 0 <==> cases(x_1 = -t, x_2 = t)
    <==> vb(x) = vec(-1, 1) t, quad t != 0.
$
Låt $vb(v)_1 = vec(1, -1)$ $(t = -1)$.

#ihop[$underline(lambda_2 = 1):$]
$
  & (I - A) vb(x) = vb(0) ==> dots ==> mat(1, -5, 0; 0, 0, 0; augment: #2) <==> x_1 - 5 x_2 = 0 <==> \
  & <==> cases(x_1 = 5 t, x_2 = t) <==> vb(x) = vec(5, 1) t, quad t != 0.
$
Låt $vb(v)_2 = vec(5, 1)$ $(t = 1)$.

#ihop[Bestäm nu $c_1, c_2 in RR$ sådana att $vb(x)^((0)) = c_1 vb(v)_1 + c_2 vb(v)_2$:]
$
  & <==> vec(0\,6, 0\,4) = mat(1, 5; -1, 1) vec(c_1, c_2) ==> mat(1, 5, 0\,6; -1, 1, 0\,4; augment: #2)
    <==> dots <==> mat(1, 0, -7/30; 0, 1, 1/6; augment: #2) ==> \
  & ==> vb(x)^((0)) = -7/30 vb(v)_1 + 1/6 vb(v)_2
$

#ihop[Då är]
$
  A^k dot vb(x)^((0)) & = A^k (-7/30 vb(v)_1 + 1/6 vb(v)_2) = -7/30 A^k vb(v)_1 + 1/6 A^k vb(v)_2
                        = -7/30 dot 0,4^k vb(v)_1 + 1/6 dot 1^k dot vb(v)_2 \
                      & limits(-->)_(k -> oo) 1/6 vb(v)_2 = vec(5\/6, 1\/6)
$

$therefore$ $5\/6$ friska, $1\/6$ sjuka i det långa loppet.
