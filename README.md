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
