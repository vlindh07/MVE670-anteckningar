// =====================================================================
//  MVE670 Linjär algebra – Föreläsning 16 (25 september 2026)
//  Tas in i main.typ med #include "forelasningar/MVE670_F16_sammansattningar_basbyten.typ"
// =====================================================================
#import "../anteckningar-3b1b.typ": *
#nyforelasning(16, [Sammansättningar, inverser och basbyten], [25 september 2026])

= Sammansättningar

#sats[
  Om $f_A : RR^n -> RR^m$ och $f_B : RR^p -> RR^n$ är linjära avbildningar, så är sammansättningen
  $ f_A compose f_B : RR^p -> RR^m $
  linjär och har avbildningsmatris $A B$.

  #align(center, cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let r = 0.5
    let pil(farg) = (end: "stealth", fill: farg, scale: 0.8)
    for (i, rum) in ($RR^p$, $RR^n$, $RR^m$).enumerate() {
      circle((3 * i, 0), radius: r, stroke: 0.8pt + ljusgra)
      content((3 * i, -r - 0.35), text(fill: textfarg, rum))
    }
    bezier((r, 0.1), (3 - r, 0.1), (1.5, 0.35), stroke: 1.1pt + objekt2, mark: pil(objekt2))
    etikett((1.5, 0.55), $f_B$, farg: objekt2)
    bezier((3 + r, 0.1), (6 - r, 0.1), (4.5, 0.35), stroke: 1.1pt + objekt1, mark: pil(objekt1))
    etikett((4.5, 0.55), $f_A$, farg: objekt1)
    bezier((0.25, r - 0.05), (5.75, r - 0.05), (3, 2.3), stroke: 1.1pt + harlett, mark: pil(harlett))
    etikett((3, 1.75), $f_A compose f_B = f_(A B)$, farg: harlett)
  }))
]

#anmarkning[
  #set enum(numbering: fnum("(i)", gra))
  + $f_A compose f_B (vb(x)) = f_A (f_B (vb(x)))$.
  + $A$ är $m times n$, $B$ är $n times p$ och $A B$ är $m times p$.
]

#exempel[
  Bestäm matrisen för den linjära avbildningen i planet som består av att först rotera $pi/3$ moturs och sedan projicera på $x$-axeln.
]
#losning[
  Om $f_A$ roterar $pi/3$ moturs så är
  $
    f_A (vb(x)) = mat(cos pi/3, -sin pi/3; sin pi/3, cos pi/3) vb(x)
    = mat(1\/2, -sqrt(3)\/2; sqrt(3)\/2, 1\/2) vb(x).
  $
  #ihop[Om $f_B$ är ortogonal projektion på $x$-axeln så är]
  $ f_B (vb(x)) = (f_B (vb(e)_1) quad f_B (vb(e)_2)) vb(x) = mat(1, 0; 0, 0) vb(x). $
  #ihop[Om $f_C$ först roterar och sedan projicerar ortogonalt så är]
  $ f_C (vb(x)) = (f_C (vb(e)_1) quad f_C (vb(e)_2)) vb(x) = mat(1\/2, -sqrt(3)\/2; 0, 0) vb(x). $
  #ihop[Men vi har även att]
  $
    f_C (vb(x)) = f_B (f_A (vb(x))) = B A vb(x)
    = mat(1, 0; 0, 0) mat(1\/2, -sqrt(3)\/2; sqrt(3)\/2, 1\/2) vb(x)
    = mat(1\/2, -sqrt(3)\/2; 0, 0) vb(x),
  $
  dvs. $C = B A$.
]

Detta illustrerar varför matrismultiplikation är definierad på det sätt som den är, och även varför matrismultiplikation inte är kommutativ (dvs. $A B != B A$ i allmänhet).

= Inversa avbildningar

#sats[
  Antag att $f_A$ är linjär. Då gäller att
  #set enum(numbering: fnum("1)", guld))
  + $f_A$ inverterbar $<==> A$ inverterbar.
  + Om $f_A$ är inverterbar så är $(f_A)^(-1)$ linjär med avbildningsmatris $A^(-1)$, dvs. $(f_A)^(-1) = f_(A^(-1))$.
]

#bevis[
  #set enum(numbering: fnum("1)", guld))
  + Visades igår. #oklart[föreläsning 15 har samma datum (25 september); kontrollera datumet för föreläsning 16]
  + Vi har
    $
      f_(A^(-1)) compose f_A (vb(x)) & = A^(-1) A vb(x) = I vb(x) = vb(x), \
      f_A compose f_(A^(-1)) (vb(x)) & = A A^(-1) vb(x) = I vb(x) = vb(x).
    $
    Alltså är $f_(A^(-1))$ invers avbildning till $f_A$.
]

= Basbyten

#ihop[Ofta är det praktiskt att använda andra baser än standardbasen]
$ vb(e)_1 = vec(1, 0, dots.v, 0), quad dots, quad vb(e)_n = vec(0, dots.v, 0, 1), $
t.ex. vid ortogonal projektion/spegling i en linje eller ett plan (exempel senare).

