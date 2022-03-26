%{
int singleline_comment_count = 0;
int multiline_comment_count = 0;
int blank_line_count = 0;
int code_line_count = 0;
int open_brace_count = 0;
int close_brace_count = 0;
int keyword_count = 0;
%}

blank_line         ^[\t ]*\n
singleline_comment "//".*\n
keywords           False|await|else|import|pass|None|break|except|in|raise|True|class|finally|is|return|and|continue|for|lambda|try|as|def|from|nonlocal|while|assert|del|global|not|with|async|elif|if|or|yield
brace_start        \{|\(|\[
brace_end          \}|\)|\]

%s IN_COMMENT

%% 

{blank_line}         { blank_line_count++; }

{singleline_comment} { singleline_comment_count++; }


%{/*
   Multiline comments
   ==================

   Using states as described at 
   http://westes.github.io/flex/manual/How-can-I-match-C_002dstyle-comments_003f.html

*/%}

^[\t ]*"/*"       { BEGIN(IN_COMMENT); }

"/*"              { code_line_count++; BEGIN(IN_COMMENT); }

<IN_COMMENT>{
\n                { multiline_comment_count++; }
"*/"[\t ]*\n?     { multiline_comment_count++; BEGIN 0; }
{brace_start}     { open_brace_count++; }
{brace_end}       { close_brace_count++; }
.                 { } 
}

{keywords}        { keyword_count++; }

[a-zA-Z]+         { }

{brace_start}     { open_brace_count++; }
{brace_end}       { close_brace_count++; }

\n                { code_line_count++; }

.                 { }
}

%%

int main() {
    yylex();
    printf("singleline comments: %d\n", singleline_comment_count);
    printf("multiline comments: %d\n", multiline_comment_count);
    printf("blank lines: %d\n", blank_line_count);
    printf("code lines: %d\n", code_line_count);
    printf("keywords: %d\n", keyword_count);
    printf("brace count: open: %d, close: %d\n", open_brace_count, close_brace_count);
}