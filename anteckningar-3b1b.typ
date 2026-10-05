// =====================================================================
//  anteckningar-3b1b.typ – föreläsningsanteckningar i 3Blue1Brown-stil
//  (matematik & fysik). Ändra INTE per dokument – all layout bor här.
//  v1.0. Kräver Typst ≥ 0.14.
//
//  FÄRG = BETYDELSE. Varje färg betyder exakt en sak inom sitt lager:
//   Lager 1 – rutor (vilken sorts påstående):
//     blå = definition · turkos = lag/axiom (antas gälla) · guld = sats
//     (bevisat) · gul ram = nyckelformel · grön = exempel/lösning ·
//     lila = intuition · röd = varning · grå = anmärkning · rosa = oklart
//   Lager 2 – objekt i figurer och färgade symboler (se rollnamnen nedan).
// =====================================================================

// ---------- Paket (låsta versioner) ----------
#import "@preview/physica:0.9.8": dv, pdv, dd, vb, vu, va, grad, div, curl, laplacian, evaluated, order, hbar, bra, ket, braket, ketbra, expval, mel, mdet, dmat, imat, zmat, jmat, hmat, tensor, isotope, Re, Im, sgn, rank, trace, Trace, diag
#import "@preview/zero:0.7.1": num, quan, zi, set-num, set-unit
#import "@preview/cetz:0.5.2"
#import "@preview/lilaq:0.6.0" as lq
#import "@preview/tiptoe:0.4.0"

// ---------- Palett (3Blue1Brown / Manim) ----------
#let bakgrund = rgb("#111111")
#let textfarg = rgb("#E6E6E6")
#let bla = rgb("#58C4DD")      // BLUE_C
#let turkos = rgb("#5CD0B3")   // TEAL_C
#let gron = rgb("#83C167")     // GREEN_C
#let gul = rgb("#FFFF00")      // YELLOW_C
#let guld = rgb("#F0AC5F")     // GOLD_C
#let orange = rgb("#FF862F")   // ORANGE
#let rod = rgb("#FC6255")      // RED_C
#let lila = rgb("#B189C6")     // PURPLE_B
#let rosa = rgb("#D147BD")     // PINK – reserverad för #oklart
#let ljusgra = rgb("#BBBBBB")  // GREY_B
#let gra = rgb("#888888")      // GREY_C
#let morkgra = rgb("#444444")  // GREY_D
#let rutnatfarg = rgb("#29ABCA").transparentize(55%)

// ---------- Lager 2: objektroller (använd rollnamnet, inte färgen) ----------
// Geometri / linjär algebra / analys
#let basx = gron        // x-riktning, î, e₁
#let basy = rod         // y-riktning, ĵ, e₂
#let basz = bla         // z-riktning, k̂, e₃
#let objekt1 = gul       // huvudobjektet: v, f, kurvan, punkten som studeras
#let objekt2 = lila      // andra objektet: w, g
#let objekt3 = turkos    // tredje objektet
#let harlett = orange    // härlett/resultat: Av, f′, tangent, projektion, v + w
#let hjalp = gra         // hjälplinjer, konstruktion, asymptoter (streckat)
// Fysik
#let lage = gul          // läge, förflyttning: r, s, x(t)
#let hastighet = gron    // v
#let acceleration = orange // a
#let kraft = rod         // F (alla krafter)
#let rorelsemangd = bla  // p, impuls
#let rotation = lila     // ω, α, τ, L
#let falt = turkos       // E, B, g-fält, flödeslinjer
#let energi = guld       // E, W, staplar/ytor för energi
#let materia = morkgra   // kroppar och massor (fyllning)

// Kompatibilitet med typst-anteckningar (gamla namn)
#let accent = guld
#let defbla = bla
#let exgron = gron
#let fysgul = turkos
#let huvud = bla

// ---------- Egna förkortningar ----------
#let ee = math.upright("e")           // Eulers tal: $ee^(i x)$
#let lightning = sym.arrow.zigzag     // motsägelse: $lightning$
#let fg(farg, x) = text(fill: farg, x) // färga symbol: $fg(objekt1, vb(v))$

