// sections/skills_languages.typ
#import "../style.typ": *

#let render-skills-languages(skills, languages, title-skills, title-langs) = {
  v(-4mm) 
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
      #for lang in languages [
        #text(weight: "bold", size: 8pt)[#lang.name] #if lang.level != "" [
          #h(2pt) #text(size: 8.5pt, fill: color-muted)[#lang.level]
        ] #if "badge" in lang and lang.badge != "" [
          #h(4pt)
          #box(baseline: 20%)[#badge(lang.badge, fill: color-dev)]
        ]
        #v(0pt)
      ]
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