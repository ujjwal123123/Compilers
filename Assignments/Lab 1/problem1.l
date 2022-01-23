%{
int comments_count = 0;
int blank_line_count = 0;
int code_line_count = 0;
%}

blank_line ^[\t ]*\n
comment    ^[\t ]*#.*\n

%% 

{comment}         { comments_count++; }

{blank_line}      { blank_line_count++; }

.*\n              { code_line_count++; }

%%

int main() {
    yylex();
    printf("comments: %d\n", comments_count);
    printf("blank lines: %d\n", blank_line_count);
    printf("code lines: %d\n", code_line_count);
}