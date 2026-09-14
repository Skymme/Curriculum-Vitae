// variables_data.typ
// Variante « Data Scientist » du CV.
// Les expériences, la formation et les langues sont partagées avec variables.typ :
// seuls l'accroche et l'ordre des compétences changent.

#import "variables.typ": experiences, education, languages

#let personal = (
  name: "Jade Vaillant",
  email: "vaillant.jade@gmail.com",
  phone: "+33 7 81 80 56 45",
  birthdate: "5 Nov, 2002",
  linkedin-url: "https://www.linkedin.com/in/vaillant-jade",
  linkedin-title: "linkedin.com/in/vaillant-jade",
  github-url: "https://github.com/Skymme",
  github-title: "github.com/Skymme",
  title: "CDI Data Scientist",
  permis: "permis B",
  summary: "Diplômée ingénieure en informatique de l'INSA de Rennes, spécialisée en Data et en Intelligence artificielle, je transforme des données brutes en décisions exploitables : pipelines ETL, analyse statistique et modélisation. Ma double culture data et développement logiciel me permet de mener un projet de l'exploration jusqu'à la mise en production. Je recherche un premier poste de Data Scientist, disponible dès que possible.",
)

#let skills = (
  // Data & Intelligence Artificielle
  (name: "Python", type: "data"),
  (name: "R", type: "data"),
  (name: "SQL", type: "data"),
  (name: "Analyse de données", type: "data"),
  (name: "Machine Learning", type: "data"),
  (name: "Apache NiFi (ETL)", type: "data"),
  (name: "Kubernetes", type: "data"),

  // Développement & Outils
  (name: "Fullstack", type: "dev"),
  (name: "Spring Boot", type: "dev"),
  (name: "Angular", type: "dev"),
  (name: "C#", type: "dev"),
  (name: "Git", type: "dev"),

  // Compétences Humaines
  (name: "Méthodologie Agile", type: "human"),
  (name: "Travail d'équipe", type: "human"),
  (name: "Gestion de projet", type: "human"),
  (name: "Rigueur", type: "human"),
)
