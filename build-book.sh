#!/bin/bash

bookname=first-feedback-guidebook

blankline='<div class="flushright">　</div>'

texdocumentclass_common=serial_pagination=true,openany,fontsize=10pt,baselineskip=15.4pt,line_length=40zw,number_of_lines=35,headsep=10mm,headheight=5mm,footskip=10mm
texdocumentclass_ebook=media=ebook,paperwidth=152mm,paperheight=227mm,head_space=20mm
texdocumentclass_print=media=print,paper=b5,head_space=30mm

pages_count=194
tobira1=10
tobira2=58
tobira3=127

build_pdf_ebook() {
  echo "Building PDF for ebook..."

  local DIR=.chapters-pdf-ebook

  rm -rf $DIR
  cp -r chapters $DIR
  cat $bookname.json | sed "s/%TEXT_DOCUMENT_CLASS%/$texdocumentclass_ebook,$texdocumentclass_common/" > $DIR/$bookname.json
  find $DIR -name '*.md' | xargs sed -i -r -e "s;^\[([^\(]+)\]\(([^\)]+)\)$;$blankline\n\n**\1**\n\n\2\n\n$blankline;g" -e "s;^　$;$blankline;g"
  find $DIR -name '*.md' | xargs sed -i -r -z -e "s;$blankline(\n+$blankline)+;$blankline;g"

  mkdir -p $DIR/.review
  cp review-ext.rb $DIR/.review/
  cp style.css $DIR/.review/

  cd $DIR
  easybooks $bookname.json
  if command -v pdftk > /dev/null && false
  then
    pdftk .review/$bookname.pdf ../images/tobira-ebook.pdf cat output .review/$bookname.combined.pdf
    pdftk .review/$bookname.combined.pdf cat \
      $(($pages_count + 1)) \
      2-$(($tobira1 - 1)) \
      $(($pages_count + 2)) \
      $(($tobira1 + 1))-$(($tobira2 - 1)) \
      $(($pages_count + 3)) \
      $(($tobira2 + 1))-$(($tobira3 - 1)) \
      $(($pages_count + 4)) \
      $(($tobira3 + 1))-$pages_count \
      output .review/$bookname-ebook.pdf
    cp -f .review/$bookname-ebook.pdf ../../
  else
    cp -f .review/$bookname.pdf ../$bookname-ebook.pdf
  fi

  echo "PDF for ebook: Done."
}

build_pdf_print() {
  echo "Building PDF for printing..."

  local DIR=.chapters-pdf-print

  rm -rf $DIR
  cp -r chapters $DIR
  cat $bookname.json | sed "s/%TEXT_DOCUMENT_CLASS%/$texdocumentclass_print,$texdocumentclass_common/" > $DIR/$bookname.json
  find $DIR -name '*.md' | xargs sed -i -r -e "s;^\[([^\(]+)\]\(([^\)]+)\)$;$blankline\n\n**\1**\n\n\2\n\n$blankline;g" -e "s;^　$;$blankline;g"
  find $DIR -name '*.md' | xargs sed -i -r -z -e "s;$blankline(\n+$blankline)+;$blankline;g"

  mkdir -p $DIR/.review
  cp review-ext.rb $DIR/.review/
  cp style.css $DIR/.review/

  cd $DIR
  # convert for printing
  mogrify -type Grayscale images/*.png
  easybooks $bookname.json
  if command -v pdftk > /dev/null
  then
    pdftk .review/$bookname.pdf ../images/tobira-print.pdf cat output .review/$bookname.combined.pdf
    pdftk .review/$bookname.combined.pdf cat \
      $(($pages_count + 1)) \
      2-$(($tobira1 - 1)) \
      $(($pages_count + 2)) \
      $(($tobira1 + 1))-$(($tobira2 - 1)) \
      $(($pages_count + 3)) \
      $(($tobira2 + 1))-$(($tobira3 - 1)) \
      $(($pages_count + 4)) \
      $(($tobira3 + 1))-$pages_count \
      output .review/$bookname-print.pdf
    cp -f .review/$bookname-print.pdf ../../
  else
    cp -f .review/$bookname.pdf ../$bookname-print.pdf
  fi

  echo "PDF for printing: Done."
}

build_epub() {
  echo "Building EPUB..."

  local DIR=.chapters-epub

  rm -rf $DIR
  cp -r chapters $DIR
  cat $bookname.json | sed "s/%TEXT_DOCUMENT_CLASS%/$texdocumentclass_ebook,$texdocumentclass_common/" > $DIR/$bookname.json
  find $DIR -name '*.md' | xargs sed -i -r -e "s;^　$;$blankline;g"
  find $DIR -name '*.md' | xargs sed -i -r -z -e "s;$blankline(\n+$blankline)+;$blankline;g"

  mkdir -p $DIR/.review
  cp review-ext.rb $DIR/.review/
  cp style.css $DIR/.review/

  cd $DIR
  easybooks $bookname.json

  cd .review
  review-epubmaker config.yml
  cp -f *.epub ../../

  echo "EPUB: Done."
}

trap "kill 0" EXIT
build_pdf_ebook &
build_pdf_print &
build_epub &
wait >/dev/null 2>&1
exit 0
