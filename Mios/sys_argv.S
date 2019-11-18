#include <sys/syscall.h>  // SYS_write, SYS_exit

//
// See: <https://en.wikibooks.org/wiki/X86_Assembly/Interfacing_with_Linux>.
//

.globl main
main:

        mov %esp,%ebp
        mov 8(%esp),%edx //guardo en edx argv
        
        push %edx
        call strlen



        mov %eax, %edx // %edx == 3rd argument (count)

        mov $SYS_write, %eax   // %eax == syscall number
        mov $1, %ebx           // %ebx == first argument (fd)
        mov 8(%ebp), %ecx         // %ecx == second argument (buf)

        int $0x80

        mov $SYS_exit, %eax
        mov %edx, %ebx
        int $0x80