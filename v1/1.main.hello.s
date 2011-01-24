  .cpu arm7tdmi
  .text
  .global	main
  .type	main, %function
  main:
  bl	consoleDemoInit
  ldr r0, .Lhello
  bl	printf
  .L2:
  bl	swiWaitForVBlank
  b	.L2
.LhelloStr:
  .string "Hello World!"
  .align 2
.Lhello:
  .word .LhelloStr

