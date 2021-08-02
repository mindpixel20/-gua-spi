grammar lojsk ;

// note: when testing, you MUST use an extra E when parsing args - instead of "le" use "lee" - and make this guaspier later :3 
// :a manj lee botc xee pom vi! xun kfo! gal q: works for test statement 
// zva cauv lee hfet zbwe.a godz lee mih vi! gal 'q works for test simple conditional 

// WS  :   [ \t\n\r]+ -> skip ;

statement: subphrase stmtend EOF ;  
question: subphrase qend EOF ; 

stmtstart: ':' grar? 'a ' ;
stmtend: 'q' grar? ':' ;  

qstart: '?' grar? 'a ' ; 
qend: 'q' grar? '?' ; 

conditional_grar: (conditioned | conditioned_sequence | conditioned_alternate | condition_conditioning) vocation* transit_direction? hierarchy? ; 

// conditional_statement: simple_conditional_statement | complex_conditional_statement ; 

simple_conditional_statement: conditioning_subphrase conditioning_next_in_sequence ; 
conditioning_subphrase: conditional_grar func_indicator data_kfeirt ' ' (argk ' ')* (tcait ' ')*;
conditioning_next_in_sequence: conditioned_sequence argk_complex_indicator1 argk_complex_indicator2 data_kfeirt ' ' (argk ' ')* (tcait ' ')* ; 

complex_conditional_statement: conditioning_subphrase conditioning_next_in_sequence conditioned_alternate_next_in_sequence ; // zmwe.a
conditioned_alternate_next_in_sequence: conditioned_alternate argk_complex_indicator1 argk_complex_indicator2 (subphrase | subordinate_phrase) ; 


subphrase: func ' ' (argk ' ')* (tcait ' ')* ; 

data_kfeirt: alpha | numeric | cmen ; 

alpha: (c | cc | ccc) (v | vv) (c | cc | ccc) ; // fanc (meaning it ends in a) and args (which end in e) and a hierarchy tcait 
numeric: (c | cc | ccc) liquid?  (v | vv) (c | cc | ccc) '2'? ;
cmen: 'ii.' (c|v|liquid) (c|v|liquid)* '.ii' ; 

kfeirt: func | argk | tcait ; 


subordinate_phrase: subordinate_begin subphrase subordinate_end ' ' ; 
subordinate_begin: '@' grar 'a ' ;// grar ('e' | 'i') 'a ' ; 
subordinate_end: 'q' ;


func: (stmtstart | qstart | grar func_indicator) data_kfeirt ;
func_indicator: 'a ' ; 
 
argk: argk_simple | argk_complex ; 
argk_simple: grar argk_simple_indicator data_kfeirt ; 
argk_simple_indicator: 'e ' ;

argk_complex: grar argk_complex_indicator1 grar argk_complex_indicator2 (subphrase | subordinate_phrase) ; //grar e. grar a subordinate_phrase 
argk_complex_indicator1: 'e.' ;
argk_complex_indicator2: 'a ' ; 

tcait: (tcait_simple | tcait_complex) ' ' tcait | (tcait_simple | tcait_complex) ; 

tcait_simple: grar tcait_simple_indicator data_kfeirt ;
tcait_simple_indicator: '! ' ;  

tcait_complex: grar tcait_complex_indicator1 grar tcait_complex_indicator2 (subphrase | subordinate_phrase) ; 
tcait_complex_indicator1: '!.' ; 
tcait_complex_indicator2: 'a ' ; 

grar: vocation* transit_direction? hierarchy ; 
vocation: (affirmation | association_passive | association_component | association_active | association_ownership | association_origin | conditioned | conditioned_sequence | conditioned_alternate
	| condition_conditioning | state_equivalent | state_label  | command_computer_do | command_computer_do_not | command_computer_undo | command_computer_stop | imperative_do | imperative_do_not | imperative_redo | imperative_undo | imperative_stop 
	| interrogative | invitation_request_grant | invitation_request_not_grant | junction_additional | junction_optional | junction_next_in_sequence | junction_previous_in_sequence | junction_alternative 
	| modification_restricting_attribute | negation_exclusion_xor | number_accuracy | number_static | number_degree | number_basis | number_order_of_position | number_occurrence | number_final
	| number_initial | object_passive | object_purpose | object_quote | object_instrument | object_active | object_beneficiary | place_static | place_via | place_final | place_initial 
	| state_static | state_via | state_final | state_initial | subject | temporal_static | temporal_relative | temporal_final | temporal_initial | topic ) ;   
	
