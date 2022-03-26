%{

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int yylex();
void yyerror(char *s);
char *reverse(char *);

%}

%union {
    char *str;
};

%token <str> STRING
%token <str> REVERSE

%type  <str> statement
%type  <str> expression
%start statement
%left  '#'

%%

statement  : expression { printf("%s\n", $$); }
           | { }
           ;
expression : expression '#' expression { strcat($1,$3); }
           | STRING {}
           | REVERSE '(' expression ')' {
                int break_flag = 0;
                char *final = $3;
                if (!final || ! *final) {
                    $$ = final;
                    break_flag = 1;
                }
                if (break_flag == 0){
                    int i = strlen(final) - 1, j = 0;

                    while (i > j) {
                        char ch = final[i];
                        final[i] = final[j];
                        final[j] = ch;
                        i--;
                        j++;
                    }
                }
                $$ = final;
            }

%%
