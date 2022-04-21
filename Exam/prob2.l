%{
    #include <stdio.h>
    #include <string.h>
    #include "y.tab.h"

    void yyerror();
%}

%%

"regular" { /* printf("Token: %s, Lexeme: %s\n", yytext, yytext); */ return regular; }

"s"|"si"|"sim"|"simp"|"simpl"|"simple"   { /* printf("Token: simple, Lexeme: %s\n", yytext, yytext); */ return simple;}

"c"|"co"|"com"|"comp"|"compo"|"compou"|"compoun"|"compound"    { /* printf("Token: compound, Lexeme: %s\n", yytext, yytext); */ return compound; }

[0-9]+    { /* printf("Token: NUM, Lexeme: %s\n", yytext); */ yylval.dval = atoi(yytext); return num; }

\n    { /* printf("Token and Lexeme: <newline>\n"); */ return newline; }

[(),]  { /* printf("Token and lexeme: %s\n", yytext); */ return yytext[0]; }

.    { /* printf("Toxen and lexeme: %s\n", yytext); */ }

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