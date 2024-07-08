%{
    #include <stdio.h>
    #include <string.h>
    #include <math.h>
    int yylex();
    void yyerror(char const *);
    extern FILE *yyin,*yyout,*lexer;
%}
%token INT CHAR ASSIGN IDENT NUM PLUS MINUS DIV MUL WHILE IF LEFT_BRACKET RIGHT_BRACKET LEFT_CURLY RIGHT_CURLY STRING COMMA SEMI ELSE RET COMP_EQUAL COMP_NOT_EQUAL LEFT_SQBRAC
RIGHT_SQBRAC LESS_THAN_EQUAL GREATER_THAN_EQUAL TRUE FALSE
%union{
    int num;
    char *string;
}
%token <num> NUM
%token <string> IDENT
%token <string> STRING

%left PLUS MINUS
%left MUL DIV
%left LEFT_BRACKET RIGHT_BRACKET

%%
program : variable_dec         {fprintf(yyout,"\n");}
    | func_dec             {fprintf(yyout,"\n");}
    | func_def              {fprintf(yyout,"\n");}
    | program variable_dec      {fprintf(yyout,"\n");}
    | program func_dec     {fprintf(yyout,"\n");}
    | program func_def      {fprintf(yyout,"\n");}


variable_dec : int ident SEMI 
    | char ident SEMI  
    | int ident ASSIGN expr SEMI        {fprintf(yyout,"Assignment : =  ends \n");}
    | char ident ASSIGN expr SEMI     {fprintf(yyout,"Assignment : = ends \n");}
    ;

func_dec : int ident LEFT_BRACKET func_argument RIGHT_BRACKET SEMI           {fprintf(yyout,"Function declaration ends \n\n");}
    | int ident LEFT_BRACKET RIGHT_BRACKET SEMI                           {fprintf(yyout,"Function declaration ends \n\n");}
    | char ident LEFT_BRACKET func_argument RIGHT_BRACKET SEMI                {fprintf(yyout,"Function declaration ends \n\n");}
    | char ident LEFT_BRACKET RIGHT_BRACKET SEMI                              {fprintf(yyout,"Function declaration ends \n\n");}
    ;

func_def : int ident LEFT_BRACKET func_argument RIGHT_BRACKET func_body       {fprintf(yyout,"Function Defination ends \n\n");}
    | int ident LEFT_BRACKET RIGHT_BRACKET func_body                      {fprintf(yyout,"Function Defination ends \n\n");}
    | char ident LEFT_BRACKET func_argument RIGHT_BRACKET func_body           {fprintf(yyout,"Function Defination ends \n\n");}
    | char ident LEFT_BRACKET RIGHT_BRACKET func_body                     {fprintf(yyout,"Function Defination ends \n\n");}
    ;

func_argument : int ident                   {fprintf(yyout,"Function Arguments end \n\n");}
    | int ident COMMA func_argument
    | char ident                        {fprintf(yyout,"Function Arguments end \n\n");}
    | char ident COMMA func_argument
    ;

int : INT       {fprintf(yyout,"Type : int\n");}
    ;

char : CHAR     {fprintf(yyout,"Type : char *\n");}
    ;

func_body : LEFT_CURLY stmt_list RIGHT_CURLY
    | stmt
    ;

stmt_list : stmt_list stmt
    | stmt
    ;

stmt : assign
    | func_call             {fprintf(yyout,"Function call ends \n\n");}
    | return                {fprintf(yyout,"Return statement ends \n\n");}
    | if             {fprintf(yyout,"If condition ends  \n\n");}
    | loop                  {fprintf(yyout,"While Loop ends \n\n");}
    | variable_dec
    ;

assign : expr ASSIGN expr SEMI  {fprintf(yyout,"Assignment : =  ends \n");}
    ;

return : RET SEMI
    | RET expr SEMI
    ;

func_call : ident LEFT_BRACKET RIGHT_BRACKET SEMI
    | ident LEFT_BRACKET expr_list RIGHT_BRACKET SEMI
    ;

expr_list: bool COMMA expr_list
    | bool
    ;


if : IF LEFT_BRACKET bool RIGHT_BRACKET func_body
    | IF LEFT_BRACKET bool RIGHT_BRACKET func_body ELSE func_body
    ;

loop : WHILE LEFT_BRACKET bool RIGHT_BRACKET func_body
    ;

bool :  bool COMP_EQUAL bool           {fprintf(yyout,"Operator : == \n");}
    | bool COMP_NOT_EQUAL bool       {fprintf(yyout,"Operator : != \n");}
    | bool LESS_THAN_EQUAL bool       {fprintf(yyout,"Operator : <= \n");}
    | bool GREATER_THAN_EQUAL bool       {fprintf(yyout,"Operator : >= \n");}
    | expr
    | TRUE                              {fprintf(yyout,"True \n");}
    | FALSE                             {fprintf(yyout,"False \n");}
    ;

ident : IDENT     {fprintf(yyout,"Identifier : %s \n", $1);}
    ;

const : NUM    {fprintf(yyout,"Const : %d \n", $1);}
;


string : STRING {fprintf(yyout,"String : %s \n", $1);}
;

expr : LEFT_BRACKET expr RIGHT_BRACKET
    | expr PLUS expr            {fprintf(yyout,"Operator : + \n");}
    | expr MINUS expr           {fprintf(yyout,"Operator : - \n");}
    | expr MUL expr             {fprintf(yyout,"Operator : * \n");}
    | expr DIV expr             {fprintf(yyout,"Operator : / \n");}
    | ident LEFT_SQBRAC expr RIGHT_SQBRAC         {fprintf(yyout,"Operator : [] \n");}
    | const                   
    | ident
    | string
;

%%

int main()
{
    yyin = fopen(argv[1] ,"r");
    yyout=fopen("parser.txt","w");
    lexer=fopen("lexer.txt","w");
    yyparse();
    return 0;
}

void yyerror(char const *s){
    printf("Syntax Error\n");
}