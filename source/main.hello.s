	.cpu arm7tdmi
  .file "main.hello.s"
	.section .rodata
  .align 2
.SPC:
  .string " "
.HELLO:
	.ascii	"Hello\000"
  .align 2
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
.LSP:
  .align 2
  .word .SPC @memory address
  .align 2
.Lworld:
  .word .WORLD
	.align	2
.Lhello:
	.word	.HELLO
	.size	main, .-main
  .ident "RAM: 333 ARM"

