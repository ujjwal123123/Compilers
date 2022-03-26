default:
	yacc -d -Wall -Wcounterexamples lab3.y
	flex lab3.l
	gcc lex.yy.c y.tab.c

run:
	./a.out

clean:
	rm -rf y.tab.h y.tab.c a.out lex.yy.cc


