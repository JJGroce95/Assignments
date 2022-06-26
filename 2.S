    .data                 // data section
	.type	v, %object    // defining object v 
	.size	v, 8          // size 8 elements
                           
v:                        // v array
	.xword	8, 7, 6, 5, 4, 3, 2, 1       // elements of size 64-bit


	.text                 // program section
	.global	main          // main
	.arch armv8-a+fp+simd // processor type
	.type main, %function // main function

main:
	ADR  X9, v            // load base address of v into X9 (psuedo instruction)
	LDUR X10, [X9, #0]    // load the first value
	ADD X20, X10, X20      // add first value to X20
	LDUR X11, [X9, #8]    // load the second value
	ADD X20, X11, X20
	LDUR X12, [X9, #16]	  // load the third value
	ADD X20,X12, X20
	LDUR X13, [X9, #24]   // load the fourth value
	ADD X20,X13, X20
	LDUR X14, [X9, #32]   // load the fifth value
	ADD X20,X14, X20
	LDUR X15, [X9, #40]   // load the sixth value
	ADD X20,X15, X20
	LDUR X16, [X9, #48]   // load the seventh value
	ADD X20,X16, X20
	LDUR X17, [X9, #56]   // load the eigth value
	ADD X20,X17, X20	  // SUM
	LSR X21, X20, #3	 // Mean = sum / (2^3)
    SUB X23, X17, X10     // RANGE high - low
	
	ADD X13, X13, X14     // (1/2) MEDIAN sum middle two values
	LSR X22, X13, #1      // (2/2) MEDIAN divide sum middle two values by 2
	
	