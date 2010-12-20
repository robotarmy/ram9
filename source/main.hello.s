	.cpu arm7tdmi
  .file "main.hello.s"
	.section .rodata
  .align 2
.SPC:
  .string " "
.WORLD:
	.ascii	"World!\000"
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
	ldr	r0, .LSP
	bl	iprintf
	ldr	r0, .Lworld
	bl	iprintf
.L2:
	bl	swiWaitForVBlank
	b	.L2
.LhelloStr:
  .align 2
  .string "hello"
.LSP:
  .align 2
  .word .SPC @memory address
  .align 2
.Lworld:
  .word .WORLD
	.align	2
.Lhello:
	.word	.LhelloStr
	.size	main, .-main
  .ident "RAM: 333 ARM"

