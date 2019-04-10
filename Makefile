# BY SUBMITTING THIS FILE AS PART OF MY LAB ASSIGNMENT, I CERTIFY THAT
# ALL OF THE CONTENT OF THIS FILE WAS CREATED BY ME WITH NO
# ASSISTANCE FROM ANY PERSON OTHER THAN THE INSTRUCTOR OF THIS COURSE
# OR ONE OF OUR UNDERGRADUATE GRADERS. 

all:SimpleData

SimpleData:lab6main.o lab6assem.o
	gcc lab6main.o lab6assem.o -o SimpleData

lab6main.o:lab6main.c
	gcc -g -ansi -pedantic -c lab6main.c

lab6assem.o:lab6assem.s
	gcc -g -lc -m64 -c lab6assem.s

clean:
	rm -rf *.o SimpleData

