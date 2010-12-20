	.cpu arm7tdmi
  .file "main.hello.s"
  .align 2
  .data
.LhelloStr:
  .align 2
  .asciz "Hello World!"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	bl	consoleDemoInit
	ldr	r0, .Lhello
	bl	iprintf
.L2:
	bl	swiWaitForVBlank
	b	.L2
.Lhello:
  .align 2
  .word .LhelloStr
  .ident "RAM: 333 ARM"

