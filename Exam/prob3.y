%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

void yyerror(char *s);
int yylex();
int yywrap(void);
%}

%union {
    int ival;
    char *sval;
}
%token<sval> name
%token<ival> num
%type<ival> index
%type<ival> inp

%%

inp   : name index index  { printf("sigh(%d,sigh(%d,%s))\n", $2, $3, $1); }
      ;
index : '[' num ']' { $$ = $2; }
      ;

%%