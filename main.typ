// main.typ

// 1. Imports des configurations, données et langues
#import "style.typ": *
#import "variables.typ": *
#import "lang/fr.typ": t

// 2. Imports des modules de sections
#import "sections/header.typ": render-header
#import "sections/experiences.typ": render-experiences
#import "sections/education.typ": render-education
#import "sections/skills_languages.typ": render-skills-languages

// 3. CONFIGURATION GENERALE
#set page(
  paper: "a4",
  margin: (top: 56mm, bottom: 6mm, left: 15mm, right: 15mm),
  header: render-header(personal, t),
  header-ascent: 0%,
)

#set text(
  font: "Liberation Sans",
  size: 10pt,
  lang: "fr",
  fill: cvdarkgray
)
#v(10pt)
// 4. INJECTION DU CONTENU
#render-experiences(experiences, t.experiences)

#render-education(education, t.education)

#render-skills-languages(skills, languages, t.skills, t.languages)