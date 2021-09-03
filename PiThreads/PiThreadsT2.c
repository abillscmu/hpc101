//
//  main.c
//  HPC101
//
//  Created by Alec Bills on 8/6/21.
//

#include <stdio.h>
#include <time.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    int NUM_SEGMENTS = 100000000;


    double delta_x = 1./(double) NUM_SEGMENTS;
    double sum = 0;
    struct timespec start, end;
    double elapsed;
    clock_gettime(CLOCK_MONOTONIC, &start);
    #pragma omp parallel for reduction (+:sum)
    for (int i=0;i<NUM_SEGMENTS;i++){
        double this_x = ((double) i+0.5)*delta_x;
        sum+=(4./(1.+(this_x*this_x)))*delta_x;
    }
    clock_gettime(CLOCK_MONOTONIC, &end);
    elapsed = (end.tv_sec - start.tv_sec);
    elapsed += (end.tv_nsec - start.tv_nsec) / 1000000000.0;
    printf("Pi is %.10f\n",sum);
    printf("This program took %lf\n",elapsed);
    return 0;
}
