#import "style.typ": *
#import "variables.typ": personal, experiences, education, skills, languages
#import "sections/header.typ": render-header
#import "sections/experience.typ": render-experiences
#import "sections/education.typ": render-education
#import "sections/skills.typ": render-skills

#let render-cv(t) = [
  #render-header(personal)
  #pad(x: 24pt)[
    #v(16pt)
    #render-experiences(experiences, t)
    #render-education(education, t)
    #render-skills(skills, languages, t)
  ]
]