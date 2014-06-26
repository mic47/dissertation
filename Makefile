all: main.pdf


main.pdf: buildtmp/main.pdf */*tex figures/*pdf
	cp buildtmp/main.pdf  ./

figures/%.pdf: figures/%.tex
	cd figures; $(MAKE) Makefile $* ; cd ..

buildtmp/main.pdf: */*tex templates/* */*bib
	cp templates/* buildtmp
	cp tex/references.bib buildtmp
	ls tex/[0-9]*tex | sort |sed -e 's/^/\\input ..\//' > buildtmp/mainMatter.tex
	echo '\\n'"ewcommand"'\\r'"evision[0]{`git rev-list --max-count=1 HEAD`(`git branch|grep '^\*'| sed -e 's/\** //'` + `git status -s | wc -l` file changes)}" > buildtmp/revision.tex
	cd figures; make; cd ..
	cd buildtmp;$(MAKE) Makefile main.pdf;cd ..


clean: 
	rm -f main.pdf buildtmp/*
