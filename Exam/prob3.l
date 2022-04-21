%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"

void yyerror();
%}

%%

[a-z]+  { yylval.sval = strdup(yytext); return name; }
"["|"]" { return yytext[0]; }
[0-9]+  { yylval.ival = atoi(yytext); return num;}

%%

void yyerror() {
    fprintf(stderr, "Error\n");
}

int yywrap() {
    return 1;
}

int main() {
    printf("Lexer input: ");
    yyparse();
}