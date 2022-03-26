%{

#include<stdio.h>
#include<string.h>

%}

%%

[#,()]      { printf("Token and Lexeme: %s \n", yytext); }
\n+         { printf("Token and Lexeme: <newline> \n"); }
"Reverse"   { printf("Token: REVERSE; Lexeme: Reverse \n"); }
[a-z]+      { printf("Token: STRING; Lexeme: %s \n", yytext); }
[\t ]+      {  }
.|[a-zA-Z]*[A-Z]+[a-zA-Z]*    { printf("Token could not be matched %s\n", yytext); }

%%

int main()
{
    yylex();
    return 0;
}