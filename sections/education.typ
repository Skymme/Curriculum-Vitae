// sections/education.typ
#import "../style.typ": *

#let render-education(education, title) = {
  v(-4mm)
  line(length: 100%, stroke: 0.4pt + linegray)
  v(-1mm)
  section-title(title)
  v(0pt)

  timeline-section(
    education.map(edu => {
      timeline-item(edu.date, edu.poste, edu.entreprise, missions: edu.missions)
    }).flatten()
  )
}