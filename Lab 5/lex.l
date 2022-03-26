%{
#include <stdio.h>

void yyerror(char *s) {
    fprintf(stderr, "error: %s\n", s);
    exit(1);
}
%}

%%

[a-zA-Z]+  { printf("id: %s\n", yytext); }
[0-9]+     { printf("num: %s\n", yytext); }
[+\-*/()]  { printf("symbol: %s\n", yytext); }
[ \n\t]    { ; }
.          { yyerror("invalid character"); }

%%

