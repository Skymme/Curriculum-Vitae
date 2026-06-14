// variables.typ

#let personal = (
  name: "Jade Vaillant",
  email: "vaillant.jade@gmail.com",
  phone: "+33 7 81 80 56 45",
  birthdate: "5 Nov, 2002",
  linkedin-url: "https://www.linkedin.com/in/vaillant-jade",
  linkedin-title: "linkedin.com/in/vaillant-jade",
  github-url: "https://github.com/Skymme",
  github-title: "github.com/Skymme",
  title: "CDI en développement WEB Full Stack, à Rennes",
  permis: "permis B",
  summary: "Future ingénieure en informatique, je combine une solide expertise technique (Full Stack) et une forte sensibilité à l'innovation et à l'UX/UI. Passionnée par la création d'applications fluides et centrées sur l'utilisateur, j'aime transformer des problématiques complexes en solutions concrètes. Je recherche un premier poste de cadre à Rennes à partir d'octobre 2026.",
)

#let experiences = (
  (
    date: [Rennes, France \ Mars 2026 - Sept. 2026],
    poste: "Stage de développement fullstack",
    entreprise: "Soprasteria",
    missions: [
      - Conception et évolution de fonctionnalités d'une application d'envergure avec Angular 20 et Spring Boot.
      - Gestion de nouvelles tables via Liquibase et développement des couches d'accès aux données.
      - Intégration au sein d’une équipe Scrum pour assurer des livraisons itératives.
      - Rédaction de tests automatisés et déploiement continu des solutions dans le respect des délais imposés.
    ]
  ),
  (
    date: [Rennes, France \ Juin 2026 - Juil. 2026],
    poste: "Stage en analyse de données",
    entreprise: "Soprasteria",
    missions: [
      - Conception et optimisation de pipelines de données (flux ETL) avec Apache NiFi.
    ]
  ),
  (
    date: [Rennes, France \ Juin 2024 - Sept. 2024],
    poste: "Stage de développeur fullstack",
    entreprise: "6TM",
    missions: [
      - Conception d’applications web et logicielles robustes en C\#, JavaScript et SQL.
      - Optimisation du code et des requêtes pour améliorer significativement les temps de réponse et l'UX.
      - Collaboration active à la revue de code.
    ]
  ),
  (
    date: [Rennes, France \ Juil. 2023 - Sept. 2023],
    poste: "Stage de développeur frontend",
    entreprise: "Infotel",
    missions: [
      - Création d'interfaces utilisateurs fluides, réactives et multi-plateformes à l'aide de Flutter.
    ]
  ),
  (
    date: [Vélizy-Villacoublay, France \ Fév. 2022 - Mai 2022],
    poste: "Stage d'assistant chef de projet",
    entreprise: "Robot For Site, filliale de Vinci",
    missions: [
      - Analyse des données opérationnelles et des temps d'exécution pour la planification des tâches.
      - Identification et analyse des risques liés à l'intégration de robots sur les chantiers de construction.
    ]
  ),
  (
    date: [Le Croisic \ Août 2021 - Sept. 2021],
    poste: "Assistant qualifié des services hospitaliers",
    entreprise: "Hôpital du Croisic",
    missions: none
  ),
  (
    date: [Colomiers \ Mai 2021 - Juin 2021],
    poste: "Stage technicien",
    entreprise: "Airbus",
    missions: [
      - Création de supports et animation d'ateliers sur l'impression et la modélisation 3D.
    ]
  )
)

#let education = (
  (
    date: [Rennes, France \ Jan 2022 - 2026],
    poste: "Diplôme d'ingénieur, spécialité informatique",
    entreprise: "Institut National des Sciences Appliquées (INSA)",
    missions: [
      - Spécialisations supplémentaires en Data et en Intelligence artificielle (IA).
      - Enseignements en entrepreneuriat et participation aux « 48h de l'innovation ».
      - Semestre d’échange académique (6 mois) au Rochester Institute of Technology (RIT), États-Unis.

    ]
  ),
  (
    date: [Toulouse, France \ 2020 - 2022],
    poste: "Classe préparatoire intégrée - Parcours Ouvert",
    entreprise: "Institut Catholique des Arts et Métiers (ICAM)",
    missions: [
      - Rôles actifs au sein du conseil des alumni, du bureau de recrutement et du club international.
    ]
  ),
  (
    date: [Colomiers, France \ - Déc 2020],
    poste: "Baccalauréat scientifique, spécialité mathématiques",
    entreprise: "Lycée Victor Hugo",
    missions: none
  )
)

#let skills = (
  // Développement & Outils
  (name: "Fullstack", type: "dev"),
  (name: "Angular", type: "dev"),
  (name: "Spring Boot", type: "dev"),
  (name: "Flutter", type: "dev"),
  (name: "C#", type: "dev"),
  (name: "Git", type: "dev"),
  (name: "Liquibase", type: "dev"),

  // Data & Intelligence Artificielle
  (name: "Python", type: "data"),
  (name: "R", type: "data"),
  (name: "Kubernetes", type: "data"),
  (name: "SQL", type: "data"),
  (name: "Analyse de données", type: "data"),

  // Compétences Humaines
  (name: "Méthodologie Agile", type: "human"),
  (name: "Travail d'équipe", type: "human"),
  (name: "Gestion de projet", type: "human"),
  (name: "Rigueur", type: "human"),
)

#let languages = (
  (name: "Français", level: "Natif"),
  (name: "Anglais",  level: "B2*", badge: "940 / 990 TOEIC"),
  (name: "Japonais", level: "A1"),
)