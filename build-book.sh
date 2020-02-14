#!/bin/bash

blankline='<div class="flushright">　</div>'

texdocumentclass_common=serial_pagination=true,openany,fontsize=10pt,baselineskip=15.4pt,line_length=40zw,number_of_lines=35,headsep=10mm,headheight=5mm,footskip=10mm
texdocumentclass_ebook=media=ebook,paperwidth=152mm,paperheight=227mm,head_space=20mm
texdocumentclass_print=media=print,paper=b5,head_space=30mm

build_pdf() {
  echo "Building PDF..."

  local DIR=.chapters-pdf

  rm -rf $DIR
  cp -r chapters $DIR
  cat first-feedback-guidebook.json | sed "s/%TEXT_DOCUMENT_CLASS%/$texdocumentclass_ebook,$texdocumentclass_common/" > $DIR/first-feedback-guidebook.json
  find $DIR -name '*.md' | xargs sed -i -r -e "s;^\[([^\(]+)\]\(([^\)]+)\)$;$blankline\n\n**\1**\n\n\2\n\n$blankline;g" -e "s;^　$;$blankline;g"
  find $DIR -name '*.md' | xargs sed -i -r -z -e "s;$blankline(\n+$blankline)+;$blankline;g"

  mkdir -p $DIR/.review
  cp review-ext.rb $DIR/.review/
  cp style.css $DIR/.review/

  cd $DIR
  easybooks first-feedback-guidebook.json
  cp -f .review/*.pdf ../

  echo "PDF: Done."
}

build_pdf_print() {
  echo "Building PDF for printing..."

  local DIR=.chapters-pdf-print

  rm -rf $DIR
  cp -r chapters $DIR
  cat first-feedback-guidebook.json | sed "s/%TEXT_DOCUMENT_CLASS%/$texdocumentclass_print,$texdocumentclass_common/" > $DIR/first-feedback-guidebook.json
  find $DIR -name '*.md' | xargs sed -i -r -e "s;^\[([^\(]+)\]\(([^\)]+)\)$;$blankline\n\n**\1**\n\n\2\n\n$blankline;g" -e "s;^　$;$blankline;g"
  find $DIR -name '*.md' | xargs sed -i -r -z -e "s;$blankline(\n+$blankline)+;$blankline;g"

  mkdir -p $DIR/.review
  cp review-ext.rb $DIR/.review/
  cp style.css $DIR/.review/

  cd $DIR
  # convert for printing
  mogrify -type Grayscale images/*.png
  easybooks first-feedback-guidebook.json
  cp -f .review/first-feedback-guidebook.pdf ../first-feedback-guidebook-print.pdf

  echo "PDF for printing: Done."
}

build_epub() {
  echo "Building EPUB..."

  local DIR=.chapters-epub

  rm -rf $DIR
  cp -r chapters $DIR
  cat first-feedback-guidebook.json | sed "s/%TEXT_DOCUMENT_CLASS%/$texdocumentclass_ebook,$texdocumentclass_common/" > $DIR/first-feedback-guidebook.json
  find $DIR -name '*.md' | xargs sed -i -r -e "s;^　$;$blankline;g"
  find $DIR -name '*.md' | xargs sed -i -r -z -e "s;$blankline(\n+$blankline)+;$blankline;g"

  mkdir -p $DIR/.review
  cp review-ext.rb $DIR/.review/
  cp style.css $DIR/.review/

  cd $DIR
  easybooks first-feedback-guidebook.json

  cd .review
  review-epubmaker config.yml
  cp -f *.epub ../../

  echo "EPUB: Done."
}

trap "kill 0" EXIT
build_pdf &
build_pdf_print &
build_epub &
wait
