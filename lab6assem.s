# BY SUBMITTING THIS FILE AS PART OF MY LAB ASSIGNMENT, I CERTIFY THAT
# ALL OF THE CONTENT OF THIS FILE WAS CREATED BY ME WITH NO
# ASSISTANCE FROM ANY PERSON OTHER THAN THE INSTRUCTOR OF THIS COURSE
# OR ONE OF OUR UNDERGRADUATE GRADERS. 

.file	"lab6assem.s"
# Assembler directives



#1. The Min() program must determine the minimum value in the array and then print out the
#line “The minimum value is ____.” The minimum value must be returned to main().

	.section	.rodata
.min_printf_line:
	.string	"The minimum value is %d.\n"		#here is the string value for min value print
	.text

	.globl	Min
	.type	Min, @function
Min:
	pushq	%rbp					#housekeeping
	movq	%rsp, %rbp

					# %rdi contains array pointer
					# %rsi contains number of arguments
    					# use %rax for return variable

	movq	%rdi, %r8		#r8 - a copy for the array pointer
	movl	%esi, %r10d		#r10d - a copy for dword number of arguments, this int for count down
	movl	(%r8), %eax		#rax - set to value of array[0]

loopMin:
	decl %r10d
	jl exitMin
	leaq	(%rdi, %r10, 4), %r9 	#now r11d stores the value of current loop array value
						#"temp1 = *(dynamic_array+count);"
	movl	(%r9), %r11d;
	cmpl 	%r11d, %eax
	jl 	loopMin				#if current cant update rax, then go back to loop
	movl	%r11d, %eax			#update min
	jmp	loopMin				#jump to top of loop

exitMin:
	pushq	%rax				#push VIPs to stack to protect them
	pushq 	%rdi
	pushq	%rsi
	movq	%rax, %rsi
	movq	$.min_printf_line, %rdi		#move the output with .min_printf_line string
	movl	$0, %eax
	call	printf				#this is the only callee function in max
	popq %rsi				#pop VIPs from stack to original places
	popq %rdi
	popq %rax
	leave
	ret

	.size	Min, .-Min 			#end the function and give back the memory


#2. The Max() program must determine the maximum value in the array and then print out the
#line “The maximum value is ____.” The maximum value must be returned to main().

	.section	.rodata
.max_printf_line:
	.string	"The maximum value is %d.\n"		#here is the string value for max value print
	.text
	.globl	Max
	.type	Max, @function
Max:
	pushq	%rbp					#housekeeping
	movq	%rsp, %rbp

					# %rdi contains array pointer
					# %rsi contains number of arguments
    					# use %rax for return variable

	movq	%rdi, %r8		#r8 - a copy for the array pointer
	movl	%esi, %r10d		#r10d - a copy for dword number of arguments, this int for count down
	movl	(%r8), %eax		#rax - set to value of array[0]

loopMax:
	decl %r10d
	jl exitMax
	leaq	(%rdi, %r10, 4), %r9 	#now r11d stores the value of current loop array value
						#"temp1 = *(dynamic_array+count);"
	movl	(%r9), %r11d;
	cmpl 	%eax, %r11d
	jl 	loopMax				#if current cant update rax, then go back to loop
	movl	%r11d, %eax			#update min
	jmp	loopMax				#jump to top of loop

exitMax:
	pushq	%rax				#push VIPs to stack to protect them
	pushq 	%rdi
	pushq	%rsi
	movq	%rax, %rsi
	movq	$.max_printf_line, %rdi		#move the output with .max_printf_line string
	movl	$0, %eax
	call	printf				#this is the only callee function in max
	popq %rsi				#pop VIPs from stack to original places
	popq %rdi
	popq %rax
	leave
	ret

	.size	Min, .-Min 			#end the function and give back the memory




#3. The Sum() program sums the values in the array and then print out the line “The sum of
#values is ____.” The sum must be returned to main().


	.section	.rodata
.sum_printf_line:
	.string	"The sum of the values is %d.\n" 		#here is the string value for Sum value print
	.text
	.globl	Sum
	.type	Sum, @function

Sum:
  	pushq	%rbp					#housekeeping
  	movq	%rsp, %rbp

        		# %rdi contains array pointer
        		# %rsi contains number of arguments
            		# use %rax for return variable
  	movq	%rdi, %r8		#r8 - a copy for the array pointer
  	movl	%esi, %r10d		#r10d - a copy for dword number of arguments, this int for count down
  	movl	$0, %eax		#rax - sum - initialized to 0

loopSum:
 	decl %r10d
  	jl exitSum
  	leaq	(%rdi, %r10, 4), %r9 	#now r11d stores the value of current loop array value
  						#"temp1 = *(dynamic_array+count);"
  	movl	(%r9), %r11d;

  	addl	%r11d, %eax			#add current value to the sum
  	jmp	loopSum				#jump to top of loop


