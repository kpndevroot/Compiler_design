%{
#include <stdio.h>
%}

%%
"<"[^>]*">" {}
%%
int yywrap(){return 1;}
int main() {
    yyin=fopen("input.html","r");
    yyout=fopen("out.txt","w");
    /*call the yylex function.*/
    yylex();
    return 0;
}

