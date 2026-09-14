// variables_data.typ
// Variante « Data Scientist » du CV.
// La formation et les langues sont partagées avec variables.typ ; l'accroche,
// l'ordre des compétences et la liste des expériences changent.

#import "variables.typ": education, languages
#import "variables.typ": experiences as all-experiences

// Les deux expériences les moins liées à la data ne figurent que sur le site :
// le CV Data Scientist gagne de la place, rendue en espace blanc.
#let experiences = all-experiences.filter(e => e.entreprise not in ("Hôpital du Croisic", "Airbus"))

#let personal = (
  name: "Jade Vaillant",
  email: "vaillant.jade@gmail.com",
  phone: "+33 7 81 80 56 45",
  birthdate: "5 Nov, 2002",
  linkedin-url: "https://www.linkedin.com/in/vaillant-jade",
  linkedin-title: "linkedin.com/in/vaillant-jade",
  github-url: "https://github.com/Skymme",
  github-title: "github.com/Skymme",
  website-url: "https://skymme.com",
  website-title: "skymme.com",
  title: "CDI Data Scientist",
  permis: "permis B",
  summary: "Diplômée ingénieure en informatique de l'INSA de Rennes, spécialisée en Data et en Intelligence artificielle. J'ai conçu et entraîné des modèles de Machine Learning et de Deep Learning en Python (PyTorch, scikit-learn) et j'utilise les LLM au quotidien en comprenant leur fonctionnement et leurs limites. Ma double culture data et développement me permet de mener un projet de l'exploration à la mise en production. Je recherche un premier poste de Data Scientist, disponible dès que possible.",
)

#let skills = (
  // Data & Intelligence Artificielle
  (name: "Python", type: "data"),
  (name: "R", type: "data"),
  (name: "SQL", type: "data"),
  (name: "Analyse de données", type: "data"),
  (name: "Machine Learning", type: "data"),
  (name: "Deep Learning", type: "data"),
  (name: "PyTorch", type: "data"),
  (name: "scikit-learn", type: "data"),
  (name: "LLM", type: "data"),
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
