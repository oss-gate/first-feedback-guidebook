
.PHONY: pdf epub

all: book

book:
	cd chapters && easybooks first-feedback-guidebook.json
	cp -f chapters/.review/*.pdf ./
	cd chapters/.review && review-epubmaker config.yml
	cp -f chapters/.review/*.epub ./
