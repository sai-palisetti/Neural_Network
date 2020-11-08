     AREA     Neural_Network, CODE, READONLY
     EXPORT __NN
     IMPORT printMsg
	 IMPORT printMsg2p
	 IMPORT printMsg4p
     ENTRY 
__NN  function
	    MOV		R5, R0	;Move INPUT1(x1) from test case to R5
		MOV		R6, R1 ;Move INPUT1(x2) from test case to R6
		MOV		R7, R2	;Move INPUT1(x3) from test case to R7
		MOV     R8, R3  ;Move Input to choose the logic to evaluate from test case to R8
        MOV     R4, #1  ;Bias (B) input fixed as 1	
		
		
		CMP		R8,#1
		BEQ		logic_and
		CMP		R8,#2
		BEQ		logic_or
		CMP		R8,#3
		BEQ		logic_not
		CMP		R8,#4
		BEQ		logic_nand
		CMP		R8,#5
		BEQ		logic_nor
		CMP		R8,#6
		BEQ		logic_xor
		CMP		R8,#7
		BEQ		logic_xnor

logic_and       LDR		R9, =2  ;W1
		LDR		R10,=3	;W2
		LDR		R11,=4	;W3
		LDR		R12,=-8 ;WBias(Wb)
		B		compute		
		
logic_or	LDR		R9, =2	;W1
		LDR		R10,=3	;W2
		LDR		R11,=4	;W3
		LDR		R12,=-1 ;WBias(Wb)
		B		compute		
		
logic_not	LDR		R9, = -15;W1
		LDR		R10,=0	;W2=0 since 'not' gate  has only one input
		LDR		R11,=0	;W3=0 since 'not' gate  has only one input
		LDR		R12,=10 ;WBias(Wb)
		B		compute

logic_nand      LDR		R9, =-2	;W1
		LDR		R10,=-3 ;W2
		LDR		R11,=-4 ;W3
		LDR		R12,=8  ;WBias(Wb)
		B		compute		
		

logic_nor	LDR		R9, =-2	;W1
		LDR		R10,=-3 ;W2
		LDR		R11,=-4 ;W3
		LDR		R12,=1  ;WBias(Wb)
		B		compute		
		
		
logic_xor	LDR		R9, =-5	;W1
		LDR		R10,=20	;W2
		LDR		R11,=10	;W3
		LDR		R12,=1 ;WBias(Wb)
		B		compute	

logic_xnor	LDR		R9, =-5	;W1
		LDR		R10,=20	;W2
		LDR		R11,=10	;W3
		LDR		R12,=1 ;WBias(Wb)
		B		compute	
		
	    
compute MOV R3,#0
        MUL		R3,R4,R12 ; R3 = R4*R12 i.e R3=Wb*Bias
		MLA		R3, R5, R9, R3 ; R3 = R3 + (R5*R9) i.e R3 = (Wb*Bias) + (W1*x1)
		MLA		R3, R6, R10, R3 ;R3 = R3 + (R6*R10) i.e R3 = (Wb*Bias) + (W1*x1) + (W2*x2)
		MLA		R3, R7, R11, R3 ;R3 = R3 + (R7*R11) i.e R3 = (Wb*Bias) + (W1*x1) + (W2*x2) + (W3*x3)
		

      ;VLDR.F32   S30, = 8 ;Given value of z for sigmoid
NN      VMOV.F32 S29,R3  ;  passing z to sigmoid i.e z=W1x1+W2x2+W3x3+WbB
       VCVT.F32.S32 S30,S29 ; converting z to floating point
       MOV R2,#100  ;Counter variable for no of iterations
       VLDR.F32      S1, = 1   ;S1 and S2 to calculate the denominator value of 2,3,4 etc.,
       VLDR.F32      S2, = 2   ;
	   VMOV.F32	 S3,S30   ;Copying x to S3
	   VMOV.F32	 S4,S30   ;Copying x to S4
	   VMOV.F32	 S5,S30   ;Final value after each iteration is stored in S5 
	   
LOOP   VDIV.F32	S6,S3,S2  ;Division operation for (x/2 , (x^2)/3! , .....)
	   VFMS.F32	S5,S4,S6  ;Calculate new iteration value (S5 = S5 - (S4*S6)) 
	   VADD.F32	S2,S2,S1  ;Calculation of denominator Value of 3,4,5 .....
	   VNMUL.F32 S3,S4,S6  ; To calculate ((x^2)/2 ,(x^3)/3 ,(x^4)/4 ,.....)
	   SUB		R2,#1   ;Decrementing iteration value
	   CMP		R2,#0	;compare if maximum iteration is reached 
	   BNE 		LOOP	;Goto Next iteration if maximum iteration is not reached
       VSUB.F32 S5,S1,S5;  Final series (1-(S5))=1-x+((x^2)/2!)-((x^3)/3!)+.....
	 
	   
Sigmoid VADD.F32 S5,S1,S5  ; 1+(e^-x)
        VDIV.F32 S5,S1,S5  ; sigmoid (1/(1+(e^-x))
		VCVTR.U32.F32 S20,S5 ; rounding to logic 0 or 1 based on the output of sigmoid function
		VMOV.F32 R0,S20      ; storing final logic output in R0 and it will be printed
		B printMsg
		BX  LR
     ENDFUNC
     END 
