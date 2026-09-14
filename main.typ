// main.typ — CV Full Stack (compiler ce fichier)

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
// Le bandeau d'en-tête va d'un bord à l'autre ; en bas, une marge de 10 mm
// garde la légende hors de la zone que les imprimantes ne savent pas imprimer.
#set page(
  paper: "a4",
  margin: (top: 55mm, bottom: 10mm, left: 15mm, right: 15mm),
  header: render-header(personal, t),
  header-ascent: 0%,
)

#set text(
  font: "Liberation Sans",
  size: 10pt,
  lang: "fr",
  fill: cvdarkgray
)
#v(3pt)
// 4. INJECTION DU CONTENU
#render-experiences(experiences, t.experiences)

#render-education(education, t.education)

#render-skills-languages(skills, languages, t.skills, t.languages)
