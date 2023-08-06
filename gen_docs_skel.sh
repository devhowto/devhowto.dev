#!/usr/bin/bash

#
# This script generates a default, initial Antora component
# docs structure.
#
# Run this command with:
#
#   $ bash ./gen-initial-structure.sh ./dirname
#
# Here's one example for creating my documentation notes for Haskell:
#
#     $ bash docs/gen-initial-structure.sh ./haskell
#
#     Creating initial structure for ‘./haskell’.
#
#     ./haskell/
#     ├── antora.yml
#     └── modules/
#         └── ROOT/
#             ├── examples/
#             ├── images/
#             ├── nav.adoc
#             └── pages/
#                 └── index.adoc
#
#     6 directories, 3 files
#
#     All set up!
#

if [[ $# < 1 ]]; then
  cat <<EOF 2>&1
ERROR: Directory name not provided.
EOF

exit 1
fi

dir="$1"

printf '\nCreating initial structure for ‘%s’.\n\n' "$dir"

mkdir -p "$dir"docs/modules/ROOT/{examples,images,pages}

cat <<EOF > "$PWD/$dir/docs/antora.yml"
name: algdsts
title: My Stupendous Project
version: 0.0.1
start_page: index.adoc
asciidoc:
  attributes:
    source-language: asciidoc@
    stem: '@'
    table-caption: false
nav:
- modules/ROOT/nav.adoc
EOF

cat <<EOF > "$PWD/$dir/docs/modules/ROOT/pages/index.adoc"
= My Stupendous Project

Intro to my stupendous project.
EOF

cat <<EOF > "$PWD/$dir/modules/ROOT/nav.adoc"
--
-- Links to Asciidoctor files inside $dir/docs/modules/ROOT/pages
--

xref:intro.adoc[]
EOF

tree -CF "$dir"

printf '\n%s\n\n' 'All set up!'
