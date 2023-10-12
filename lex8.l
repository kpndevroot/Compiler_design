%{
 #define stack_size 100
 int sp, stack [stack_size];
 void push (int i) {
   if (++sp<stack_size) 
   { stack[sp]= i; }
   else 
   {
   printf ("error: Stack overflow\n"); 
   exit(1);
   }
 }
 int pop(void) {
   if (sp>=0) 
   { return stack[sp--]; }
   else 
   {
   printf ("error: Stack underflow\n"); 
   exit(1);
   }
 }
%}

%%

[0-9]+                   {push (atoi(yytext));}
"+"                      {push (pop() + pop());}
"*"                      {push (pop() * pop());}
-                        {int rhs= pop(); push (pop() - rhs);}
"/"                      {int rhs= pop(); push (pop() / rhs);}
;                        {printf ("%d\n", pop());}
[ \t\n]                  ;
[^-0-9+*/; \t\n]+        {ECHO; printf (" Unexpected\n");}

%%                        

int main (void) 
{
 sp= -1; 
 yylex(); 
 return 0;
}
int yywrap ()
{return 1;}
