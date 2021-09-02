//
//  main.c
//  HPC101
//
//  Created by Alec Bills on 8/6/21.
//

#include <stdio.h>
int omp_get_thread_num();

int main(int argc, const char * argv[]) {
    // insert code here...
#pragma omp parallel
    {
    int thnum = omp_get_thread_num();
    printf("Hello from thread number %d\n",thnum);
}
    return 0;
}

