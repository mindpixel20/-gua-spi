grammar guaspi ; 

WS  :   [ \t\n\r]+ -> skip ;

twords: (phrase | subphrase)+ EOF ; 

arg: arg_indicator gword;
predicate: simple_predicate | compound_predicate ;

simple_predicate: gword ; 
compound_predicate: gword compound_gword* ;

phrase: phrase_indicator predicate (arg | subordinate_clause)* terminator; 

subphrase: subphrase_indicator predicate (arg | phrase | subphrase | subordinate_clause)* terminator | subphrase_indicator gword predicate arg* terminator | subphrase_indicator subordinate_clause terminator ;

subordinate_clause: subordinate_indicator predicate arg* terminator ; 

compound_gword: compound gword ; 

gword: (prefix | primitive) ; 

tone: phrase_indicator | arg_indicator | subphrase_indicator | compound ; 


phrase_indicator : '/'  ;
arg_indicator : '!'   ;
subordinate_indicator: '|' ; 
subphrase_indicator : '^'   ; 
compound: '-'   ;
transitive: '=' ; 

terminator: '.' ;

primitive: WORD ;
prefix: FRAG ;

fragment LETTER : [abcdefghijklmnopqrstuvwxyz:#] ;
fragment DIGIT : [0-9] ;
fragment CHAR : (LETTER | DIGIT ) ;
FRAG : CHAR CHAR CHAR?;
WORD : CHAR CHAR CHAR CHAR+ ;
