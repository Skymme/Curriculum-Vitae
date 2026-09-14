// sections/education.typ
#import "../style.typ": *

#let render-education(education, title) = {
  v(-2mm)
  line(length: 100%, stroke: 0.4pt + linegray)
  v(-1mm)
  section-title(title)
  v(0.5mm)
  timeline-section(education.map(timeline-item).flatten())
}
