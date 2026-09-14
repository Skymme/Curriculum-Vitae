// sections/ats.typ
// Rendus « ATS-safe » : même charte graphique que le CV principal, mais
// mise en page linéaire pour que les parseurs automatiques lisent le document
// dans le bon ordre.
//
// Deux différences avec les sections standard :
//   1. L'en-tête rouge est rendu dans le CORPS du document et non dans le
//      header de page (certains parseurs ignorent les marges).
//   2. Les dates sont collées sous l'intitulé du poste au lieu d'occuper une
//      colonne séparée (une frise en deux colonnes est lue comme deux blocs
//      distincts par un parseur géométrique).

#import "../style.typ": *
#import "header.typ": tag-social

// ── EN-TÊTE (dans le flux du document) ───────────────────────────
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
              #line(angle: 90deg, length: 110pt, stroke: 0.5pt + color-white)
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
              #v(0pt)
              #text(weight: "bold")[#t.permis] \
              #personal.permis \
              #v(0pt)
              #text(weight: "bold")[#t.birthdate] \
              #personal.birthdate \
            ]
          )
        ],
      )
    ]
  ]
}

// ── ENTRÉE LINÉAIRE (poste + entreprise, puis lieu · période, puis missions)
// `date` vaut `[Lieu \ Période]` dans variables.typ. On remplace le saut de
// ligne par un séparateur pour tout tenir sur une ligne : c'est ce qui permet
// à la version ATS de rester sur une seule page.
#let inline-date(d) = {
  if type(d) == content and d.has("children") {
    d.children.map(c => if c.func() == linebreak { [ · ] } else { c }).join()
  } else {
    d
  }
}

#let entry-ats(date, poste, entreprise, missions: none) = {
  block(width: 100%, breakable: false, below: 2.2mm)[
    #text(weight: "bold", size: 8.5pt)[#poste]
    #if entreprise != "-" and entreprise != "" [
      #text(size: 8.5pt, fill: cvlightgray)[ — ]
      #text(weight: "bold", fill: cvaccent, size: 8.5pt)[#entreprise]
    ]
    #linebreak()
    #v(-2.9mm)
    #text(size: 7.5pt, fill: cvlightgray)[#inline-date(date)]
    #if missions != none [
      #v(-1mm)
      #set list(marker: text(size: 5pt, fill: cvdarkgray)[•], body-indent: 3mm, spacing: 4pt)
      #text(size: 8pt)[#missions]
    ]
  ]
}

#let render-experiences-ats(experiences, title) = {
  v(-2mm)
  section-title(title)
  v(1mm)
  for exp in experiences {
    entry-ats(exp.date, exp.poste, exp.entreprise, missions: exp.missions)
  }
}

#let render-education-ats(education, title) = {
  v(0mm)
  line(length: 100%, stroke: 0.4pt + linegray)
  v(-1mm)
  section-title(title)
  v(1mm)
  for edu in education {
    entry-ats(edu.date, edu.poste, edu.entreprise, missions: edu.missions)
  }
}

// ── COMPÉTENCES & LANGUES ────────────────────────────────────────
// Conservé en deux colonnes comme le CV d'origine : le test d'extraction
// montre que tous les libellés survivent intacts dans les deux modes de
// lecture, et cela économise la place gagnée sur les expériences.
#let render-skills-languages-ats(skills, languages, title-skills, title-langs) = {
  v(0mm)
  line(length: 100%, stroke: 0.4pt + linegray)

  skills-languages-columns(
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
    ],
    languages,
  )

  line(length: 100%, stroke: 0.4pt + linegray)
  v(-2mm)
  align(left)[
    #text(size: 7.5pt, fill: color-muted)[
      #box(baseline: 10%, circle(radius: 2.5pt, fill: color-dev)) #h(2pt) Développement & Outils
      #h(12pt)
      #box(baseline: 10%, circle(radius: 2.5pt, fill: color-data)) #h(2pt) Data & IA
      #h(12pt)
      #box(baseline: 10%, circle(radius: 2.5pt, fill: color-human)) #h(2pt) Compétences Humaines
    ]
  ]
}
