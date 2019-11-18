#include <sys/syscall.h>  // SYS_write, SYS_exit

//
// See: <https://en.wikibooks.org/wiki/X86_Assembly/Interfacing_with_Linux>.
//

.globl main
main:
        
        mov $msg,%ebx
        push %ebx

        call puts

        pop %ebx

        mov $7, %eax
        ret

.data
msg:
        .ascii "Hello, world!\n"