// ---------- Internt tillstånd ----------
#let _kurs = state("a3b-kurs", (kurs: [], kurskod: [], amne: "matematik"))
#let _fdatum = state("a3b-fdatum", none)
#let _rutnr = counter("a3b-rutnr")
#let _manader = ("januari", "februari", "mars", "april", "maj", "juni", "juli",
  "augusti", "september", "oktober", "november", "december")
#let _idag = {
  let d = datetime.today()
  [#d.day() #_manader.at(d.month() - 1) #d.year()]
}
#let _fnr() = counter(heading).get().first()
#let _ton(farg, p) = color.mix((farg, p), (bakgrund, 100% - p))
#let _gradient = gradient.linear(bla, turkos)

// ---------- Ny föreläsning ----------
// #nyforelasning(17, [Determinanter], [28 september 2026])
#let nyforelasning(nr, rubrik, datum) = {
  pagebreak(weak: true)
  counter(heading).update(nr - 1)
  _rutnr.update(0)
  counter(math.equation).update(0)
  _fdatum.update(datum)
  heading(level: 1, rubrik)
}

// ---------- Rutor (lager 1) ----------
// #definition[Innehåll] eller #definition[Namn][Innehåll]
#let _namn-och-innehall(args) = {
  let p = args.pos()
  let namn = args.named().at("namn", default: none)
  if p.len() == 2 { (p.at(0), p.at(1)) } else { (namn, p.at(0)) }
}

#let _ruta(farg, etikett, body, liten: false, fet-i-farg: false) = block(
  width: 100%, breakable: true,
  fill: _ton(farg, 9%),
  stroke: (left: 2pt + farg),
  inset: (left: 3.5mm, right: 3mm, top: 2.2mm, bottom: 2.4mm),
  above: 1em, below: 1em,
  {
    set enum(numbering: n => text(fill: farg, weight: "bold")[#n.])
    show strong: set text(fill: farg) if fet-i-farg
    set text(size: 0.93em) if liten
    text(fill: farg, weight: "bold", etikett)
    h(0.5em)
    body
  },
)

#let _numrerad(farg, typ, fet-i-farg: false) = (..args) => {
  let (namn, body) = _namn-och-innehall(args)
  _ruta(farg, {
    _rutnr.step()
    typ + " "
    context [#_fnr().#_rutnr.get().first()]
    if namn != none [ (#namn)]
    "."
  }, body, fet-i-farg: fet-i-farg)
}

#let _onumrerad(farg, typ, liten: false) = (..args) => {
  let (namn, body) = _namn-och-innehall(args)
  _ruta(farg, [#typ#if namn != none [ (#namn)].], body, liten: liten)
}

#let definition = _numrerad(bla, "Definition", fet-i-farg: true)
#let lag = _numrerad(turkos, "Lag")
#let axiom = _numrerad(turkos, "Axiom")
#let sats = _numrerad(guld, "Sats")
#let lemma = _numrerad(guld, "Lemma")
#let foljdsats = _numrerad(guld, "Följdsats")
#let exempel = _onumrerad(gron, "Exempel")
#let intuition = _onumrerad(lila, "Intuition")
#let varning = _onumrerad(rod, "Varning")
#let anmarkning = _onumrerad(gra, "Anmärkning", liten: true)

// Nyckelformel – gul ram runt formeln (3b1b:s ”SurroundingRectangle”)
// #formel[$ ... $] eller #formel[Titel][$ ... $]
#let formel(..args) = {
  let (titel, body) = _namn-och-innehall(args)
  block(width: 100%, above: 1.1em, below: 1.1em, breakable: false, align(center, block(
    stroke: 1pt + gul, inset: (x: 5mm, y: 2.5mm),
    {
      show math.equation.where(block: true): set block(above: 0pt, below: 0pt)
      if titel != none { block(below: 2.5mm, align(left, text(fill: gul, weight: "bold", size: 0.85em, titel))) }
      body
    },
  )))
}

// Bevis (tillhör satsen – guld) och lösning (tillhör exemplet – grön)
// #bevis[...] → ”Bevis.”   #bevis[av sats 17.2][...] → ”Bevis av sats 17.2.”
#let bevis(..args) = {
  let (titel, body) = _namn-och-innehall(args)
  block(width: 100%, above: 1em, below: 1em, breakable: true)[
    #text(fill: guld, weight: "bold")[Bevis#if titel != none [ #titel].]
    #body#h(1fr)#text(fill: guld)[$square.filled$]
  ]
}
#let losning(body) = block(width: 100%, above: 1em, below: 1em, breakable: true)[
  #text(fill: gron, weight: "bold")[Lösning.]
  #body#h(1fr)#text(fill: gron)[$square$]
]

// Håll en inledande mening ihop med figuren/grafen/formeln direkt efter
// (hindrar att meningen blir ensam längst ned på en sida): #ihop[Virvelfältet:]
#let ihop(body) = block(sticky: true, breakable: false, above: 1.3em, below: 0.65em, body)

// Färgad numrering i listor inne i rutor: #set enum(numbering: fnum("(i)", guld))
#let fnum(monster, farg) = (..n) => text(fill: farg, weight: "bold", numbering(monster, ..n))

// Osäker läsning av handstil (rosa används ALDRIG till annat)
#let oklart(body) = text(fill: rosa)[[_oklart:_ #body]]

// =====================================================================
//  Figurer (CetZ) – använd alltid dessa hjälpare så att allt ser likadant ut
//  #figur({ rutnat(x: (-3, 3), y: (-2, 2)); vektor((0, 0), (2, 1), objekt1, etikett: $vb(v)$) })
// =====================================================================
// Etikett med mörk kontur bakom bokstäverna (Manims ”background stroke”)
#let _halo(farg, x) = box({
  place(text(fill: bakgrund, stroke: 1.8pt + bakgrund, x))
  text(fill: farg, x)
})

