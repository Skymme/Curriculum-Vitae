#!/usr/bin/env bash
#
# Régénère les quatre PDF du CV dans pdf/.
#
# Usage :
#   ./build.sh            compile les quatre variantes
#   ./build.sh fullstack  compile une seule variante (fullstack, fullstack-ats,
#                         data, data-ats)
#
# Si le dossier fonts/ existe, ses polices sont chargées en priorité, ce qui
# rend la compilation identique sur n'importe quelle machine.
#
set -euo pipefail

cd "$(dirname "$0")"

OUT_DIR="pdf"
FONT_DIR="fonts"
NAME="CV-Jade-Vaillant"

# variante -> source:destination
targets() {
  case "$1" in
    fullstack)     echo "main.typ:$OUT_DIR/$NAME-FullStack.pdf" ;;
    fullstack-ats) echo "main_ats.typ:$OUT_DIR/$NAME-FullStack-ATS.pdf" ;;
    data)          echo "main_data.typ:$OUT_DIR/$NAME-Data-Scientist.pdf" ;;
    data-ats)      echo "main_data_ats.typ:$OUT_DIR/$NAME-Data-Scientist-ATS.pdf" ;;
    *)             return 1 ;;
  esac
}

ALL="fullstack fullstack-ats data data-ats"

if ! command -v typst >/dev/null 2>&1; then
  echo "Erreur : typst est introuvable dans le PATH." >&2
  echo "Installation : https://github.com/typst/typst#installation" >&2
  exit 1
fi

if [ $# -gt 0 ]; then
  for v in "$@"; do
    if ! targets "$v" >/dev/null 2>&1; then
      echo "Erreur : variante inconnue « $v »." >&2
      echo "Variantes disponibles : $ALL" >&2
      exit 1
    fi
  done
  variants="$*"
else
  variants="$ALL"
fi

mkdir -p "$OUT_DIR"

font_args=()
if [ -d "$FONT_DIR" ]; then
  font_args=(--font-path "$FONT_DIR")
fi

for v in $variants; do
  entry="$(targets "$v")"
  src="${entry%%:*}"
  dst="${entry#*:}"
  printf '%-16s %s -> %s\n' "$v" "$src" "$dst"

  err="$(mktemp)"
  trap 'rm -f "$err"' EXIT

  if ! typst compile ${font_args[@]+"${font_args[@]}"} "$src" "$dst" 2>"$err"; then
    cat "$err" >&2
    exit 1
  fi

  # Typst remplace silencieusement une police manquante par la sienne
  # (Libertinus Serif). Le PDF paraît correct mais la typographie est fausse :
  # on refuse ce résultat au lieu de le laisser passer.
  if grep -q 'unknown font family' "$err"; then
    cat "$err" >&2
    rm -f "$dst"
    {
      echo
      echo "Erreur : police manquante. Le PDF aurait été rendu dans la police"
      echo "par défaut de Typst au lieu de celle demandée — compilation annulée"
      echo "et $dst supprimé."
      echo
      echo "Corrige en installant la police sur le système, ou en déposant ses"
      echo "fichiers .ttf dans $FONT_DIR/ (chargé automatiquement par ce script)."
    } >&2
    exit 1
  fi

  cat "$err" >&2
done

echo
echo "Terminé. Contenu de $OUT_DIR/ :"
ls -1 "$OUT_DIR"
