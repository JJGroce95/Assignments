    .data                 // data section
	.type	v, %object    // defining object v 
	.size	v, 1          // size 1 elements
                           
v:                        // v array
	.xword	7       // elements of size 64-bit


	.text                 // program section
	.global	main          // main
	.arch armv8-a+fp+simd // processor type
	.type main, %function // main function
	
main:
	ADR  X9, v            //add in array 
	LDUR X20, [X9, #0]    // load the first value, set to 7
	MUL X10, X20, X20   //n^2, save in x10
	LSL X10, X20, #1		//2*X10
	SUBI X10, X10, #1		//X9-1
	MUL X11, X20, X20	//n^2, save in X11
	MUL X21, X10, X20   //n^2 x (2n^2 - 1) saved in X21

