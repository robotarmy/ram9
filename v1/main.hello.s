	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"main.c"
	.data
	.align	2
	.type	glGlob, %object
	.size	glGlob, 4
glGlob:
	.word	glGlobalData
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Hello Fish!\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	bl	consoleDemoInit
	ldr	r0, .L3
	bl	iprintf
.L2:
	bl	swiWaitForVBlank
	b	.L2
.L4:
	.align	2
.L3:
	.word	.LC0
	.size	main, .-main
	.ident	"GCC: (devkitARM release 32) 4.5.1"

