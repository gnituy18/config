#!/bin/bash
set -e

PARSER_DIR="$HOME/.local/share/nvim/site/parser"
QUERY_DIR="$HOME/.local/share/nvim/site/queries"

mkdir -p "$PARSER_DIR"

install_parser() {
  local lang=$1
  local repo=$2
  local srcs=("${@:3}")
  local tmp="/tmp/ts-$lang"

  echo "Installing $lang parser..."
  rm -rf "$tmp"
  git clone --depth 1 "$repo" "$tmp"

  local src_files=()
  for src in "${srcs[@]}"; do
    src_files+=("$tmp/src/$src")
  done

  cc -shared -fPIC -o "$PARSER_DIR/$lang.so" -I"$tmp/src" "${src_files[@]}"
  rm -rf "$tmp"
}

install_queries() {
  local lang=$1
  local base_url=$2
  local files=("${@:3}")

  echo "Installing $lang queries..."
  mkdir -p "$QUERY_DIR/$lang"
  for file in "${files[@]}"; do
    curl -sL "$base_url/$file" -o "$QUERY_DIR/$lang/$file"
  done
}

install_parser go    https://github.com/tree-sitter/tree-sitter-go           parser.c
install_parser yaml  https://github.com/tree-sitter-grammars/tree-sitter-yaml parser.c scanner.c schema.core.c schema.json.c schema.legacy.c
install_parser html  https://github.com/tree-sitter/tree-sitter-html          parser.c scanner.c

install_queries go   https://raw.githubusercontent.com/tree-sitter/tree-sitter-go/master/queries           highlights.scm
install_queries yaml https://raw.githubusercontent.com/tree-sitter-grammars/tree-sitter-yaml/master/queries highlights.scm
install_queries html https://raw.githubusercontent.com/tree-sitter/tree-sitter-html/master/queries         highlights.scm

echo "All parsers and queries installed."
