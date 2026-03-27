#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: scripts/release.sh vX.Y.Z

Validates generated themes, creates an annotated git tag, and pushes it to origin.
GitHub Actions publishes the GitHub Release when the tag lands.
EOF
}

if [[ $# -ne 1 ]]; then
  usage
  exit 1
fi

tag="$1"
root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

case "$tag" in
  v*) ;;
  *)
    echo "Release tags should start with 'v' (for example: v1.2.3)." >&2
    exit 1
    ;;
esac

cd "$root"

if [[ -n "$(git status --porcelain --untracked-files=all)" ]]; then
  echo "Working tree must be clean before cutting a release." >&2
  git status --short
  exit 1
fi

python3 generate.py

if [[ -n "$(git status --porcelain --untracked-files=all)" ]]; then
  echo "Generated files are out of date. Run python3 generate.py and commit the result first." >&2
  git status --short
  exit 1
fi

if git rev-parse -q --verify "refs/tags/${tag}" >/dev/null; then
  echo "Tag ${tag} already exists." >&2
  exit 1
fi

git tag -a "$tag" -m "Fluidlan ${tag}"
git push origin "$tag"
