#import "../style.typ": *

#let exp-entry(experience, first: false, last: false) = {
  grid(
    columns: (110pt, 8pt, 1fr),
    gutter: 0pt,

    // Colonne gauche
    [
      #set text(size: 7.5pt, fill: color-muted)
      #experience.location \
      #experience.dates
    ],

    // Timeline
    align(center + top, [
      #if first [#metadata(none) <exp-start>]
      #pad(
        top: 2pt,
        circle(
          radius: 4pt,
          fill: color-accent,
        ),
      )
    ]),

    // Contenu
    block(
      inset: (left: 8pt, bottom: 14pt),
    )[
      #set text(size: 8pt)

      #text(
        weight: "bold",
        size: 9pt,
      )[
        #experience.role
      ]

      #if experience.company != "" [
        #linebreak()
        #text(
          weight: "bold",
          fill: color-accent,
          size: 9pt,
        )[
          #experience.company
        ]
      ]

      #v(4pt)

      #for item in experience.items {
        bullet-item(item)
      }
    ],
  )
}

#let render-experiences(experiences, t) = [
  #section-title(t.experiences)

  // Ligne verticale de la timeline
  #context {
    let starts = query(<exp-start>)
    let ends = query(<exp-end>)

    if starts.len() > 0 and ends.len() > 0 {
      let start-y = starts.first().location().position().y
      let end-y = ends.first().location().position().y

      place(
        top + left,
        dx: 114pt,
        dy: start-y + 2pt,
        block(
          width: 1.2pt,
          height: end-y - start-y - 2pt,
          fill: color-accent,
        ),
      )
    }
  }

  // Entrées
  #for (i, exp) in experiences.enumerate() {
    exp-entry(
      exp,
      first: i == 0,
      last: i == experiences.len() - 1,
    )
  }

  #metadata(none) <exp-end>
  #line(
    length: 100%,
    stroke: 0.5pt + color-divider,
  )
]