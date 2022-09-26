#!/usr/bin/bash

#
# This script generates a default, initial Antora component
# docs structure.
#

printf '\n%s\n\n' 'Creating initial structure.'

mkdir -p docs/modules/ROOT/{examples,images,pages}

cat <<EOF > "$PWD/docs/antora.yml"
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

cat <<EOF > "$PWD/docs/modules/ROOT/pages/index.adoc"
= My Stupendous Project

Intro to my stupendous project.
EOF

cat <<EOF > "$PWD/docs/modules/ROOT/nav.adoc"
--
-- Links to Asciidoctor files inside docs/modules/ROOT/pages
--

xref:intro.adoc[]
EOF

tree -CF .

printf '\n%s\n\n' 'All set up!'
