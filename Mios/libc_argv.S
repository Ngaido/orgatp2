#include <sys/syscall.h>  // SYS_write, SYS_exit

//
// See: <https://en.wikibooks.org/wiki/X86_Assembly/Interfacing_with_Linux>.
//

.globl main
main:
        
        mov %esp,%ebp
        mov 8(%esp),%ebx //guardo en ebx argv[0]
        mov 4(%ebx),%edx //guardo en edx argv[1]
        push %edx

        call strlen
        push %eax

        mov 8(%ebp),%ebx //guardo en ebx argv[0]
        mov 4(%ebx),%edx //guardo en edx argv[1]

        push %edx
        push $1

        call write

        push $1
        push $newline
        push $1

        call write

        push %eax
        call _exit

.data
newline:
        .ascii "\n"