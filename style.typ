// style.typ
// Couleurs, tailles et briques partagées par les mises en page du CV.

// ── COULEURS ────────────────────────────────────────────────────
#let cvaccent     = rgb("#1f4e79")
#let cvink        = rgb("#1f2933")
#let cvdarkgray   = rgb("#333333")
#let cvlightgray  = rgb("#6e6e6e")
#let linegray     = rgb("#dcdcdc")
#let color-accent = cvaccent
#let color-white  = rgb("#ffffff")
#let color-muted  = rgb("#666666")
#let color-data   = rgb("#2d6a4f")
#let color-human  = rgb("#7a4e8c")
#let color-dev    = color-accent

// ── TAILLES ─────────────────────────────────────────────────────
// Trois niveaux : l'intitulé du poste domine, le texte courant suit, les
// dates et lieux restent discrets.
#let size-role = 9.5pt
#let size-body = 8.8pt
#let size-meta = 8pt

// ── FONCTIONS ET LAYOUTS ─────────────────────────────────────────
#let section-title(title) = [
  #text(size: 13pt, weight: "bold")[#title]
  #v(0pt)
]

#let badge(label, fill: color-accent) = box(
  fill: fill,
  inset: (x: 6.5pt, y: 4.2pt),
  radius: 2pt,
)[#text(fill: color-white, size: 8pt)[#label]]

#let timeline-section(body) = {
  grid(
    columns: (34mm, 6mm, 1fr),
    column-gutter: 0mm,
    row-gutter: 0mm,
    stroke: (x, y) => {
      if x == 0 { return (right: 1.2pt + linegray) }
    },
    ..body
  )
}

// Une entrée de frise : période et lieu à gauche, pastille sur le rail, puis
// poste, entreprise et missions. L'espace sous chaque entrée est le même
// qu'elle ait des missions ou non.
#let timeline-item(e) = (
  align(top + left)[
    #box(width: 100%, inset: (right: 3mm))[
      #set par(leading: 0.5em)
      #text(size: size-meta, fill: cvdarkgray)[#e.periode] \
      #text(size: size-meta, fill: cvlightgray)[#e.lieu]
    ]
  ],
  align(top + left)[
    #place(dx: -3pt, dy: 1.1mm)[
      #circle(radius: 3pt, fill: cvaccent)
    ]
  ],
  align(top + left)[
    #box(width: 100%, inset: (left: 4mm, bottom: 2.9mm))[
      #set par(leading: 0.5em, spacing: 0.6em)
      #text(weight: "bold", size: size-role, fill: cvink)[#e.poste] \
      #text(weight: "bold", size: size-body, fill: cvaccent)[#e.entreprise]
      #if e.missions != none [
        #v(0.8mm)
        #set list(marker: text(size: 6pt, fill: cvaccent)[•], body-indent: 2.5mm, spacing: 1.45mm)
        #set par(leading: 0.6em)
        #text(size: size-body)[#e.missions]
      ]
    ]
  ]
)

#let two-col-section(left-body, right-body) = {
  block(
    width: 100%,
    inset: (y: -11pt),
    grid(
      columns: (1fr, 0.4fr),
      column-gutter: 8mm,
      row-gutter: 0mm,
      stroke: (x, y) => {
        if x == 0 { return (right: 1.2pt + linegray) }
      },
      align(top + left)[
        #box(width: 100%, inset: (top: 10pt, bottom: 10pt, right: 8mm))[#left-body]
      ],
      align(top + left)[
        #box(width: 100%, inset: (top: 10pt, bottom: 10pt))[#right-body]
      ],
    )
  )
}
