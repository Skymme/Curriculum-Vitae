// template.typ
// Mise en page graphique des CV (main.typ, main_data.typ).
//
// Une page A4 aux marges d'impression sûres : un en-tête d'identité sur fond
// blanc, puis deux colonnes. Le parcours, lu en premier, occupe la colonne de
// gauche (lignes d'environ 80 caractères) ; les compétences et les langues
// vivent dans une colonne latérale teintée à droite.
//
// Trois niveaux de texte seulement : titre de poste, entreprise et corps,
// dates et lieux en gris.

#import "style.typ": cvaccent, linegray

// ── Mesures ─────────────────────────────────────────────────────
#let side-width = 58mm
#let gutter = 7mm
#let side-pad = 4.5mm

// ── Typographie ─────────────────────────────────────────────────
#let size-name = 26pt
#let size-title = 12.5pt
#let size-role = 10.5pt
#let size-body = 9.2pt
#let size-meta = 8.4pt

// ── Palette propre à cette mise en page ─────────────────────────
#let ink = rgb("#18212d")       // noms, titres
#let body-ink = rgb("#2e3742")  // texte courant (12,6:1 sur blanc)
#let quiet = rgb("#5f6670")     // dates, lieux (6,1:1 sur blanc)
#let side-fill = rgb("#f2f5f9")
#let chip-fill = rgb("#e2eaf3")

// ── En-tête ─────────────────────────────────────────────────────
#let contact-line(icon, label, url: none) = {
  let row = [#box(baseline: 18%, image("icons/" + icon + ".svg", height: 8.5pt))#h(5pt)#label]
  if url == none { row } else { link(url, row) }
}

#let cv-header(personal) = grid(
  columns: (1fr, side-width),
  column-gutter: gutter,
  stack(
    text(size: size-name, weight: "bold", fill: ink, personal.name),
    v(3.4mm),
    text(size: size-title, weight: "bold", fill: cvaccent, personal.title),
    v(3.6mm),
    {
      // Pas de coupure dans un mot composé : « scikit-learn » coupé en fin de
      // ligne est relu « scikitlearn » par un parseur de CV.
      show regex("\p{L}+(-\p{L}+)+"): box
      par(leading: 0.62em, text(size: size-body, fill: body-ink, personal.summary))
    },
  ),
  pad(left: side-pad, top: 1.4mm, {
    set text(size: 8.8pt, fill: body-ink)
    stack(
      spacing: 3mm,
      contact-line("mail", personal.email, url: "mailto:" + personal.email),
      contact-line("phone", personal.phone),
      contact-line("linkedin-line", personal.linkedin-title, url: personal.linkedin-url),
      contact-line("github-line", personal.github-title, url: personal.github-url),
      contact-line("globe", personal.website-title, url: personal.website-url),
    )
  }),
)

// ── Colonne principale ──────────────────────────────────────────
#let main-heading(title) = block(below: 4mm, grid(
  columns: (auto, 1fr),
  column-gutter: 3mm,
  align: horizon,
  text(size: 9.5pt, weight: "bold", fill: cvaccent, tracking: 0.1em, upper(title)),
  line(length: 100%, stroke: 0.6pt + linegray),
))

#let entry(e) = block(width: 100%, breakable: false, below: 5.8mm, {
  set par(leading: 0.55em, spacing: 0.55em)
  text(size: size-role, weight: "bold", fill: ink, e.poste)
  h(1fr)
  text(size: size-meta, fill: quiet, e.periode)
  linebreak()
  text(size: size-body, weight: "bold", fill: cvaccent, e.entreprise)
  text(size: size-body, fill: quiet, [ · #e.lieu])
  if e.missions != none {
    v(1.6mm)
    set list(marker: text(fill: cvaccent)[•], indent: 0pt, body-indent: 5pt, spacing: 1.7mm)
    set par(leading: 0.58em)
    text(size: size-body, fill: body-ink, e.missions)
  }
})

// ── Colonne latérale ────────────────────────────────────────────
#let side-heading(title) = block(below: 3.4mm,
  text(size: 9.5pt, weight: "bold", fill: cvaccent, tracking: 0.1em, upper(title)),
)

#let chip(label) = box(
  fill: chip-fill,
  radius: 2pt,
  inset: (x: 4.4pt, y: 3pt),
  text(size: 8.2pt, fill: ink, label),
)

#let skills-block(skills, labels) = {
  let kinds = ()
  for skill in skills {
    if skill.type not in kinds { kinds.push(skill.type) }
  }
  for (i, kind) in kinds.enumerate() {
    if i > 0 { v(4mm) }
    block(below: 2.2mm, text(size: 8.8pt, weight: "bold", fill: ink, labels.at(kind)))
    block({
      set par(leading: 4.4pt)
      skills.filter(s => s.type == kind).map(s => chip(s.name)).join([ ])
    })
  }
}

#let languages-block(languages) = grid(
  columns: (auto, 1fr),
  column-gutter: 3mm,
  row-gutter: 3mm,
  ..languages.map(l => (
    text(size: 8.8pt, weight: "bold", fill: ink, l.name),
    align(right, text(size: 8.8pt, fill: quiet,
      if "badge" in l { l.level + " · " + l.badge } else { l.level })),
  )).flatten()
)

// ── Page ────────────────────────────────────────────────────────
#let cv(personal, experiences, education, skills, languages, t) = {
  set page(paper: "a4", margin: (x: 12mm, top: 12mm, bottom: 11mm))
  set text(font: "Liberation Sans", size: size-body, lang: "fr", fill: body-ink)

  cv-header(personal)
  v(5mm)

  grid(
    columns: (1fr, side-width),
    column-gutter: gutter,
    fill: (x, y) => if x == 1 { side-fill },
    pad(top: side-pad, {
      main-heading(t.experiences)
      for e in experiences { entry(e) }
      v(2mm)
      main-heading(t.education)
      for e in education { entry(e) }
    }),
    block(width: 100%, inset: side-pad, {
      side-heading(t.skills)
      skills-block(skills, t.skill-groups)
      v(8mm)
      side-heading(t.languages)
      languages-block(languages)
    }),
  )
}
