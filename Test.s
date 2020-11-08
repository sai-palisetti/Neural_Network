	 AREA     test_cases, CODE, READONLY
     EXPORT __main
	 IMPORT __NN
     IMPORT printMsg
	 IMPORT printMsg2p
	 IMPORT printMsg4p
     ENTRY 
__main  function	
		MOV		R0, #0	;INPUT1(x1)
		MOV		R1, #0  ;INPUT2(x2)
		MOV		R2, #0	;INPUT3(x3)
		MOV     R3, #1  ;Input to choose the logic to evaluate 
		BL __NN
		
		MOV		R0, #0	;INPUT1(x1)
		MOV		R1, #0  ;INPUT2(x2)
		MOV		R2, #1	;INPUT3(x3)
		MOV     R3, #1  ;Input to choose the logic to evaluate 
		BL __NN
		
		MOV		R0, #0	;INPUT1(x1)
		MOV		R1, #1  ;INPUT2(x2)
		MOV		R2, #0	;INPUT3(x3)
		MOV     R3, #1   ;Input to choose the logic to evaluate 
		BL __NN
		
		MOV		R0, #0	;INPUT1(x1)
		MOV		R1, #1  ;INPUT2(x2)
		MOV		R2, #1	;INPUT3(x3)
		MOV     R3, #1   ;Input to choose the logic to evaluate 
		BL __NN
		
		MOV		R0, #1	;INPUT1(x1)
		MOV		R1, #0  ;INPUT2(x2)
		MOV		R2, #0	;INPUT3(x3)
		MOV     R3, #1   ;Input to choose the logic to evaluate 
		BL __NN
		
		MOV		R0, #1	;INPUT1(x1)
		MOV		R1, #0  ;INPUT2(x2)
		MOV		R2, #1	;INPUT3(x3)
		MOV     R3, #1   ;Input to choose the logic to evaluate 
		BL __NN
		
		MOV		R0, #1	;INPUT1(x1)
		MOV		R1, #1  ;INPUT2(x2)
		MOV		R2, #0	;INPUT3(x3)
		MOV     R3, #1   ;Input to choose the logic to evaluate 
		BL __NN
		
		MOV		R0, #1	;INPUT1(x1)
		MOV		R1, #1  ;INPUT2(x2)
		MOV		R2, #1	;INPUT3(x3)
		MOV     R3, #1  ;Input to choose the logic to evaluate 
		BL __NN
		
stop    B stop ; stop program
     ENDFUNC
     END 