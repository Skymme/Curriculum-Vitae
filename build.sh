#!/usr/bin/env bash
#
# Régénère les quatre PDF du CV dans pdf/.
#
# Usage :
#   ./build.sh            compile les quatre variantes
#   ./build.sh fullstack  compile une seule variante (fullstack, fullstack-ats,
#                         data, data-ats)
#
set -euo pipefail

cd "$(dirname "$0")"

OUT_DIR="pdf"
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
  variants="$*"
  for v in $variants; do
    if ! targets "$v" >/dev/null 2>&1; then
      echo "Erreur : variante inconnue « $v »." >&2
      echo "Variantes disponibles : $ALL" >&2
      exit 1
    fi
  done
else
  variants="$ALL"
fi

mkdir -p "$OUT_DIR"

for v in $variants; do
  entry="$(targets "$v")"
  src="${entry%%:*}"
  dst="${entry#*:}"
  printf '%-16s %s -> %s\n' "$v" "$src" "$dst"
  typst compile "$src" "$dst"
done

echo
echo "Terminé. Contenu de $OUT_DIR/ :"
ls -1 "$OUT_DIR"
