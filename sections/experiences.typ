// sections/experiences.typ
#import "../style.typ": *

#let render-experiences(experiences, title) = {
  v(-2mm)
  section-title(title)
  v(0pt)
  
  timeline-section(
    experiences.map(exp => {
      timeline-item(exp.date, exp.poste, exp.entreprise, missions: exp.missions)
    }).flatten()
  )
}