#ihop[Om $vb(e)'_1, dots, vb(e)'_n$ är en bas för $RR^n$ och $vb(u) in RR^n$ så finns entydigt bestämda $u'_1, dots, u'_n in RR$ sådana att]
$ vb(u) = u'_1 vb(e)'_1 + dots + u'_n vb(e)'_n. $
#ihop[$(u'_1, dots, u'_n)$ är $vb(u)$:s _koordinater relativt basen_ $vb(e)'_1, dots, vb(e)'_n$. Vi låter]
$ E' = mat(bar.v, bar.v, , bar.v; vb(e)'_1, vb(e)'_2, dots, vb(e)'_n; bar.v, bar.v, , bar.v) quad (n times n"-matris") $
och skriver $(u'_1, dots, u'_n) = vb(u)_(E')$.

#exempel[
  Låt
  $ E' = mat(1, 1, 0; 2, 1, 1; 1, 0, 2) quad "och" quad vb(u) = vec(1, 2, 0). $
  Då bildar $E'$:s kolonner en bas för $RR^3$ (övning). Beräkna $vb(u)_(E')$.
]
#losning[
  Om $vb(u)_(E') = display(vec(u'_1, u'_2, u'_3))$ så är
  $
    u'_1 vec(1, 2, 1) + u'_2 vec(1, 1, 0) + u'_3 vec(0, 1, 2) = vec(1, 2, 0)
    <==> E' vb(u)_(E') = vb(u) ==> (E' thin | thin vb(u)).
  $
  #ihop[Gausselimination ger]
  $
    mat(1, 1, 0, 1; 2, 1, 1, 2; 1, 0, 2, 0; augment: #3) <==> dots <==>
    mat(1, 0, 0, 2; 0, 1, 0, -1; 0, 0, 1, -1; augment: #3)
    ==> vb(u)_(E') = vec(2, -1, -1).
  $
]

#ihop[Om $E'$:s kolonner är en bas för $RR^n$ och $vb(x) in RR^n$ så är]
$ vb(x) = E' vb(x)_(E'). $
#ihop[Om $tilde(E)$:s kolonner bildar en annan bas för $RR^n$ så är]
$ vb(x) = tilde(E) vb(x)_(tilde(E)). $
#ihop[Alltså]
$
  E' vb(x)_(E') = tilde(E) vb(x)_(tilde(E)) <==> cases(
    vb(x)_(tilde(E)) = tilde(E)^(-1) E' vb(x)_(E')\,,
    vb(x)_(E') = (E')^(-1) tilde(E) vb(x)_(tilde(E)).
  )
$

#definition[Notation – basbytesmatriser][
  $
    tilde(E)^(-1) E' = limits(S)_(tilde(E) <- E'), quad
    (limits(S)_(tilde(E) <- E'))^(-1) = (E')^(-1) tilde(E) = limits(S)_(E' <- tilde(E)).
  $
]

= Avbildningsmatris med avseende på andra baser

#definition[
  Om $f : RR^n -> RR^m$ är en linjär avbildning, $tilde(vb(e))_1, dots, tilde(vb(e))_n$ en bas för $RR^n$ och $tilde(vb(epsilon))_1, dots, tilde(vb(epsilon))_m$ en bas för $RR^m$, så är *avbildningsmatrisen för $f$ med avseende på $tilde(E)$ och $tilde(cal(E))$* den $m times n$-matris $A$ som uppfyller
  $ f(vb(x))_(tilde(cal(E))) = A vb(x)_(tilde(E)) = limits(A)_(tilde(cal(E)) <- tilde(E)) vb(x)_(tilde(E)). $

  #align(center, cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let pil = (end: "stealth", fill: ljusgra, scale: 0.8)
    line((-2.6, 0), (-0.5, 0), stroke: 0.9pt + ljusgra, mark: pil)
    line((0.5, 0), (2.6, 0), stroke: 0.9pt + ljusgra, mark: pil)
    rect((-0.5, -0.45), (0.5, 0.45), stroke: 0.9pt + objekt1)
    content((-2.85, 0), $tilde(E)$, anchor: "east")
    content((2.85, 0), $tilde(cal(E))$, anchor: "west")
    content((-1.55, 0.12), $RR^n$, anchor: "south")
    content((1.55, 0.12), $RR^m$, anchor: "south")
    content((0, -0.6), text(fill: objekt1, $limits(A)_(tilde(cal(E)) <- tilde(E))$), anchor: "north")
  }))
]

