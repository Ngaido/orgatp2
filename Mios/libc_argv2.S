#include <sys/syscall.h>  // SYS_write, SYS_exit

//
// See: <https://en.wikibooks.org/wiki/X86_Assembly/Interfacing_with_Linux>.
//

.globl main
main:
        
        mov %esp,%ebp
        
        mov 4(%esp),%ebx //guardo en ebx argc
        mov $1,%esi //inicializo contador
        mov 8(%esp),%edi //guardo en edx argv[0]

L1:
        cmp %ebx,%esi
        jl print
        jmp L2

print:

    mov (%edi,%esi,4),%eax //avanzo edx en 4 argv[i++]                  mov (%edi,%esi,4),%eax = mov (4*%esi) (%rax), %eax
    push %eax

    call puts

    inc %esi


    jmp L1

L2:
    push %esi
    call _exit