exitSum:
  	pushq	%rax				#push VIPs to stack to protect them
  	pushq 	%rdi
  	pushq	%rsi
  	movq	%rax, %rsi
  	movq	$.sum_printf_line, %rdi		#move the output with .sum_printf_line string
  	movl	$0, %eax
  	call	printf				#this is the only callee function in max
	popq %rsi				#pop VIPs from stack to original places
	popq %rdi
	popq %rax
	leave
	ret
	.size	Sum, .-Sum			#end the function and give back the memory



#4. The Sort() program sorts the array values in to ascending order changing their positon in
#the array so that the sorted order is retained. The Sort() program must print out each
#individual integer value on a separate line in sorted order.

	.section	.rodata
	.align 8
.sortStart_printf_line:
	.string	"The values in ascending order are:\n"	#Sort printf starting sentence
.sortLoop_printf_line:
	.string	"%d\n"					#Sort printf loop integer for each line
	.text
	.globl	Sort
	.type	Sort, @function
Sort:
	pushq	%rbp					#housekeeping
  	movq	%rsp, %rbp

        		# %rdi contains array pointer
        		# %rsi contains number of arguments
            		# use %rax for return variable
	movq	%rdi, %r8		#r8 - a copy for the array pointer
	movl	%esi, %r10d		#r10d - a copy for dword number of arguments, i for count down
	movl	(%r8), %eax		#rax - set to value of array[0]
	
	decl %r10d			#i = argn-1
loop1:
	decl %r10d			#i--
	jl exitSort1			#go out of loop if i smaller than 0
	movl	%esi, %r11d		#r11d - j - a copy for number of arguments
	sub	%r10d, %r11d		#j = j-i

loop2:
	decl 	%r11d			#j--
	jl 	loop1
	movl	%r11d, %r12d		#r12 = j
	incl	%r12d			#r12d = j+1
	leaq 	(%r8, %r11, 4), %r9	#r9 = dynamic_array+j;
	movl	(%r9), %r9d				#r9d = temp = *(dynamic_array+j);
	leaq 	(%r8, %r12, 4), %r13	#r13 = dynamic_array+j+1;
	movl	(%r13), %r13d				#r13d = *(dynamic_array+j+1);


	cmpl 	%r13d, %r9d 				# if (*(dynamic_array+j) <= *(dynamic_array+j+1))
							#compare A and B, set SF if (dynamic_array+j+1)>(dynamic_array+j)
	jle	loop2					#go to loop2;
	movl	%r13d, 	(%r8, %r11, 4)			#*(dynamic_array+j) = *(dynamic_array+j+1);
	movl	%r9d, (%r8, %r12, 4)			#*(dynamic_array+j+1) = temp;
	jmp	loop2

exitSort1:
	pushq	%r8
	pushq	%r9
	pushq 	%r10
	pushq 	%r11
	pushq 	%r12
	pushq	%r13
	pushq	%rax				#push VIPs to stack to protect them
  	pushq 	%rdi
  	pushq	%rsi
	
  	movq	$.sortStart_printf_line, %rdi	#move the output with .sum_printf_line string
  	movl	$0, %eax
  	call	printf				#this is the only callee function in max
	popq 	%rsi				#pop VIPs from stack to original places
	popq 	%rdi
	popq 	%rax
	popq	%r13
	popq	%r12
	popq	%r11
	popq	%r10
	popq	%r9
	popq	%r8
	movl	$0, %r10d			#i=0

exitSort2:
	leaq 	(%r8, %r10, 4), %r15		#r15 = dynamic_array+i;
	movl	(%r15), %r15d			#r15d = *(dynamic_array+i);
	
	cmpl	$0, %r15d
	je	conti	

	pushq	%r8
	pushq 	%r10
	pushq 	%r12
	pushq	%r15
	pushq	%rax				#push VIPs to stack to protect them
  	pushq 	%rdi
  	pushq	%rsi
	movq	%r15, %rsi
  	movq	$.sortLoop_printf_line, %rdi		#move the output with .sum_printf_line string
  	movl	$0, %eax
  	call	printf				#this is the only callee function in max
	popq 	%rsi				#pop VIPs from stack to original places
	popq 	%rdi
	popq 	%rax
	popq	%r15
	popq	%r12
	popq	%r10
	popq	%r8

conti:
	incl	%r10d				#inscrease r10d to fill next loop
	cmp 	%r10d, %esi			#compare and check
	jl	FinalEnd			#if less, then get out from loop
	jmp	exitSort2			#if not, go back to loop

FinalEnd:
	leave
	ret
	.size	Sort, .-Sort

