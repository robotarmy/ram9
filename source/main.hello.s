	.cpu arm7tdmi
  .file "main.hello.s"
	.text
	.align	
	.global	main
	.type	main, %function
  .func main
main:
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	bl	consoleDemoInit
  .print "somthing broken"
	ldr	r0, .Lhello
	bl	printf
.L2:
	bl	swiWaitForVBlank
	b	.L2
  .endfunc
.LhelloStr:
  .if 1
    .align
    .string "Hello World!"
  .elseif 0
    .align
    .asciz "123456781AB"  @11BYTES will print 12 will not
    .space 1 @ simulate 12 bytes - will not print
  .elseif 0
    .space 5  @ simulate 16 bytes
  .elseif 0
    .space 21 @ simulate 32  bytes
  .endif
.Lhello:
  .align
  .word .LhelloStr
  .ident "RAM: 333 ARM"

