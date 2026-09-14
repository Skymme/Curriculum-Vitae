// variables.typ
// Données communes aux CV. `personal` et `skills` sont ceux du CV Full Stack ;
// la variante Data Scientist (variables_data.typ) redéfinit ces deux-là et
// réutilise le reste.

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
  permis: "Permis B",
  birthdate: "5 nov. 2002",
  title: "Développement Web Full Stack — CDI",
  summary: "Diplômée ingénieure en informatique de l’INSA de Rennes, je conçois des applications web full stack fluides et centrées sur l’utilisateur, en Angular et Spring Boot. J’aime transformer des problématiques complexes en solutions concrètes, et j’utilise les LLM au quotidien comme levier de productivité. Je recherche un premier poste de cadre, disponible dès que possible.",
)

// `lieu` et `periode` sont séparés pour que chaque mise en page les place où
// elle veut : empilés dans la frise (graphique) ou sur une même ligne (ATS).
#let experiences = (
  (
    poste: "Stage de développement Full Stack",
    entreprise: "Sopra Steria",
    lieu: "Rennes",
    periode: "Mars 2026 – Sept. 2026",
    missions: [
      - Fonctionnalités d’une application d’envergure en Angular 20 et Spring Boot.
      - Nouvelles tables Liquibase et couches d’accès aux données.
      - Travail en équipe Scrum, livraisons itératives.
      - Tests automatisés et déploiement continu, dans le respect des délais.
    ]
  ),
  (
    poste: "Stage en analyse de données",
    entreprise: "Sopra Steria",
    lieu: "Rennes",
    periode: "Juin 2025 – Juil. 2025",
    missions: [
      - Conception et optimisation de pipelines de données (flux ETL) avec Apache NiFi.
    ]
  ),
  (
    poste: "Stage de développement Full Stack",
    entreprise: "6TM",
    lieu: "Rennes",
    periode: "Juin 2024 – Sept. 2024",
    missions: [
      - Conception d’applications web et logicielles robustes en C\#, JavaScript et SQL.
      - Optimisation du code et des requêtes : temps de réponse et UX améliorés.
      - Participation active à la revue de code.
    ]
  ),
  (
    poste: "Stage de développement Frontend",
    entreprise: "Infotel",
    lieu: "Rennes",
    periode: "Juil. 2023 – Sept. 2023",
    missions: [
      - Interfaces fluides, réactives et multiplateformes en Flutter.
    ]
  ),
  (
    poste: "Stage d’assistant chef de projet",
    entreprise: "Robot For Site, filiale de Vinci",
    lieu: "Vélizy-Villacoublay",
    periode: "Févr. 2022 – Mai 2022",
    missions: [
      - Analyse des données opérationnelles et des temps d’exécution des tâches.
      - Analyse des risques liés à l’intégration de robots sur les chantiers.
    ]
  ),
  (
    poste: "Assistant qualifié des services hospitaliers",
    entreprise: "Hôpital du Croisic",
    lieu: "Le Croisic",
    periode: "Août 2021 – Sept. 2021",
    missions: none
  ),
  (
    poste: "Stage technicien",
    entreprise: "Airbus",
    lieu: "Colomiers",
    periode: "Mai 2021 – Juin 2021",
    missions: [
      - Supports et animation d’ateliers sur l’impression et la modélisation 3D.
    ]
  )
)

#let education = (
  (
    poste: "Diplôme d’ingénieur, spécialité informatique",
    entreprise: "Institut National des Sciences Appliquées (INSA)",
    lieu: "Rennes",
    periode: "Janv. 2022 – 2026",
    missions: [
      - Spécialisation Data et IA : Machine et Deep Learning (PyTorch, scikit-learn).
      - Semestre d’échange de 6 mois au Rochester Institute of Technology (États-Unis).
      - Entrepreneuriat et «~48h de l’innovation~».
    ]
  ),
  (
    poste: "Classe préparatoire intégrée – Parcours ouvert",
    entreprise: "Institut Catholique des Arts et Métiers (ICAM)",
    lieu: "Toulouse",
    periode: "2020 – 2022",
    missions: [
      - Conseil des alumni, bureau de recrutement et club international.
    ]
  ),
  (
    poste: "Baccalauréat scientifique, spécialité mathématiques",
    entreprise: "Lycée Victor Hugo",
    lieu: "Colomiers",
    periode: "Déc. 2020",
    missions: none
  )
)

#let skills = (
  // Développement & outils
  (name: "Full Stack", type: "dev"),
  (name: "Angular", type: "dev"),
  (name: "Spring Boot", type: "dev"),
  (name: "Flutter", type: "dev"),
  (name: "C#", type: "dev"),
  (name: "Git", type: "dev"),
  (name: "Liquibase", type: "dev"),

  // Data & intelligence artificielle
  (name: "Python", type: "data"),
  (name: "R", type: "data"),
  (name: "Kubernetes", type: "data"),
  (name: "SQL", type: "data"),
  (name: "Analyse de données", type: "data"),
  (name: "LLM", type: "data"),

  // Compétences humaines
  (name: "Méthodologie Agile", type: "human"),
  (name: "Travail d’équipe", type: "human"),
  (name: "Gestion de projet", type: "human"),
  (name: "Rigueur", type: "human"),
)

#let languages = (
  (name: "Français", level: "Natif"),
  (name: "Anglais",  level: "B2", badge: "TOEIC 940/990"),
  (name: "Japonais", level: "A1"),
)