#let figur(langd: 1cm, body) = block(width: 100%, above: 1.1em, below: 1.1em, breakable: false,
  align(center, cetz.canvas(length: langd, body)))

// Koordinatrutnät à la 3b1b: dämpat blått rutnät, ljusgrå axlar med pilar
#let rutnat(x: (-4, 4), y: (-3, 3), steg: 1, axlar: true, rutor: true, siffror: false,
  xetikett: $x$, yetikett: $y$) = {
  import cetz.draw: *
  let (x0, x1) = x
  let (y0, y1) = y
  if rutor {
    let nx = int(calc.round((x1 - x0) / steg))
    let ny = int(calc.round((y1 - y0) / steg))
    for i in range(nx + 1) { let xi = x0 + i * steg; line((xi, y0), (xi, y1), stroke: 0.6pt + rutnatfarg) }
    for j in range(ny + 1) { let yj = y0 + j * steg; line((x0, yj), (x1, yj), stroke: 0.6pt + rutnatfarg) }
  }
  if axlar {
    let pil = (end: "stealth", fill: ljusgra, scale: 0.7)
    if y0 <= 0 and 0 <= y1 { line((x0, 0), (x1 + 0.35, 0), stroke: 0.9pt + ljusgra, mark: pil) }
    if x0 <= 0 and 0 <= x1 { line((0, y0), (0, y1 + 0.35), stroke: 0.9pt + ljusgra, mark: pil) }
    if xetikett != none { content((x1 + 0.4, 0), text(fill: ljusgra, xetikett), anchor: "west") }
    if yetikett != none { content((0, y1 + 0.4), text(fill: ljusgra, yetikett), anchor: "south") }
  }
  if siffror {
    let nx = int(calc.round((x1 - x0) / steg))
    let ny = int(calc.round((y1 - y0) / steg))
    for i in range(nx + 1) {
      let xi = x0 + i * steg
      if xi != 0 { content((xi, -0.08), text(size: 7.5pt, fill: gra, num(xi)), anchor: "north") }
    }
    for j in range(ny + 1) {
      let yj = y0 + j * steg
      if yj != 0 { content((-0.08, yj), text(size: 7.5pt, fill: gra, num(yj)), anchor: "east") }
    }
  }
}

