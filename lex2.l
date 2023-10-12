%{
#include<stdio.h>
%}
%%
([a-zA-Z][0-9_])+|[a-zA-Z_]* {printf("Identifier");}
[0-9]+ {printf("Not an identifier");}
%%
int yywrap()
{	return 1;	}
int main()
{
yyin=fopen("in.txt","r");
yylex();
return 0;
}