affirmation: 's' ; 
association_passive: 'd' ; 
association_component: 'dj' ; 
association_active: 'dv' ; 
association_ownership: 'dw' ;
association_origin: 'dy' ; 
conditioned: 'zb' ; 
conditioned_sequence: 'zbw' ; 
conditioned_alternate: 'zmw' ; 
condition_conditioning: 'zv' ; 
state_equivalent: 'cf' ; 
state_label: 'cm' ; 
command_computer_do: 'h' ;
command_computer_do_not: 'hn' ; 
command_computer_redo: 'hr' ; 
command_computer_undo: 'hy' ; 
command_computer_stop: 'hs' ; 
imperative_do: 'g' ; 
imperative_do_not: 'gn' ; 
imperative_redo: 'gr' ; 
imperative_undo: 'gy' ;
imperative_stop: 'gz' ; 
interrogative: 'c' ; 
invitation_request_grant: 'pc' ; 
invitation_request_not_grant: 'pn' ; 
invitation_positive_grant: 'ps' ; 
junction_additional: 'j' ; 
junction_optional: 'jm' ; 
junction_next_in_sequence: 'w' ; 
junction_previous_in_sequence: 'y' ; 
junction_alternative: 'm' ; 
modification_restricting_attribute: 'v' ; 
negation_exclusion_xor: 'n' ; 
number_accuracy: 'kc' ; 
number_static: 'k' ; 
number_degree: 'kf' ;
number_basis: 'kfy' ; 
number_order_of_position: 'ks' ; 
number_occurrence: 'kt' ; 
number_final: 'kw' ; 
number_initial: 'kw' ; 
object_passive: 'x' ; 
object_purpose: 'xb' ; 
object_quote: 'xg' ; 
object_instrument: 'xr' ; 
object_active: 'xv' ; 
object_beneficiary: 'xz' ; 
place_static: 'tc' ; 
place_via: 'tcr' ; 
place_final: 'tcw' ; 
place_initial: 'tcy' ; 
scene_static: 'ts' ; 
scene_via: 'tsr' ; 
scene_final: 'tsw' ; 
scene_initial: 'tsy' ; 
state_static: 'st' ; 
state_via: 'str' ; 
state_final: 'stw' ; 
state_initial: 'sty' ; 
subject: 'l' ; 
temporal_static: 't' ; 
temporal_relative: 'tr' ; 
temporal_final: 'tw' ; 
temporal_initial: 'ty' ; 
topic: 'r' ; 

transit_direction: (from | to | via) ; 
from: 'y' ; 
to: 'w' ; 
via: 'r' ; 

hierarchy: ( begin_phrase | begin_subphrase | arg | lvl1 | lvl2 | lvl3 | lvl4 | lvl5 | lvl6 | lvl7 | lvl8 | lvl9 | lvl10 ) ;
begin_phrase: 'a' ; 
begin_subphrase: '.a' ; 
arg: 'e' ; 
lvl1: 'i' ; 
lvl2: 'o' ;
lvl3: 'u' ; 
lvl4: 'ai' ; 
lvl5: 'ei' ; 
lvl6: 'oi' ; 
lvl7: 'ui' ; 
lvl8: 'au' ; 
lvl9: 'eu' ; 
lvl10: 'iu' ; 

vv: vowel vowel | 'au' ;
v : vowel ;

ccc: c c c ; // cccinitial cccfinal ; 
// cccinitial: voiced voiced restricted | liquid unvoiced unvoiced | unvoiced ejective restricted | voiced | liquid ; 
// cccfinal: voiced unvoiced unvoiced | unvoiced ejective | restricted restricted unvoiced unvoiced | unvoiced ejective | restricted unvoiced unvoiced unvoiced | unvoiced ejective | restricted ;

cc : c c ; // ccinitial ccfinal ; 
// ccfinal : voiced voiced | restricted unvoiced unvoiced | restricted | liquid restricted voiced | unvoiced | unvoiced ejective | click ;
// ccinitial : voiced | unvoiced ejective voiced | restricted | liquid unvoiced unvoiced | restricted | liquid restricted liquid ;

c : (unvoiced | voiced | restricted | virtual_cluster) ;

ejective: '\'' ; 
click: '[' | ']'  ;

liquid: ('y'|'w') ;

// vowel: [aeiouq3] ;
vowel: 'a' | 'e' | 'i' | 'o' | 'u' | 'q' | '3' ; 

// restricted: [lrmn62] ; 
restricted: 'l' | 'r' | 'm' | 'n' | '6' | '2' ;

// voiced: [bdgvjzx] ;
voiced: 'b' | 'd' | 'g' | 'v' | 'j' | 'z' | 'x' ;

// unvoiced: [ptkfcsh] ;

unvoiced: 'p' | 't' | 'k' | 'f' | 'c' | 's' | 'h' ; 

virtual_cluster: 'tc' ;