// Geometri: punkten `p` flyttad sträckan `langd` i riktningen `riktning` (vinkel)
// flytta((0, 0), 2, 30deg) = (2 cos 30°, 2 sin 30°)
#let flytta(p, langd, riktning) = (p.at(0) + langd * calc.cos(riktning), p.at(1) + langd * calc.sin(riktning))

// Vektor/pil med etikett strax bortom spetsen (eller vid `vid`, med `anchor`)
#let vektor(fran, till, farg, etikett: none, vid: none, anchor: "center", tjocklek: 1.6pt, streckad: false) = {
  let ankare = anchor
  import cetz.draw: *
  let st = (paint: farg, thickness: tjocklek)
  if streckad { st.insert("dash", "dashed") }
  line(fran, till, stroke: st, mark: (end: "stealth", fill: farg, scale: 0.9 * tjocklek / 1.6pt))
  if etikett != none {
    let pos = if vid != none { vid } else {
      let d = cetz.vector.sub(till, fran)
      let l = cetz.vector.len(d)
      cetz.vector.add(till, cetz.vector.scale(d, 0.3 / l))
    }
    content(pos, _halo(farg, etikett), anchor: ankare)
  }
}

#let punkt(p, farg: textfarg, etikett: none, anchor: "south-west", radie: 0.06) = {
  let ankare = anchor
  import cetz.draw: *
  circle(p, radius: radie, fill: farg, stroke: none)
  if etikett != none { content(p, _halo(farg, etikett), anchor: ankare, padding: 0.1) }
}

// Fristående text i en figur (färg = objektets färg)
#let etikett(pos, body, farg: textfarg, anchor: "center") = {
  cetz.draw.content(pos, _halo(farg, body), anchor: anchor)
}

#let hjalplinje(fran, till, farg: hjalp) = {
  import cetz.draw: *
  line(fran, till, stroke: (paint: farg, thickness: 0.8pt, dash: "dashed"))
}

// Yta (area, determinant, integral): fyllning i objektets färg
#let yta(..punkter, farg: objekt1, kant: false) = {
  import cetz.draw: *
  line(..punkter, close: true, fill: farg.transparentize(72%),
    stroke: if kant { 0.8pt + farg } else { none })
}

#let vinkel(spets, fran, till, etikett: none, radie: 0.5, farg: textfarg) = {
  import cetz.draw: *
  cetz.angle.angle(spets, fran, till, radius: radie, label: if etikett != none { text(fill: farg, etikett) },
    stroke: 0.8pt + farg, label-radius: radie + 0.28)
}

// Fysik: kropp (grå fyllning), underlag med streckning, fjäder
#let kropp(horn1, horn2, etikett: none) = {
  import cetz.draw: *
  rect(horn1, horn2, fill: materia, stroke: 0.8pt + ljusgra, radius: 0.04)
  if etikett != none {
    content((horn1, 50%, horn2), text(fill: textfarg, etikett))
  }
}
// Kropp som vilar på en lutande yta: `kontakt` = mittpunkt på undersidan
// (ligger på ytan), `lutning` = ytans vinkel. Masscentrum blir
// flytta(kontakt, hojd / 2, lutning + 90deg).
#let kropp-pa-plan(kontakt, bredd: 1, hojd: 0.6, lutning: 0deg, etikett: none) = {
  import cetz.draw: *
  let a = flytta(kontakt, -bredd / 2, lutning)
  let b = flytta(kontakt, bredd / 2, lutning)
  let c = flytta(b, hojd, lutning + 90deg)
  let d = flytta(a, hojd, lutning + 90deg)
  line(a, b, c, d, close: true, fill: materia, stroke: 0.8pt + ljusgra)
  if etikett != none {
    content(flytta(kontakt, hojd / 2, lutning + 90deg), text(fill: textfarg, etikett))
  }
}
#let underlag(fran, till, streck: 0.18) = {
  import cetz.draw: *
  line(fran, till, stroke: 1pt + ljusgra)
  let n = int(calc.round(cetz.vector.dist(fran, till) / 0.25))
  for i in range(n) {
    let p = cetz.vector.lerp(fran, till, (i + 0.5) / n)
    line(p, (rel: (-streck, -streck)), stroke: 0.5pt + gra)
  }
}
#let fjader(fran, till, varv: 8, amplitud: 0.18) = {
  cetz.decorations.zigzag(cetz.draw.line(fran, till), amplitude: amplitud, segments: varv,
    stroke: 1pt + ljusgra, start: 10%, end: 10%)
}

