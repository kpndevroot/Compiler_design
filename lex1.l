%{
#include<stdio.h>
int tchar=0,tword=0,ln=0;
%}
/*Rules section*/
%%
[.\n\t] {ln++;tword++;}
[" "] {tword++;}
[^\n\t] {tchar++;}
%%

int yywrap()
{	return 1;	}

int main(){
	yyin=fopen("input.txt","r");
	yylex();
	printf("Characters=%d\nWords=%d\nSentences=%d\n",tchar,tword,ln);
	return 0;
}
