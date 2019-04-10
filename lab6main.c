/*
# BY SUBMITTING THIS FILE AS PART OF MY LAB ASSIGNMENT, I CERTIFY THAT
# ALL OF THE CONTENT OF THIS FILE WAS CREATED BY ME WITH NO
# ASSISTANCE FROM ANY PERSON OTHER THAN THE INSTRUCTOR OF THIS COURSE
# OR ONE OF OUR UNDERGRADUATE GRADERS. 
*/


#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {

int i,j, sum;
int *dynamic_array;
int min, max;

	/*bug1: the case argc = 2 is valid for example: lab6 14 */
	/* must have at least one number	*/
if (argc < 2){		

	printf("Usage: %s <num1>....<numX>\n", argv[0]);
	return;
}


if((dynamic_array=malloc((argc+1)*sizeof(int))) == NULL){
	printf("Could not allocate dynamic memory\n");
	return;
}

for (i =1; i<argc; i++){
	/*	bug1: changed (i-1) to sizeof(int)*(i-1)
		bug2: changed *argv[i] to atoi(*argv[i])*/
	*(dynamic_array+(i-1)) = atoi(argv[i]); 
}

min = Min(dynamic_array,argc-1);

max = Max(dynamic_array, argc-1);

sum = Sum(dynamic_array, argc-1);

/*bug3: right here should be max-min instead of min-max*/
printf("The input received has a span of %d units.\n", max-min);

/*bug4: right here should be sum/(argc -1) instead of sum/argc -1*/
printf("The average value is %d\n", sum/(argc-1));

Sort(dynamic_array, argc-1);

free(dynamic_array);
return;
}

