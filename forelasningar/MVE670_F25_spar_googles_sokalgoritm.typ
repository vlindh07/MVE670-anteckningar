// =====================================================================
//  MVE670 Linjär algebra – Föreläsning 25 (12 oktober 2026)
//  Tas in i main.typ med #include "forelasningar/MVE670_F25_spar_googles_sokalgoritm.typ"
// =====================================================================
#import "../anteckningar-3b1b.typ": *
#nyforelasning(25, [Mer om egenvärden], [12 oktober 2026])

= Spåret

#definition[
  *Spåret* (eng. _trace_) av en $n times n$-matris $A = mat(a_11, dots, a_(1 n); dots.v, , dots.v; a_(n 1), dots, a_(n n))$ definieras som
  $ op("spår")(A) = a_11 + a_22 + dots + a_(n n) = sum_(j = 1)^n a_(j j) quad (op("tr")(A)). $
]

#exempel[
  $ A = mat(1, 3; 4, 2) ==> op("spår")(A) = 1 + 2 = 3 $
]

#sats[
  Antag att $A$ av typ $n times n$ har egenvärdena $lambda_1, dots, lambda_n$. Då gäller att:
  $
    op("spår")(A) & = lambda_1 + lambda_2 + dots + lambda_n = sum_(j = 1)^n lambda_j \
           det(A) & = lambda_1 dot lambda_2 dot dots dot lambda_n = product_(j = 1)^n lambda_j
  $
]

#exempel[
  Inte svårt att visa att $A = mat(1, 3; 4, 2)$ har egenvärdena $lambda_1 = -2$, $lambda_2 = 5$.
  $
    op("spår")(A) & = 3 = -2 + 5 \
           det(A) & = 2 - 12 = -10 = (-2) dot 5
  $
]

#bevis[
  Bygger på att vi kan skriva $P_A (lambda)$ på två olika sätt.

  #ihop[Å ena sidan har vi:]
  $ P_A (lambda) = det(lambda I - A) = "polynom av grad" n "med koeff." 1 "till" lambda^n $
  $
    ==> P_A (lambda) & = 1 dot (lambda - lambda_1)(lambda - lambda_2) dot dots dot (lambda - lambda_n) \
    & = lambda^n - (lambda_1 + lambda_2 + lambda_3 + dots + lambda_n) lambda^(n - 1) + dots + (-1)^n lambda_1 dot lambda_2 dot dots dot lambda_n quad (ast)
  $

  #ihop[Å andra sidan kan man visa att:]
  $ P_A (lambda) = lambda^n - (a_11 + a_22 + dots + a_(n n)) lambda^(n - 1) + dots + (-1)^n det(A) quad (ast ast) $

  Låt oss visa detta.

  #ihop[Att konstanten i $(ast ast)$ är $(-1)^n det(A)$ inses genom att låta $lambda = 0$ i $P_A (lambda)$:]
  $ P_A (0) = det(0 - A) = det(-A) = (-1)^n det(A) $
  $ therefore det(A) = lambda_1 dot dots dot lambda_n = product_(j = 1)^n lambda_j $

  Att koeff. för $lambda^(n - 1)$ är $op("spår")(A)$ visas genom induktion.

  #ihop[$underline(n = 2):$]
  $
    P_A (lambda) & = mat(delim: "|", lambda - a_11, -a_12; -a_21, lambda - a_22) = lambda^2 - a_11 lambda - a_22 lambda + "lägre ordningens termer (LOT)" \
    & = lambda^2 - a_11 lambda - a_22 lambda + "LOT"
  $
  $therefore$ Påst. ok då $n = 2$.

  #ihop[$underline(n = p):$ Antag att för $A$ av typ $p times p$ gäller att:]
  $ P_A (lambda) = lambda^p - (a_11 + dots + a_(p p)) lambda^(p - 1) + "LOT" $

  #ihop[$underline(n = p + 1):$ Antag nu $A$ av typ $(p + 1) times (p + 1)$. Då:]
  $
    P_A (lambda) & = det(lambda I - A) = mat(
      delim: "|",
      lambda - a_11, , , ast, ;
      , lambda - a_22, , , ;
      , , dots.down, , ;
      ast, , , lambda - a_(p p), ;
      , , , , lambda - a_((p + 1)(p + 1))
    ) = \
    & = {"kofaktorutv. längs rad" p + 1} = (-1)^((p + 1) + (p + 1)) (lambda - a_((p + 1)(p + 1)))
    mat(delim: "|", lambda - a_11, , ast; , dots.down, ; ast, , lambda - a_(p p)) + "LOT" = \
    & = (-1)^(2 p + 2) (lambda - a_((p + 1)(p + 1))) (lambda^p - (a_11 + dots + a_(p p)) lambda^(p - 1) + "LOT") = \
    & = lambda^(p + 1) - (a_11 + dots + a_(p p)) lambda^p - a_((p + 1)(p + 1)) lambda^p + "LOT" = \
    & = lambda^(p + 1) - (a_11 + dots + a_(p p) + a_((p + 1)(p + 1))) lambda^p + "LOT" = lambda^(p + 1) - op("spår")(A) lambda^p + "LOT"
  $
  $ therefore op("spår")(A) = lambda_1 + lambda_2 + dots + lambda_n = sum_(j = 1)^n lambda_j $
]

= Tillämpning: Googles sökalgoritm

En väldigt känd tillämpning av egenvärden och egenvektorer är idén bakom Googles sökalgoritm.

