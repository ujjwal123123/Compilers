mprob1:
	flex --outfile prob1.c prob1.l
	gcc -Wall -Wextra -Wpedantic -std=c18 -o prob1 prob1.c -lfl

mprob2:
	yacc -Wall -Wother -Wcounterexamples -d prob2.y
	flex --outfile prob2.c prob2.l
	gcc -lfl -lm -ly -Wall -Wextra -Wpedantic -std=c18 y.tab.c prob2.c -o prob2

mprob3:
	yacc -Wall -Wother -Wcounterexamples -d prob3.y
	flex --outfile prob3.c prob3.l
	gcc -lfl -lm -ly -Wall -Wextra -Wpedantic -std=c18 y.tab.c prob3.c -o prob3
	
clean:
	rm -f *.c *.h
