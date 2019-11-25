#include <sys/syscall.h>  // SYS_write, SYS_exit

//
// See: <https://en.wikibooks.org/wiki/X86_Assembly/Interfacing_with_Linux>.
//

.globl main
main:
        
        mov %esp,%ebp
        
        mov 4(%esp),%ebx //guardo en ebx argc
        mov $0,%esi //inicializo contador
        mov 8(%esp),%edx //guardo en edx argv[0]

L1:
        cmp %ebx,%esi
        jle print
        jmp L2

print:

    mov 4(%edx),%edx //avanzo edx en 4 argv[i++]
    push %edx

    call puts

    inc %esi


    jmp L1

L2:
    push %esi
    call _exit