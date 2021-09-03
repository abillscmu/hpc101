/* -*- Mode: C; c-basic-offset:4 ; indent-tabs-mode:nil ; -*- */
/*
 * See COPYRIGHT in top-level directory.
 */

#include <mpi.h>
#include <stdio.h>

int main(int argc, char **argv)
{
    int rank, data[3];

    MPI_Init(&argc, &argv);

    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    if (rank == 0) {
        data[0] = 0;
        data[1] = 10;
        data[2] = 20;
        MPI_Send(data, 3, MPI_INT, 1, 0, MPI_COMM_WORLD);
        printf("Rank 0 done sending\n");
    } else{
        data[0] = -1;
        data[1] = -1;
        data[2] = -1;
        char processor_name[MPI_MAX_PROCESSOR_NAME];
        int name_len;
        MPI_Get_processor_name(processor_name, &name_len);
        printf("[%d] before receiving: %d,%d,%d from %s\n", rank, data[0], data[1], data[2],processor_name);
        MPI_Recv(data, 3, MPI_INT, 0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
        printf("[%d] after receiving: %d,%d,%d from %s\n", rank, data[0], data[1], data[2],processor_name);
    }

    MPI_Finalize();
    return 0;
}
