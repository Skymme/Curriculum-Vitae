// variables_data.typ
// Variante « Data Scientist » du CV.
// Les expériences, la formation et les langues sont partagées avec variables.typ :
// seuls l'accroche et l'ordre des compétences changent.

#import "variables.typ": experiences, education, languages

#let personal = (
  name: "Jade Vaillant",
  email: "vaillant.jade@gmail.com",
  phone: "+33 7 81 80 56 45",
  linkedin-url: "https://www.linkedin.com/in/vaillant-jade",
  linkedin-title: "linkedin.com/in/vaillant-jade",
  github-url: "https://github.com/Skymme",
  github-title: "github.com/Skymme",
  website-url: "https://skymme.com",
  website-title: "skymme.com",
  availability: "Dès que possible",
  title: "Data Scientist — CDI",
  summary: "Diplômée ingénieure en informatique de l’INSA de Rennes, spécialisée en Data et en Intelligence artificielle. J’ai conçu et entraîné des modèles de Machine Learning et de Deep Learning en Python (PyTorch, scikit-learn), et j’utilise les LLM au quotidien en comprenant leur fonctionnement. Je recherche un premier poste de Data Scientist tourné vers la prédiction, disponible dès que possible.",
)

#let skills = (
  // Data & intelligence artificielle
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

  // Développement & outils
  (name: "Full Stack", type: "dev"),
  (name: "Spring Boot", type: "dev"),
  (name: "Angular", type: "dev"),
  (name: "C#", type: "dev"),
  (name: "Git", type: "dev"),

  // Compétences humaines
  (name: "Méthodologie Agile", type: "human"),
  (name: "Travail d’équipe", type: "human"),
  (name: "Gestion de projet", type: "human"),
  (name: "Rigueur", type: "human"),
)
