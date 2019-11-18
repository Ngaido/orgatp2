#include <sys/syscall.h>  // SYS_write, SYS_exit

//
// See: <https://en.wikibooks.org/wiki/X86_Assembly/Interfacing_with_Linux>.
//

.globl main
main:
        
        mov %esp,%ebp
        
        mov 4(%esp),%eax
        mov $0,%edx

        mov 8(%esp),%ebx //guardo en ebx argv[0]


L1:
        cmp %eax,%ecx
        jle print
        jmp L2


print:
    mov 4(%ebx),%ebx

    push %eax
    push %ecx
    push %ebx

    push %ebx

    call puts

    pop %ebx
    pop %ecx
    pop %eax

    inc %ecx


    jmp L1

L2:
    push %ecx
    call _exit