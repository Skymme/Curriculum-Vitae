// main_ats.typ — version ATS du CV Full Stack (compiler ce fichier)
//
// Même charte graphique que main.typ, mise en page linéarisée pour les
// parseurs automatiques. Voir sections/ats.typ pour le détail des écarts.

// 1. Imports des configurations, données et langues
#import "style.typ": *
#import "variables.typ": *
#import "lang/fr.typ": t

// 2. Imports des modules de sections
#import "sections/ats.typ": (
  render-header-ats,
  render-experiences-ats,
  render-education-ats,
  render-skills-languages-ats,
)

// 3. CONFIGURATION GENERALE
// Pas de `header:` ici : l'en-tête est rendu dans le corps du document.
#set page(
  paper: "a4",
  margin: (top: 0mm, bottom: 8mm, left: 15mm, right: 15mm),
)

#set text(
  font: "Liberation Sans",
  size: 10pt,
  lang: "fr",
  fill: cvdarkgray
)

// 4. INJECTION DU CONTENU
#render-header-ats(personal, t)

#v(4mm)

#render-experiences-ats(experiences, t.experiences)

#render-education-ats(education, t.education)

#render-skills-languages-ats(skills, languages, t.skills, t.languages)
