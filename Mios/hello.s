	.file	"hello.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB11:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$14, %edx
	leaq	msg(%rip), %rsi
	movl	$1, %edi
	call	write@PLT
	movl	$7, %edi
	call	_exit@PLT
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.globl	msg
	.section	.rodata
	.align 8
	.type	msg, @object
	.size	msg, 15
msg:
	.string	"Hello, world!\n"
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