// =====================================================================
//  Grafer (Lilaq) – #graf(...) tar samma argument som lq.diagram
//  #graf(xlim: (-3, 3), lq.plot(xs, xs.map(f), stroke: objekt1 + 1.5pt, mark: none))
// =====================================================================
#let linspace = lq.linspace
#let _filt(varde, avstand) = varde != 0 and avstand >= 5pt
// xsteg/ysteg = avstånd mellan skalstreck. xaxis/yaxis slås ihop med 3b1b-axlarna.
#let graf(xsteg: auto, ysteg: auto, xaxis: (:), yaxis: (:), ..args) = {
  let bas = (position: 0, filter: _filt, subticks: none)
  let xa = bas + if xsteg != auto { (tick-distance: xsteg) } else { (:) } + xaxis
  let ya = bas + if ysteg != auto { (tick-distance: ysteg) } else { (:) } + yaxis
  block(width: 100%, above: 1.1em, below: 1.1em, breakable: false,
    align(center, lq.diagram(xaxis: xa, yaxis: ya, ..args)))
}
// Etikett direkt vid en kurva (i kurvans färg) – används i stället för förklaringsruta
// grafetikett(2, 1.5, $f(x)$, farg: objekt1, align: left + bottom)
#let grafetikett(x, y, body, farg: textfarg, align: left + bottom) = lq.place(x, y, align: align,
  pad(0.25em, _halo(farg, body)))

#let _lq-tema(it) = {
  show: lq.set-diagram(width: 9cm, height: 5.5cm,
    cycle: (objekt1, objekt2, objekt3, harlett, bla, gron))
  show: lq.set-spine(stroke: 0.9pt + ljusgra, tip: tiptoe.stealth)
  show: lq.set-tick(inset: 2pt, outset: 2pt, pad: 0.4em, stroke: 0.6pt + ljusgra)
  show: lq.show_(lq.tick-label, it => text(size: 0.8em, fill: gra, it))
  show: lq.set-grid(stroke: none)
  show: lq.set-label(pad: none, angle: 0deg)
  show: lq.show_(lq.label.with(kind: "y"), it => place(bottom + right, dy: -100%, dx: -0.5em, text(fill: ljusgra, it)))
  show: lq.show_(lq.label.with(kind: "x"), it => place(left + top, dx: 100%, dy: 0.4em, text(fill: ljusgra, it)))
  show: lq.set-legend(fill: _ton(textfarg, 6%), stroke: 0.5pt + morkgra, radius: 2pt)
  it
}

