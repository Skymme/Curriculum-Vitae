// main_data.typ — variante Data Scientist (compiler ce fichier)

// 1. Imports des configurations, données et langues
#import "style.typ": *
#import "variables_data.typ": *
#import "lang/fr.typ": t

// 2. Imports des modules de sections
#import "sections/header.typ": render-header
#import "sections/experiences.typ": render-experiences
#import "sections/education.typ": render-education
#import "sections/skills_languages.typ": render-skills-languages

// Espacements : ce CV a deux expériences de moins que le CV Full Stack, la
// place gagnée aère les entrées et les sections.
#let entry-gap = 3.6mm
#let title-gap = 1.5mm
#let section-space = 1mm

// 3. CONFIGURATION GENERALE
#set page(
  paper: "a4",
  margin: (top: 56mm, bottom: 8mm, left: 15mm, right: 15mm),
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
#render-experiences(experiences, t.experiences, gap: entry-gap, title-gap: title-gap)

#render-education(education, t.education, gap: entry-gap, title-gap: title-gap, space-before: section-space)

#render-skills-languages(skills, languages, t.skills, t.languages, space-before: section-space)
