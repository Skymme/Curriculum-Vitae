// sections/experiences.typ
#import "../style.typ": *

#let render-experiences(experiences, title) = {
  v(-2mm)
  section-title(title)
  v(0.5mm)
  timeline-section(experiences.map(timeline-item).flatten())
}