// =====================================================================
//  Titelsidans grafik – rutnät som gradvis deformeras från I till A
// =====================================================================
#let _framsida-rutnat = {
  let (W, H) = (10.5, 14.85)   // halva A4 i cm, origo i sidans mitt
  // Klipp sträckan p–q mot sidan (Liang–Barsky)
  let klipp(p, q) = {
    let (dx, dy) = (q.at(0) - p.at(0), q.at(1) - p.at(1))
    let (t0, t1) = (0, 1)
    for (pp, qq) in ((-dx, p.at(0) + W), (dx, W - p.at(0)), (-dy, p.at(1) + H), (dy, H - p.at(1))) {
      if pp == 0 {
        if qq < 0 { return none }
      } else {
        let r = qq / pp
        if pp < 0 {
          if r > t1 { return none }
          t0 = calc.max(t0, r)
        } else {
          if r < t0 { return none }
          t1 = calc.min(t1, r)
        }
      }
    }
    ((p.at(0) + t0 * dx, p.at(1) + t0 * dy), (p.at(0) + t1 * dx, p.at(1) + t1 * dy))
  }
  let A = ((1.25, 0.9), (-0.55, 1.05))
  let (o, s, N) = ((2.5, -7), 2.2, 14)
  let farger = gradient.linear(bla, turkos, gron)
  place(top + left, cetz.canvas(length: 1cm, {
    import cetz.draw: *
    rect((-W, -H), (W, H), stroke: none)
    for t in range(N + 1) {
      let tau = t / N
      let M = ((1 + tau * (A.at(0).at(0) - 1), tau * A.at(0).at(1)),
        (tau * A.at(1).at(0), 1 + tau * (A.at(1).at(1) - 1)))
      let f((x, y)) = (o.at(0) + s * (M.at(0).at(0) * x + M.at(0).at(1) * y),
        o.at(1) + s * (M.at(1).at(0) * x + M.at(1).at(1) * y))
      let st = if t == N { 0.9pt + farger.sample(100%) } else { 0.5pt + farger.sample(tau * 100%).transparentize(55%) }
      for i in range(-12, 13) {
        for (p, q) in ((f((i, -14)), f((i, 14))), (f((-14, i)), f((14, i)))) {
          let c = klipp(p, q)
          if c != none { line(c.at(0), c.at(1), stroke: st) }
        }
      }
    }
  }))
  // tona bort rutnätet uppåt så att titeln syns
  place(top, rect(width: 100%, height: 52%, fill: gradient.linear(
    (bakgrund, 0%), (bakgrund, 45%), (bakgrund.transparentize(100%), 100%), angle: 90deg)))
}

