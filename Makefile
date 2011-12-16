all: main.pdf


main.pdf: buildtmp/main.pdf */*tex
	cp buildtmp/main.pdf  ./

buildtmp/main.pdf: */*tex templates/*
	cp templates/* buildtmp
	ls tex/0*tex | sort |sed -e 's/^/\\input ..\//' > buildtmp/mainMatter.tex
	cd buildtmp;$(MAKE) Makefile main.pdf;cd ..


clean: 
	rm -f main.pdf buildtmp/*
