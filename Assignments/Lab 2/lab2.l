%{

#include<stdio.h>
#include<string.h>

%}

%%

"#"       { printf("Token and Lexeme: # \n"); }
\n+       { printf("Token and Lexeme: <newline> \n"); }
"("       { printf("Token and Lexeme: ( \n"); }
")"       { printf("Token and Lexeme: ) \n"); }
"Reverse" { printf("Token: REVERSE; Lexeme: Reverse \n"); }
[a-z]+    { printf("Token: STRING; Lexeme: %s \n", yytext); }
.|\n      {  }

%%

int main()
{
    yylex();
    return 0;
}