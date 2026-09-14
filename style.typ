// style.typ

// ── COULEURS ────────────────────────────────────────────────────
#let cvaccent     = rgb("#1f4e79")
#let cvdarkgray   = rgb("#333333")
#let cvlightgray  = rgb("#6e6e6e")
#let linegray     = rgb("#dcdcdc")
#let color-accent = rgb("#1f4e79")
#let color-bg     = rgb("#f2f2f2")
#let color-white  = rgb("#ffffff")
#let color-text   = rgb("#1a1a1a")
#let color-muted  = rgb("#666666")
#let color-human  = rgb("#7a4e8c")
#let color-data   = rgb("#2d6a4f")
#let color-human  = rgb("#7a4e8c")

#let color-dev     = color-accent
#let color-divider = linegray

// ── FONCTIONS ET LAYOUTS ─────────────────────────────────────────
#let section-title(title) = [
  #text(size: 13pt, weight: "bold")[#title]
  #v(0pt)
]

#let badge(label, fill: color-accent) = box(
  fill: fill,
  inset: (x: 6.5pt, y: 5pt),
  radius: 2pt,
)[#text(fill: color-white, size: 8pt)[#label]]

#let timeline-section(body) = {
  grid(
    columns: (35mm, 6mm, 1fr),
    column-gutter: 0mm,
    row-gutter: 0mm,
    stroke: (x, y) => {
      if x == 0 { return (right: 1.2pt + linegray) }
    },
    ..body
  )
}

#let timeline-item(date, poste, entreprise, missions: none) = (
  align(top + left)[
    #box(width: 100%, inset: (right: 4mm))[
      #text(size: 8pt, fill: cvlightgray)[#date]
    ]
  ],
  align(top + left)[
    #place(dx: -3pt, dy: 1.5mm)[
      #circle(radius: 3pt, fill: cvaccent)
    ]
  ],
  align(top + left)[
    #box(width: 100%, inset: (left: 4mm))[
      #text(weight: "bold", size: 8pt)[#poste] \
      #if entreprise != "-" and entreprise != "" [
        #v(-2mm)
        #text(weight: "bold", fill: cvaccent, size: 8pt)[#entreprise]
        #v(-1mm)
      ]
      #if missions != none [
        #v(1mm)
        #set list(marker: text(size: 5pt, fill: cvdarkgray)[•], body-indent: 3mm, spacing: 6pt)
        #text(size: 8pt)[#missions]
      ]
      #v(2.8mm)
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