#ihop[*Modell:* Miniinternet.]
#figur({
  import cetz.draw: *
  let r = 0.3
  let nod = (n1: (0, 2), n2: (3, 2), n3: (0, 0), n4: (3, 0))
  // Riktad kant från p till q, förskjuten sträckan o åt vänster (sett i kantens riktning)
  let kant(p, q, o: 0, farg: ljusgra) = {
    let d = cetz.vector.sub(q, p)
    let u = cetz.vector.scale(d, 1 / cetz.vector.len(d))
    let nv = (-u.at(1), u.at(0))
    let s = calc.sqrt(r * r - o * o)
    let a = cetz.vector.add(cetz.vector.add(p, cetz.vector.scale(u, s)), cetz.vector.scale(nv, o))
    let b = cetz.vector.add(cetz.vector.sub(q, cetz.vector.scale(u, s + 0.02)), cetz.vector.scale(nv, o))
    vektor(a, b, farg, tjocklek: 1pt)
  }
  kant(nod.n1, nod.n2, o: -0.1)
  kant(nod.n2, nod.n1, o: -0.1)
  kant(nod.n1, nod.n3)
  kant(nod.n1, nod.n4)
  kant(nod.n2, nod.n4, o: -0.1, farg: objekt1)
  kant(nod.n4, nod.n2, o: -0.1)
  kant(nod.n3, nod.n4, o: -0.1)
  kant(nod.n4, nod.n3, o: -0.1)
  for (namn, p) in nod {
    circle(p, radius: r, fill: bakgrund, stroke: 1pt + textfarg)
    content(p, text(fill: textfarg, namn.slice(1)))
  }
  etikett((3.55, 2.1), [$<-$ nod = hemsida], anchor: "west")
  etikett((3.3, 1), [$<-$ riktad kant = $exists$ länk från sida 2 till 4], farg: objekt1, anchor: "west")
})

Skapa en matris $A$ som beskriver sannolikheten att gå från en sida till en annan.

#ihop[Om vi antar att alla möjliga klick från en sida är lika sannolika har vi:]
$
  a_(i j) & = "sannolikhet att gå från" i "till" j = \
          & = 1 / (\# "länkar från" i) dot cases(1 & "om" exists "länk" i -> j, 0 & "annars")
$

#ihop[I ex. ovan:]
$ A = mat(0, 1\/3, 1\/3, 1\/3; 1\/2, 0, 0, 1\/2; 0, 0, 0, 1; 0, 1\/2, 1\/2, 0) $

#sats[
  Elementet $a_(i j)^((k))$ i $A^k$ är sannolikheten att vi befinner oss i hemsida $j$ efter $k$ steg (klick) givet att vi startar i hemsida $i$.
]

$
  A^2 & = mat(0, 1\/3, 1\/3, 1\/3; 1\/2, 0, 0, 1\/2; 0, 0, 0, 1; 0, 1\/2, 1\/2, 0)
        mat(0, 1\/3, 1\/3, 1\/3; 1\/2, 0, 0, 1\/2; 0, 0, 0, 1; 0, 1\/2, 1\/2, 0) = \
      & = mat(1\/6, 1\/6, 1\/6, 1\/2; 0, 5\/12, 5\/12, 1\/6; 0, 1\/2, 1\/2, 0; 1\/4, 0, 0, 3\/4)
$
där t.ex.
$ a_11^((2)) = 1/6 = ("sanno." 1/3 "att gå" 1 -> 2) dot ("sanno." 1/2 "att gå" 2 -> 1). $

#ihop[Om $vb(x)$ är den fördelningsvektor som beskriver vår ursprungliga position så beskriver $vb(x)^T A^k$ var vi (sannolikhetsmässigt) befinner oss efter $k$ steg.]
$ vb(x)^T A^2 = mat(delim: "[", 1, 0, 0, 0) A^2 = underbrace(mat(1/6, 1/6, 1/6, 1/2), "1:a raden i" A^2) $

#definition[
  $vb(x)$ är en *stationär fördelning* till $A$ om $vb(x)^T A = vb(x)^T$, dvs. ytterligare steg (klick) påverkar inte fördelningen.
]

$therefore$ Om vi lyckas beräkna den stationära fördelningen har vi lyckats rangordna hemsidorna efter hur stor sannolikheten är att vi hamnar där "efter lång tid".

Detta är huvudidén bakom Googles sökalgoritm (från början).

=== Två frågor

*I.* Existerar alltid stationär fördelning? \
*II.* Hur beräknas denna effektivt?

#ihop[Vi har:]
$
  vb(x)^T A = vb(x)^T <==> (vb(x)^T A)^T = (vb(x)^T)^T <==> A^T vb(x) = vb(x)
$
så $vb(x)$ är egenvektor till $A^T$ med egenvärde 1.

*I.* $<==>$ Har $A^T$ alltid egenvärde 1? Svar: Ja! För alla sannolikhetsmatriser $A$ gäller att $vb(x) = vec(1, 1, dots.v, 1)$ är en egenvektor med motsvarande egenvärde 1 ($A$:s rader summerar alltid till 1). Vet att $A$ och $A^T$ har samma egenvärden.

Vet också att $A^T$ och $A$ #underline[inte] har samma egenvektorer.

*II.* $<==>$ Hur beräkna egenvektor till $A^T$ med egenvärde 1 effektivt?

Kan visa att för alla andra egenvärden $lambda_j$ till $A^T$ gäller att $abs(lambda_j) < 1$.

#ihop[Detta ger:]
$
  (A^T)^k vb(y) & = (A^T)^k (c_1 vb(v)_1 + dots + c_n vb(v)_n) = quad (vb(v)_n: "stationär fördeln.") \
  & = c_1 lambda_1^k vb(v)_1 + dots + c_n 1^k dot vb(v)_n limits(->)_(k -> oo) c_n vb(v)_n quad "då" abs(lambda_j) < 1 quad forall j = 1, dots, n - 1
$
