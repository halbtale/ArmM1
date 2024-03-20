//
// Assembler program to print "Hello World!"
// to stdout.
//
// X0-X2 - parameters to OS function services
// X16 - OS function number
//
.global _main             // Provide program starting address to linker

// Setup the parameters to print hello world
// and then call OS to do it.

_main:  mov X0, #1     // 1 = StdOut
        adr X1, helloworld // string to print
        mov X2, #13     // length of our string
        mov X16, #4     // MacOS write system call
        svc 0     // Call OS to output the string

// Setup the parameters to exit the program
// and then call OS to do it.

        mov     X0, #0      // Use 0 return code
        mov     X16, #1     // Service command code 1 terminates this program
        svc     0           // Call MacOS to terminate the program

helloworld:      .ascii  "Hello World!\n"

// as -o app.o app.s
// ld app.o -o app 