# Curriculum Vitae Typst Template

This repository contains a Typst resume/CV template.

## Usage

1. Open the main Typst source file in this repository. This is usually a file with a `.typ` extension at the root, for example `resume.typ`, `main.typ`, or `document.typ`.
2. Locate the top section where personal variables are defined.
3. Update your information: name, contact details, summary, experience, education, skills, and other profile fields.
4. Save the file.

## Important files to personalize

- `*.typ` (main document file): the main template and content structure.
- The top variable block in the main Typst file: edit fields such as name, title, email, phone, address, and sections.
- Any style or settings file if present, such as `styles.typ` or `theme.typ`: update fonts, colors, and spacing if you want a custom look.
- `assets/` folder if present: replace images, icons, or profile photo files used by the template.

## How to export PDF

1. Install Typst from https://typst.app.
2. Run the compile command from the repository root.

Example commands:

- `typst compile resume.typ`
- `typst compile main.typ -o Curriculum-Vitae.pdf`

If the template file has a different name, replace `resume.typ` with the actual file name.

## Notes

- Keep your personal variables in the top section of the Typst file for easy updates.
- If the project includes multiple `.typ` files, the main file usually imports the others and is the one you compile.
- After compiling, open the generated PDF to check formatting and content.

## Variantes et compilation

Quatre CV sont générés depuis les mêmes données :

| Source | PDF | Usage |
| --- | --- | --- |
| `main.typ` | `pdf/CV-Jade-Vaillant-FullStack.pdf` | Full Stack, mise en page graphique |
| `main_ats.typ` | `pdf/CV-Jade-Vaillant-FullStack-ATS.pdf` | Full Stack, lisible par les parseurs de CV |
| `main_data.typ` | `pdf/CV-Jade-Vaillant-Data-Scientist.pdf` | Data Scientist, mise en page graphique |
| `main_data_ats.typ` | `pdf/CV-Jade-Vaillant-Data-Scientist-ATS.pdf` | Data Scientist, lisible par les parseurs de CV |

Les expériences, la formation et les langues vivent dans `variables.typ` :
`variables_data.typ` les importe et ne redéfinit que l'accroche et l'ordre des
compétences. Une expérience ajoutée une fois se propage aux quatre versions.

La mise en page graphique est dans `template.typ` (en-tête d'identité, parcours
à gauche, compétences et langues dans une colonne latérale) ; la mise en page
linéaire des versions ATS est dans `sections/ats.typ`. Les couleurs communes
sont dans `style.typ`.

Pour tout régénérer :

```sh
./build.sh
```

`build.sh` charge les polices depuis `fonts/` et refuse de produire un PDF si
une police demandée est absente, plutôt que de laisser Typst y substituer
silencieusement la sienne.

## Polices

`fonts/` contient Liberation Sans (SIL Open Font License 1.1, voir
`fonts/LICENSE`), versionnée dans le dépôt pour que la compilation donne le
même résultat sur n'importe quelle machine.
