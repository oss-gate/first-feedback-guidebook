#!/bin/bash

build_pdf() {
  echo "Building PDF..."

  local DIR=chapters-pdf

  rm -rf $DIR
  cp -r chapters $DIR
  cp first-feedback-guidebook.json $DIR/
  find $DIR -name '*.md' | xargs sed -i -r -e 's/^\[([^\(]+)\]\(([^\)]+)\)$/　\n\n**\1**\n  \n\2\n\n　/g' -e 's;^　$;<div class="flushright">　</div>;g'

  cd $DIR
  easybooks first-feedback-guidebook.json
  cp -f .review/*.pdf ../

  echo "Done."
}

build_epub() {
  echo "Building EPUB..."

  local DIR=chapters-epub

  rm -rf $DIR
  cp -r chapters $DIR
  cp first-feedback-guidebook.json $DIR/

  cd $DIR
  easybooks first-feedback-guidebook.json

  cd .review
  review-epubmaker config.yml
  cp -f *.epub ../../

  echo "Done."
}

build_pdf &
pdf_pid=$!
build_epub &
epub_pid=$!

wait $pdf_pid >/dev/null 2>&1
wait $epub_pid >/dev/null 2>&1
