#!/usr/bin/env bash
set -euo pipefail

TARGET_PATH="."
FORCE=0

for arg in "$@"; do
  case "$arg" in
    --force)
      FORCE=1
      ;;
    *)
      TARGET_PATH="$arg"
      ;;
  esac
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TEMPLATE_ROOT="$REPO_ROOT/templates"
TARGET_ROOT="$(mkdir -p "$TARGET_PATH" && cd "$TARGET_PATH" && pwd)"
FILES=(AGENTS.md PROJECT.md ARCHITECTURE.md DECISIONS.md TODO.md)

copied=0
skipped=0

for file in "${FILES[@]}"; do
  source_file="$TEMPLATE_ROOT/$file"
  destination="$TARGET_ROOT/$file"

  if [[ -e "$destination" && "$FORCE" -ne 1 ]]; then
    printf 'SKIP  %s (already exists)\n' "$file"
    skipped=$((skipped + 1))
    continue
  fi

  cp "$source_file" "$destination"
  printf 'COPY  %s\n' "$file"
  copied=$((copied + 1))
done

printf '\nBootstrap complete: %d copied, %d skipped.\n' "$copied" "$skipped"
printf 'Target: %s\n' "$TARGET_ROOT"

if [[ "$skipped" -gt 0 && "$FORCE" -ne 1 ]]; then
  printf 'Existing files were left untouched. Use --force only if you intend to replace them.\n'
fi
