// sections/skills_languages.typ
#import "../style.typ": *

// `space-before` : espace au-dessus du filet qui ouvre la section.
#let render-skills-languages(skills, languages, title-skills, title-langs, space-before: -4mm) = {
  v(space-before)
  line(length: 100%, stroke: 0.4pt + linegray)

  two-col-section(
    // Colonne gauche : Compétences
    [
      #section-title(title-skills)
      #v(-4pt)
      #skills.map(skill => {
        // Logique pour attribuer la bonne couleur selon les 3 catégories
        let bg-color = if skill.type == "human" {
          color-human
        } else if skill.type == "data" {
          color-data
        } else {
          color-dev
        }
        badge(skill.name, fill: bg-color)
      }).join(h(4pt))
    ],
    // Colonne droite : Langues
    [
      #section-title(title-langs)
      #v(-2pt)
      #language-list(languages)
    ]
  )

  line(length: 100%, stroke: 0.4pt + linegray)

  // --- LÉGENDE ---
  v(-2mm)
  align(left)[
    #text(size: 7.5pt, fill: color-muted)[
      #box(baseline: 10%, circle(radius: 2.5pt, fill: color-dev)) #h(2pt) Développement & Outils
      #h(12pt)
      #box(baseline: 10%, circle(radius: 2.5pt, fill: color-data)) #h(2pt) Data & IA
      #h(12pt)
      #box(baseline: 10%, circle(radius: 2.5pt, fill: color-human)) #h(2pt) Compétences Humaines
    ]
  ]
}
