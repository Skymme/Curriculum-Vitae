// sections/header.typ
#import "../style.typ": *

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

#let render-header(personal, t) = {
  place(top + left, dx: -15mm, dy: -3mm)[
    #block(
      width: 210mm,
      fill: color-accent,
      inset: (x: 15mm, y: 12mm),
    )[
      #grid(
        columns: (1fr, auto),
        column-gutter: 10pt,
        row-gutter: 0pt,

        // Gauche : Descriptif & Réseaux
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

        // Droite : Coordonnées
        align(top + left)[
          #v(-5pt)
          #stack(
            // La ligne verticale : ajustez dy (position de départ) et length (longueur) selon vos préférences
            place(dx: 0pt, dy: 0pt)[
              #line(
                angle: 90deg,
                length: 110pt,
                stroke: 0.5pt + color-white
              )
            ],

            // Le bloc de coordonnées décalé vers la droite
            box(
              inset: (left: 15pt),
              width: 115pt,
            )[
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