%option noyywrap
%option yylineno

%{
    #include <stdio.h>
    #include "main.cpp"   
    #include "tokens.h"
    extern int yylval;
%}


%%
"break" { return TK_Break; }
"func" { return TK_Func; }
"else" { return TK_Else; }
"package" { return TK_Package; }
"if" { return TK_If; }
"continue" { return TK_Continue; }
"for" { return TK_For; }
"import" { return TK_Import; }
"return" { return TK_Return; }
"var" { return TK_Var; }
"+" { return TK_PLUS; }
"+=" { return TK_PlusE; }
"&=" { return TK_ApersandE; }
"&&" { return TK_ApersandA; }
"==" { return TK_EqualEqual; }
"!=" { return TK_Distinct; }
"(" { return TK_ParentesisIzq; }
")" { return TK_ParentesisDer; }
"-" { return Minus; }
"-=" { return TK_MinusEqual; }
"|=" { return TK_DifEqual; }
"||" { return TK_Or; }
"<" { return Tk_Less; }
"<=" { return TK_LessEqual; }
"[" { return TK_Izqu; }
"]" { return TK_Der; }
"*" { return TK_Multi; }
"^" { return TK_Mod; }
"*=" { return TK_TimesEqual; }
"^=" { return TK_ModEqual; }
">" { return TK_Greater; }
">=" { return TK_GreaterThan; }
"{" { return TK_CorcheteIzq; }
"}" { return TK_CorcheteDer; }
"/" { return TK_Division; }
"/=" { return TK_DivEqual; }
"++" { return TK_MasMas; }
"=" { return TK_Equal; }
":=" { return TK_DosPunrosEqual; }
"," { return TK_Coma; }
"." { return TK_Punto; }
";" { return TK_PuntoYComa; }
"%" { return TK_Mod; }
"%="" { return TK_ModEqual; }
"--" { return TK_MenosMenos; }
":" { return TK_DosPuntos; }
"!" { return TK_Excla; }
"true" { return TKTRUE; }
"false" { return TKFALSE; }
"int" { return TKFALSE; }
"float32" { return TKFALSE; }
"bool" { return TKFALSE; }
"string" { return TKFALSE; }
"println" { return TKFALSE; }
"//"[^\n]* {/* nada */}
\".*\" { yylval.string_t = yytext; return TK_LIT_STRING; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
[\n] { return EOL; }
[ \t] { /* ignorar */ }
. { printf("invalido %c\n", yytext[0]); }
%%