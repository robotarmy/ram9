  .cpu arm7tdmi
  .file "main.hello.s"
  .data
  .text
  .align	
  .global	main
  .type	main, %function
.func main
main:
  stmfd	sp!, {fp, lr}
  add	fp, sp, #4
  bl	consoleDemoInit
  ldr r0, .Lhello
  bl	printf
  adr r0, .LhelloStr
  bl	printf
  .L2:
  bl	swiWaitForVBlank
  b	.L2
.endfunc
.LhelloStr:
  .asciz "Hello World!"
  .align 2
.Lhello:
  .word .LhelloStr
  .ident "RAM 333 ARM"
  .end
