%{
int comments_count = 0;
int blank_line_count = 0;
int code_line_count = 0;
int keyword_count = 0;
int open_brace_count = 0;
int close_brace_count = 0;
%}

blank_line ^[\t ]*\n
comment    [\t ]*#.*\n
keywords   False|await|else|import|pass|None|break|except|in|raise|True|class|finally|is|return|and|continue|for|lambda|try|as|def|from|nonlocal|while|assert|del|global|not|with|async|elif|if|or|yield

%% 

{comment}         { comments_count++; }

{blank_line}      { blank_line_count++; }

{keywords}        { keyword_count++; }

[a-zA-Z]+         { }

\{                { open_brace_count++; }
\}                { close_brace_count++; }

\n                { code_line_count++; }

.                 { }

%%

int main() {
    yylex();
    printf("comments: %d\n", comments_count);
    printf("blank lines: %d\n", blank_line_count);
    printf("code lines: %d\n", code_line_count);
    printf("keywords: %d\n", keyword_count);
    printf("brace count: open: %d, close: %d\n", open_brace_count, close_brace_count);
}