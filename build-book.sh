#!/bin/bash

bookname=first-feedback-guidebook
distdir=dist

blankline='<div class="flushright">　</div>'

texdocumentclass_common=serial_pagination=true,openany,fontsize=10pt,baselineskip=15.4pt,line_length=40zw,number_of_lines=35,headsep=10mm,headheight=5mm,footskip=10mm
texdocumentclass_ebook=media=ebook,paperwidth=152mm,paperheight=227mm,head_space=20mm
texdocumentclass_print=media=print,paper=b5,head_space=30mm

build_pdf_ebook() {
  local taskname="PDF for ebook"
  local DIR=.tmp-pdf-ebook

  echo "$taskname: Building..."

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
  if command -v pdftk > /dev/null
  then
    echo "$taskname: Extracting page info..."
    pdftk .review/$bookname.pdf dump_data_utf8 output .review/pdf_info
    local pages_count=$(cat .review/pdf_info | grep PageMediaNumber | tail -n 1 | cut -d ' ' -f 2)
    local tobira1=$(cat .review/pdf_info | grep -A 2 'BookmarkTitle: 第I部' | grep BookmarkPageNumber | cut -d ' ' -f 2)
    local tobira2=$(cat .review/pdf_info | grep -A 2 'BookmarkTitle: 第II部' | grep BookmarkPageNumber | cut -d ' ' -f 2)
    local tobira3=$(cat .review/pdf_info | grep -A 2 'BookmarkTitle: 第III部' | grep BookmarkPageNumber | cut -d ' ' -f 2)
    echo "$taskname: Replacing pages..."
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
      output .review/$bookname.rearranged.pdf
    echo "$taskname: Embedding bookmarks..."
    pdftk .review/$bookname.rearranged.pdf update_info_utf8 .review/pdf_info output .review/$bookname-ebook.pdf
    cp -f .review/$bookname-ebook.pdf ../$distdir/
  else
    cp -f .review/$bookname.pdf ../$distdir/$bookname-ebook.pdf
  fi

  echo "$taskname: Done."
}

build_pdf_print() {
  local taskname="PDF for printing"
  local DIR=.tmp-pdf-print

  echo "$taskname: Building..."

  rm -rf $DIR
  cp -r chapters $DIR
  cat $bookname.json | sed "s/%TEXT_DOCUMENT_CLASS%/$texdocumentclass_print,$texdocumentclass_common/" > $DIR/$bookname.json
  find $DIR -name '*.md' | xargs sed -i -r -e "s;^\[([^\(]+)\]\(([^\)]+)\)$;$blankline\n\n**\1**\n\n\2\n\n$blankline;g" -e "s;^　$;$blankline;g"
  find $DIR -name '*.md' | xargs sed -i -r -z -e "s;$blankline(\n+$blankline)+;$blankline;g"

  mkdir -p $DIR/.review
  cp review-ext.rb $DIR/.review/
  cp style.css $DIR/.review/

  cd $DIR
  echo "$taskname: Converting images..."
  mogrify -type Grayscale images/*.png
  easybooks $bookname.json
  if command -v pdftk > /dev/null
  then
    echo "$taskname: Extracting page info..."
    pdftk .review/$bookname.pdf dump_data_utf8 output .review/pdf_info
    local pages_count=$(cat .review/pdf_info | grep PageMediaNumber | tail -n 1 | cut -d ' ' -f 2)
    local tobira1=$(cat .review/pdf_info | grep -A 2 'BookmarkTitle: 第I部' | grep BookmarkPageNumber | cut -d ' ' -f 2)
    local tobira2=$(cat .review/pdf_info | grep -A 2 'BookmarkTitle: 第II部' | grep BookmarkPageNumber | cut -d ' ' -f 2)
    local tobira3=$(cat .review/pdf_info | grep -A 2 'BookmarkTitle: 第III部' | grep BookmarkPageNumber | cut -d ' ' -f 2)
    echo "$taskname: Replacing pages..."
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
    cp -f .review/$bookname-print.pdf ../$distdir/
  else
    cp -f .review/$bookname.pdf ../$distdir/$bookname-print.pdf
  fi

  echo "$taskname: Done."
}

build_epub() {
  local taskname="EPUB"
  local DIR=.tmp-epub

  echo "$taskname: Building..."

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
  cp -f *.epub ../../$distdir/

  echo "$taskname: Done."
}

mkdir -p $distdir

trap "kill 0" EXIT
build_pdf_ebook &
build_pdf_print &
build_epub &
wait >/dev/null 2>&1
exit 0
