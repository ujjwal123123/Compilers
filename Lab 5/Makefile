default: lex.l
	flex lex.l
	gcc -lfl -Wall -Wextra lex.yy.c -o lexer
	rm lex.yy.c