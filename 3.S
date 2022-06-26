    .data                 // data section
	.type	x, %object    // defining object x
	.size	x, 3          // size 3 elements

x:                        // x array
	.xword	1, 2, 3       // elements of size 64-bit


	.text                 // program section
	.global	main          // main
	.arch armv8-a+fp+simd // processor type
	.type main, %function // main function

main:
	ADR  X9, x            // load base address of x into X9 (psuedo instruction)
	LDUR X10, [X9, #16]		//load data from memory
	ADDI X10, X10, #5		//X[2] + 5
	STUR X10, [X9, #24]		//store to X[3]

	LSR X11, X21, #1		//divide b by 2
	LSL X11, X11, #3        //get offset
	ADD X11, X11, X9		//add offset to base address
	LDUR X11, [X11, #0]		//load data from memory
	LSR X12, X22, #2		//divide c by 4
	LSL X12, X12, #3		//get offset
	ADD X12, X12, X9		//add offset to base address
	LDUR X12, [X12, #0]		//load data from memory
	ADD X13, X11, X12		//x[b/2] + x[c/4]
	LSL X14, X20, #1		//get index
	LSL X14, X14, #3		//get offset
	ADD X14, X14, X9		//add offset to base address
	STUR X13, [X14, #0]		//store

	LSR X15, X22, #2	//c >> 4
	LSL X16, X20, #2    //get index
	LSL X16, X16, #3 	//get offset
	ADD X16, X16, X9	//add offset to base address
	LDUR X16, [X16, #0]	//load
	ADD X17, X15, X16   //X17 = X15 + X16
	LSR X18, X21, #3	//b divided by 8
	LSL X18, X18, #1	//get index
	LSL X18, X18, #3	//get offset
	ADD X18, X18, X9	//add offset to base address
	STUR X17, [X18, #0]	//store

