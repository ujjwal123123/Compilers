%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

double find_regular(double, double);
double find_simple(double, double);
double find_compound(double, double);

void yyerror(char *s);
int yylex();
int yywrap(void);
%}

%union {
    double dval;
}
%token<dval> num
%token regular
%token simple
%token compound
%token newline
%type<dval> S
%type<dval> E


%%

S : E newline { printf("%f\n", $1); exit(0); }
  ;
E : regular '(' E ',' E ')' {
      $$ = find_regular($3, $5);
  }
  | simple '(' E ',' E ')' {
      $$ = find_simple($3, $5);
  }
  | compound '(' E ',' E ')' {
      $$ = find_compound($3, $5);
  }
  | num
  ;

%%

double find_regular(double x, double y) {
    return x + (x * 2.01) / 100 * y;
}

double find_simple(double x, double y) {
    return x + (x * 5.5 * y) / 100;
}

double find_compound(double x, double y) {
    return x * pow(1 + 5.7/y, y);
}