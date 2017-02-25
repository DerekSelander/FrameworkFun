/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */


.globl _strcnt
.globl _strlen

#if __arm__

.align	2

_strcnt:
push	{r7, lr}
mov	r7, sp
sub	sp, #8
str	r0, [sp, #4]
ldr	r0, [sp, #4]
bl	_strlen
add	sp, #8
pop	{r7, pc}



#endif


#if __arm64__
.align 2

_strcnt:
stp	x29, x30, [sp, #-16]!
mov	 x29, sp
sub	sp, sp, #16             ; =16
str	x0, [sp, #8]
ldr	x0, [sp, #8]
bl	_strlen
mov	 sp, x29
ldp	x29, x30, [sp], #16
ret

#endif


#if __x86_64__

_strcnt:
push  %rbp
movq  %rsp, %rbp  // Function prologue (setting up stack stuff)
callq _strlen     // Calling strlen, the meat of the function
pop   %rbp        // Function epilogue
ret

#endif