// =====================================================================
//  Huvudmall – #show: anteckningar.with(kurs: [...], kurskod: [...], ...)
// =====================================================================
#let anteckningar(
  kurs: [],
  kurskod: [],
  termin: [],
  amne: "matematik",               // "matematik" | "fysik"
  titel: [Föreläsningsanteckningar],
  forfattare: [],
  forhandsvisning: false,          // true = ingen titelsida/innehåll
  body,
) = {
  set document(title: [#kurskod #kurs – #titel])
  set text(font: "New Computer Modern", size: 11pt, lang: "sv", region: "se", fill: textfarg)
  set par(justify: true, leading: 0.65em, spacing: 1.3em, first-line-indent: 0pt)
  set page(
    paper: "a4",
    fill: bakgrund,
    margin: (x: 22mm, top: 24mm, bottom: 22mm),
    header: context {
      let sida = here().page()
      let pa-sidan = query(heading.where(level: 1)).filter(h => h.location().page() == sida)
      if pa-sidan.len() > 0 { return }
      let fore = query(selector(heading.where(level: 1)).before(here()))
      if fore.len() == 0 { return }
      let senaste = fore.last()
      set text(size: 8.5pt, fill: gra)
      [#kurskod #kurs]
      h(1fr)
      [Föreläsning #counter(heading).at(senaste.location()).first() #h(0.4em)·#h(0.4em) #_fdatum.at(senaste.location())]
    },
    footer: context {
      if not forhandsvisning and here().page() == 1 { return }
      set text(size: 8.5pt, fill: gra)
      align(center)[#counter(page).display() / #counter(page).final().first()]
    },
  )
  _kurs.update((kurs: kurs, kurskod: kurskod, amne: amne))

  // ---------- Matematik & enheter ----------
  show math.equation: it => {
    show ",": math.class("normal", ",")   // decimalkomma: $3,14$
    it
  }
  set-num(decimal-separator: ",", product: sym.dot)
  set-unit(fraction: "inline")
  set math.equation(supplement: none, numbering: n => {
    text(fill: gra, numbering("(1.1)", counter(heading).get().first(), n))
  })
  show math.equation.where(block: true): it => {
    if it.numbering != none and not it.has("label") {
      counter(math.equation).update(n => n - 1)
      math.equation(it.body, block: true, numbering: none)
    } else { it }
  }
  show ref: set text(fill: bla)

  // ---------- Rubriker ----------
  set heading(offset: 1, numbering: (..n) => {
    if n.pos().len() <= 3 { numbering("1.1", ..n) }
  })
  show heading.where(level: 1): it => context {
    let k = _kurs.get()
    let meta(x) = text(size: 8.5pt, fill: gra, tracking: 0.1em, upper(x))
    block(width: 100%, above: 0pt, below: 1.6em, sticky: true, stack(
      grid(columns: (1fr, auto),
        meta[Föreläsning #_fnr() #h(0.5em)·#h(0.5em) #_fdatum.get()],
        meta[#k.kurskod #h(0.5em)·#h(0.5em) #k.kurs]),
      v(5mm),
      block(text(size: 26pt, fill: white, hyphenate: false, it.body)),
      v(3.5mm),
      box(width: 100%, height: 1.6pt, fill: _gradient),
    ))
  }
  show heading.where(level: 2): it => block(above: 1.8em, below: 0.9em, sticky: true, {
    set par(justify: false)
    text(size: 15pt, fill: white)[
      #if it.numbering != none { text(fill: bla, counter(heading).display(it.numbering)); h(0.7em) }#it.body
    ]
  })
  show heading.where(level: 3): it => block(above: 1.4em, below: 0.7em, sticky: true, {
    set par(justify: false)
    text(size: 12.5pt, fill: white)[
      #if it.numbering != none { text(fill: bla, counter(heading).display(it.numbering)); h(0.6em) }#it.body
    ]
  })
  show heading.where(level: 4): it => block(above: 1.1em, below: 0.6em, sticky: true,
    text(weight: "bold", fill: white, it.body))

  // ---------- Listor, tabeller, betoning ----------
  set list(marker: text(fill: bla, size: 0.7em, baseline: -0.15em)[$triangle.filled.r$])
  set enum(numbering: n => text(fill: bla, weight: "bold")[#n.])
  show strong: set text(fill: white)
  set table(stroke: (x, y) => (
    top: if y == 0 { 0.8pt + ljusgra } else if y == 1 { 0.5pt + gra } else { 0.3pt + morkgra },
    bottom: 0.8pt + ljusgra,
  ), inset: (x: 7pt, y: 5pt))
  show table.cell.where(y: 0): set text(weight: "bold", fill: white)

  // ---------- Grafer ----------
  show: _lq-tema

  // ---------- Titelsida + innehåll ----------
  if not forhandsvisning {
    page(header: none, footer: none, background: _framsida-rutnat, {
      v(6mm)
      stack(
        text(size: 10pt, fill: gra, tracking: 0.15em, upper(kurskod)),
        v(4mm),
        block(text(size: 34pt, fill: white, hyphenate: false, kurs)),
        v(5mm),
        box(width: 45%, height: 2pt, fill: _gradient),
        v(6mm),
        text(size: 14pt, fill: ljusgra, titel),
        v(8mm),
        if forfattare != [] { text(fill: textfarg, forfattare) },
        if forfattare != [] { v(2mm) },
        text(fill: gra, termin),
      )
      v(1fr)
      box(fill: bakgrund, inset: (x: 2mm, y: 1.5mm), outset: (x: -2mm),
        text(size: 8.5pt, fill: gra)[Senast kompilerad #_idag])
    })

    block(below: 1.6em, stack(
      text(size: 26pt, fill: white)[Innehåll],
      v(3.5mm),
      box(width: 100%, height: 1.6pt, fill: _gradient),
    ))
    set outline.entry(fill: text(fill: morkgra, repeat[.#h(4pt)]))
    show outline.entry.where(level: 1): it => {
      v(1.1em, weak: true)
      link(it.element.location(), it.indented(
        text(fill: bla, it.prefix()),
        [#text(fill: white, it.body()) #h(0.6em) #text(size: 8.5pt, fill: gra, _fdatum.at(it.element.location())) #h(1fr) #text(fill: gra, it.page())],
      ))
    }
    show outline.entry.where(level: 2): it => link(it.element.location(), it.indented(
      text(fill: bla.transparentize(25%), it.prefix()),
      [#it.body() #box(width: 1fr, it.fill) #text(fill: gra, it.page())],
    ))
    outline(title: none, depth: 2, indent: auto)
  }

  body
}
