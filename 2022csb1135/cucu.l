%{ 
    #include <stdio.h>
    #include <string.h>
    #include <math.h>
    #include "cucu.tab.h"
    FILE *lexer;
%}
%%
"int"                   {fprintf (lexer,"TYPE : int\n"); return INT;}
"char *"                {fprintf (lexer,"TYPE : char*\n"); return CHAR;}
"="                     {fprintf (lexer,"ASSIGN : =\n"); return ASSIGN;}
[0-9]+                  {fprintf (lexer,"NUM : %d\n", yylval.num=atoi(yytext)); return NUM;}
[\(]                    {fprintf (lexer,"LEFT_BRACKET : (\n"); return LEFT_BRACKET;}
[\)]                    {fprintf (lexer,"RIGHT_BRACKET : )\n"); return RIGHT_BRACKET;}
","                     {fprintf (lexer,"COMMA : ,\n"); return COMMA;}
"while"                 {fprintf (lexer,"WHILE : while\n"); return WHILE;}
"if"                    {fprintf (lexer,"IF : if\n"); return IF;}
"else"                  {fprintf (lexer,"ELSE : else\n"); return ELSE;}
"true"                  {fprintf (lexer,"TRUE : true\n"); return TRUE;}
"false"                  {fprintf (lexer,"FALSE : false\n"); return TRUE;}
"return"                {fprintf (lexer, "RETURN : return\n"); return RET;}
[a-zA-Z_][a-zA-Z0-9_]*  {fprintf (lexer,"ID : %s\n", yytext); yylval.string=strdup(yytext); return IDENT;}
(\"[a-zA-Z0-9]*\")      {fprintf (lexer, "TYPE : string"); yylval.string=strdup(yytext); return STRING;}
"+"                     {fprintf (lexer,"PLUS : +\n"); return PLUS;}
"-"                     {fprintf (lexer,"MINUS : +\n"); return MINUS;}
"/"                     {fprintf (lexer,"DIV : /\n"); return DIV;}
"*"                     {fprintf (lexer,"MUL : *\n"); return MUL;}
";"                     {fprintf (lexer,"SEMI : ;\n"); return SEMI;}
[\{]                    {fprintf (lexer,"LEFT_CURLY_BRAC : {\n"); return LEFT_CURLY;}
[\}]                    {fprintf (lexer,"RIGHT_CURLY_BRAC : }\n"); return RIGHT_CURLY;}
[\[]                    {fprintf (lexer,"LEFT_SQAURE_BRAC : [\n"); return LEFT_SQBRAC;}
[\]]                    {fprintf (lexer,"RIGH_SQUARE_BRAC : ]\n"); return RIGHT_SQBRAC;}
\=\=                    {fprintf (lexer,"COMPARE_EQUAL : ==\n"); return COMP_EQUAL;}
\!\=                    {fprintf (lexer,"COMPARE_NOT_EQUAL : !=\n"); return COMP_NOT_EQUAL;}
\<\=                       {fprintf (lexer, "LESS_THAN_EQUAL : <=\n"); return LESS_THAN_EQUAL;}
\>\=                       {fprintf (lexer, "GREATER_THAN_EQUAL : >=\n"); return GREATER_THAN_EQUAL;}
\/\*(.|\n)*\*\/         ; /*comment*/
[ \t\n]+                ;
%%
int yywrap(){
    return 1;
}