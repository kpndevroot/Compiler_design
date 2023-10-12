%{
#include<stdio.h>
%}

%%
-?(([0-9]+)|([0-9]*\.[0-9]+)([eE][-+]?[0-9]+)?) {printf("Real");}
.* printf("Not real");
%%
int yywrap(void)
{
return 1;
}
int main()
{
yylex();
return 0;
}
