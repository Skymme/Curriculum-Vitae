// sections/education.typ
#import "../style.typ": *

// `space-before` : espace au-dessus du filet qui ouvre la section.
#let render-education(education, title, gap: 2.8mm, title-gap: 0pt, space-before: -4mm) = {
  v(space-before)
  line(length: 100%, stroke: 0.4pt + linegray)
  v(-1mm)
  section-title(title)
  v(title-gap)

  timeline-section(
    education.map(edu => {
      timeline-item(edu.date, edu.poste, edu.entreprise, missions: edu.missions, gap: gap)
    }).flatten()
  )
}
