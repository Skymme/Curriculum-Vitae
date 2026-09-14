// sections/ats.typ
// Rendus « ATS-safe » : même charte que le CV, mais mise en page linéaire pour
// que les parseurs automatiques lisent le document dans le bon ordre.
//
// Deux différences avec la mise en page graphique :
//   1. L'en-tête est rendu dans le CORPS du document et non dans une zone
//      que certains parseurs ignorent.
//   2. Chaque entrée est une suite linéaire (poste, entreprise, lieu · période,
//      missions) : pas de colonnes qu'un parseur géométrique séparerait.

#import "../style.typ": *

// ── EN-TÊTE (dans le flux du document) ───────────────────────────
#let tag-social(logo-path, label, link-url) = link(link-url)[
  #box(
    fill: color-white,
    inset: (x: 6pt, y: 4pt),
    radius: 3pt,
    baseline: 20%,
  )[
    #grid(
      columns: (auto, auto),
      column-gutter: 4pt,
      align: horizon,
      image(logo-path, height: 8pt),
      text(fill: color-accent, size: 8pt, weight: "medium")[#label]
    )
  ]
]

#let render-header-ats(personal, t) = {
  pad(x: -15mm)[
    #block(
      width: 100%,
      fill: color-accent,
      inset: (x: 15mm, y: 12mm),
    )[
      #grid(
        columns: (1fr, auto),
        column-gutter: 10pt,
        row-gutter: 0pt,

        align(top + left)[
          #v(-5pt)
          #text(size: 20pt, weight: "bold", fill: color-white)[#personal.name]
          #v(-10pt)
          #text(size: 10pt, fill: color-white, style: "italic")[#personal.title]
          #v(0pt)
          // Pas de coupure dans un mot composé : « scikit-learn » coupé en fin
          // de ligne est relu « scikitlearn » par un parseur de CV.
          #show regex("\p{L}+(-\p{L}+)+"): box
          #text(size: 8pt, fill: color-white)[#personal.summary]

          #stack(
            dir: ltr,
            spacing: 6pt,
            tag-social("../icons/github.svg", personal.github-title, personal.github-url),
            tag-social("../icons/linkedin.svg", personal.linkedin-title, personal.linkedin-url),
            tag-social("../icons/globe.svg", personal.website-title, personal.website-url),
          )
        ],

        align(top + left)[
          #v(-5pt)
          #stack(
            place(dx: 0pt, dy: 0pt)[
              #line(angle: 90deg, length: 62pt, stroke: 0.5pt + color-white)
            ],
            box(inset: (left: 15pt), width: 115pt)[
              #set text(fill: color-white, size: 8pt)
              #text(weight: "bold")[#t.contact] \
              #v(0pt)
              #text(weight: "bold")[#t.email] \
              #personal.email \
              #v(0pt)
              #text(weight: "bold")[#t.phone] \
              #personal.phone \
            ]
          )
        ],
      )
    ]
  ]
}

// ── ENTRÉE LINÉAIRE ──────────────────────────────────────────────
#let entry-ats(e) = {
  block(width: 100%, breakable: false, below: 2.2mm)[
    #text(weight: "bold", size: 8.5pt)[#e.poste]
    #text(size: 8.5pt, fill: cvlightgray)[ — ]
    #text(weight: "bold", fill: cvaccent, size: 8.5pt)[#e.entreprise]
    #linebreak()
    #v(-2.9mm)
    #text(size: 7.5pt, fill: cvlightgray)[#e.lieu · #e.periode]
    #if e.missions != none [
      #v(-1mm)
      #set list(marker: text(size: 5pt, fill: cvdarkgray)[•], body-indent: 3mm, spacing: 4pt)
      #text(size: 8pt)[#e.missions]
    ]
  ]
}

#let render-experiences-ats(experiences, title) = {
  v(-2mm)
  section-title(title)
  v(1mm)
  for e in experiences { entry-ats(e) }
}

#let render-education-ats(education, title) = {
  v(0mm)
  line(length: 100%, stroke: 0.4pt + linegray)
  v(-1mm)
  section-title(title)
  v(1mm)
  for e in education { entry-ats(e) }
}

// ── COMPÉTENCES & LANGUES ────────────────────────────────────────
// En deux colonnes : le test d'extraction montre que tous les libellés
// survivent intacts dans les deux modes de lecture.
#let render-skills-languages-ats(skills, languages, title-skills, title-langs) = {
  v(0mm)
  line(length: 100%, stroke: 0.4pt + linegray)

  two-col-section(
    [
      #section-title(title-skills)
      #v(-4pt)
      #skills.map(skill => {
        let bg-color = if skill.type == "human" {
          color-human
        } else if skill.type == "data" {
          color-data
        } else {
          color-dev
        }
        badge(skill.name, fill: bg-color)
      }).join(h(4pt))
    ],
    [
      #section-title(title-langs)
      #v(-2pt)
      #for lang in languages [
        #text(weight: "bold", size: 8pt)[#lang.name] #if lang.level != "" [
          #h(2pt) #text(size: 8.5pt, fill: color-muted)[#lang.level]
        ] #if "badge" in lang and lang.badge != "" [
          #h(4pt)
          #box(baseline: 20%)[#badge(lang.badge, fill: color-dev)]
        ]
        #v(0pt)
      ]
    ]
  )

  line(length: 100%, stroke: 0.4pt + linegray)
  v(-2mm)
  align(left)[
    #text(size: 7.5pt, fill: color-muted)[
      #box(baseline: 10%, circle(radius: 2.5pt, fill: color-dev)) #h(2pt) Développement & outils
      #h(12pt)
      #box(baseline: 10%, circle(radius: 2.5pt, fill: color-data)) #h(2pt) Data & IA
      #h(12pt)
      #box(baseline: 10%, circle(radius: 2.5pt, fill: color-human)) #h(2pt) Compétences humaines
    ]
  ]
}
