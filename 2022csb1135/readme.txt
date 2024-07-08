CS202 PROJECT 

NAME - TARUSHI TANEJA
ROLL NO. - 2022CSB1135

To compile and run the the code , execute the following commands :

lex cucu.l                     (if lex does not work use flex)
yacc -d cucu.y                 (if yacc does not work use bison)
cc lex.yy.c cucu.tab -o cucu  (it may be y.tab.c instead of cucu.tab.c depending on the system)
./cucu file_name(sample1.cu or sample2.cu)

To see the output , refer to the "lexer.txt" and "parser.txt" files

The compiler accepts the following statements only:
function declaration,Defination
variable declaration,Defination
assignment statements 
if and while statements
return statements
comments
the boolean expressions can have == , != , >= , <= operators or true or false
the arithmetic expressions can have *,/,+,- or () or []
the data types can be int or char *