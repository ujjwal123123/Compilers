
%{

#include <stdio.h>
#include <string.h>
#include "y.tab.h"
void yyerror();

%}


%%

[a-z]*    { printf("Token: STRING; Lexeme: %s\n", yytext); yylval.str = strdup(yytext); return STRING; }

Reverse   { printf("Token: REVERSE; Lexeme: %s\n", yytext); yylval.str = strdup(yytext); return REVERSE; }

[#\(\)]   { printf("Token and Lexeme: %s\n", yytext); return yytext[0]; }

\n        { printf("Token and Lexeme: <newline>\n"); }

[ \t]     { } // ignore whitespace

[A-Za-z]+ { yyerror(); }

.         { yyerror(); }


%%

void yyerror() {
    fprintf(stderr, "Error\n");
    exit(1);
}


int yywrap() {
   return 1;
}


int main() {
    printf("Lexer input: ");
    yyparse();
}