// sections/experiences.typ
#import "../style.typ": *

// `gap` : espace sous chaque entrée ; `title-gap` : espace sous le titre.
#let render-experiences(experiences, title, gap: 2.8mm, title-gap: 0pt) = {
  v(-2mm)
  section-title(title)
  v(title-gap)

  timeline-section(
    experiences.map(exp => {
      timeline-item(exp.date, exp.poste, exp.entreprise, missions: exp.missions, gap: gap)
    }).flatten()
  )
}