#pagebreak()
#anmarkning[
  #set enum(numbering: fnum("(i)", gra))
  + Om $vb(x)_(tilde(E)) = (tilde(x)_1, dots, tilde(x)_n)$, dvs. $vb(x) = tilde(x)_1 tilde(vb(e))_1 + dots + tilde(x)_n tilde(vb(e))_n$, så är
    $
      f(vb(x))_(tilde(cal(E))) & = f(tilde(x)_1 tilde(vb(e))_1 + dots + tilde(x)_n tilde(vb(e))_n)_(tilde(cal(E)))
      limits(=)^"linjär" tilde(x)_1 f(tilde(vb(e))_1)_(tilde(cal(E))) + dots + tilde(x)_n f(tilde(vb(e))_n)_(tilde(cal(E))) \
      & = underbrace((f(tilde(vb(e))_1)_(tilde(cal(E))) quad dots quad f(tilde(vb(e))_n)_(tilde(cal(E)))), limits(A)_(tilde(cal(E)) <- tilde(E)))
      underbrace(vec(tilde(x)_1, dots.v, tilde(x)_n), vb(x)_(tilde(E))).
    $
  + Om $f : RR^n -> RR^n$ är linjär och kolonnerna i $tilde(E) = (tilde(vb(e))_1, dots, tilde(vb(e))_n)$ är en bas för $RR^n$ så är
    $
      A_(tilde(E)) = limits(A)_(tilde(E) <- tilde(E))
      = (f(tilde(vb(e))_1)_(tilde(E)) quad dots quad f(tilde(vb(e))_n)_(tilde(E))).
    $
]

#exempel[
  Låt
  $
    tilde(E) = mat(
      1\/sqrt(3), 1\/sqrt(2), 1\/sqrt(6);
      1\/sqrt(3), -1\/sqrt(2), 1\/sqrt(6);
      1\/sqrt(3), 0, -2\/sqrt(6)
    )
  $
  vara en ortogonal matris och låt $f : RR^3 -> RR^3$ vara ortogonal projektion på planet $"Span"(tilde(vb(e))_1, tilde(vb(e))_2)$. Bestäm $A_(tilde(E))$.
]
#losning[
  $
    A_(tilde(E)) = (f(tilde(vb(e))_1)_(tilde(E)) quad f(tilde(vb(e))_2)_(tilde(E)) quad f(tilde(vb(e))_3)_(tilde(E)))
    = ((tilde(vb(e))_1)_(tilde(E)) quad (tilde(vb(e))_2)_(tilde(E)) quad vb(0)_(tilde(E)))
    = mat(1, 0, 0; 0, 1, 0; 0, 0, 0).
  $
]

Antag nu att uppgiften i stället hade varit: _Bestäm $A$ sådan att $f(vb(x)) = A vb(x)$._ Att bestämma $f(vb(e)_1)$, $f(vb(e)_2)$, $f(vb(e)_3)$ är jobbigt. I stället kan vi använda följande sats.

#sats[
  Antag att $f : RR^n -> RR^m$ är en linjär avbildning. Låt $limits(A)_(tilde(cal(E)) <- tilde(E))$ vara avbildningsmatrisen för $f$ med avseende på baserna $tilde(E)$ och $tilde(cal(E))$, och låt $limits(A)_(cal(E)' <- E')$ vara avbildningsmatrisen för $f$ med avseende på baserna $E'$ och $cal(E)'$. Då gäller att
  $
    limits(A)_(cal(E)' <- E') = limits(S)_(cal(E)' <- tilde(cal(E))) dot limits(A)_(tilde(cal(E)) <- tilde(E)) dot limits(S)_(tilde(E) <- E').
  $

  #align(center, cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let pil(farg) = (end: "stealth", fill: farg, scale: 0.8)
    for (y, A, E1, E2) in (
      (1.6, $limits(A)_(tilde(cal(E)) <- tilde(E))$, $tilde(E)$, $tilde(cal(E))$),
      (-1.6, $limits(A)_(cal(E)' <- E')$, $E'$, $cal(E)'$),
    ) {
      line((-2.4, y), (-0.4, y), stroke: 0.9pt + ljusgra, mark: pil(ljusgra))
      line((0.4, y), (2.4, y), stroke: 0.9pt + ljusgra, mark: pil(ljusgra))
      rect((-0.4, y - 0.35), (0.4, y + 0.35), stroke: 0.9pt + objekt1)
      content((0, y), text(fill: objekt1, $f$))
      content((-1.4, y + 0.1), $RR^n$, anchor: "south")
      content((1.4, y + 0.1), $RR^m$, anchor: "south")
      content((-1.4, y - 0.1), E1, anchor: "north")
      content((1.4, y - 0.1), E2, anchor: "north")
      content((0, y - 0.45), text(fill: objekt1, A), anchor: "north")
    }
    bezier((-2.7, -1.4), (-2.7, 1.4), (-3.4, 0), stroke: 1pt + harlett, mark: pil(harlett))
    etikett((-3.25, 0), $limits(S)_(tilde(E) <- E')$, farg: harlett, anchor: "east")
    bezier((2.7, 1.4), (2.7, -1.4), (3.4, 0), stroke: 1pt + harlett, mark: pil(harlett))
    etikett((3.25, 0), $limits(S)_(cal(E)' <- tilde(cal(E)))$, farg: harlett, anchor: "west")
  }))
]
