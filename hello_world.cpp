#include<stdio.h>
#include <string.h>
#include <stdlib.h> 
#include <unistd.h>

int main(int argc, char * argv[])
{
	char name[20];
	int sleep_us = 0;
	int itr = 10;
	for(int i=1;i<argc;i++)
    {
            if (argv[i][0] == '-' )
            {
                    switch (argv[i][1])  {

                            default:
                                printf("Unknown option -%c\n\n", argv[i][1]);
                                break;
                            case 's':
                                    //printf("\n option h is found");
                            	sleep_us = atof(argv[++i]);
                                break;
                            case 'n':
                                    //printf("option V is found");
                            	strcpy(name, argv[++i]);
                                break;
                            case 'r':
                            	itr = atof(argv[++i]);

                    }
            }
    }


	for(int i=0;i<itr;i++)
	{
		usleep(sleep_us);
		printf("%d: Hello World! %s \n",i, name);
	}
	return 0;
}