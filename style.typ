// style.typ
// Couleurs et briques partagées par les mises en page du CV.

// ── COULEURS ────────────────────────────────────────────────────
#let cvaccent     = rgb("#1f4e79")
#let cvdarkgray   = rgb("#333333")
#let cvlightgray  = rgb("#6e6e6e")
#let linegray     = rgb("#dcdcdc")
#let color-accent = cvaccent
#let color-white  = rgb("#ffffff")
#let color-muted  = rgb("#666666")
#let color-data   = rgb("#2d6a4f")
#let color-human  = rgb("#7a4e8c")
#let color-dev    = color-accent

// ── BRIQUES DE LA VERSION ATS ───────────────────────────────────
#let section-title(title) = [
  #text(size: 13pt, weight: "bold")[#title]
  #v(0pt)
]

#let badge(label, fill: color-accent) = box(
  fill: fill,
  inset: (x: 6.5pt, y: 5pt),
  radius: 2pt,
)[#text(fill: color-white, size: 8pt)[#label]]

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
