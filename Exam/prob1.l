%{
#include <stdio.h>    
#include <string.h>
#include <stdlib.h>
%}

%%

"regular" { printf("Token: %s, Lexeme: %s\n", yytext, yytext); }

"s"|"si"|"sim"|"simp"|"simpl"|"simple"   { printf("Token: simple, Lexeme: %s\n", yytext, yytext); }

"c"|"co"|"com"|"comp"|"compo"|"compou"|"compoun"|"compound"    { printf("Token: compound, Lexeme: %s\n", yytext, yytext); }

[0-9]+    { printf("Token: NUM, Lexeme: %s\n", yytext); }

\n    { printf("Token and Lexeme: <newline>\n"); }

.    { printf("Toxen and lexeme: %s\n", yytext); }

%%   
    
int main() {
    yylex();
    return 0;
}