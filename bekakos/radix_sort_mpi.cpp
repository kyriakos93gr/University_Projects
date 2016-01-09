#include <mpi.h>
#include <iostream>
#include <stdio>
#include <sys/time.h>
#include <time.h>
#include <cstdlib>
// #include <random>

#define  N 100000

using namespace std;

int rank,size;
char name[80];
int length;



//Random array generation
void array_generation(int *arr, int n) {
    srand (time(NULL));
    // std::mt19937 gen(time(NULL));
    // std::uniform_int_distribution<int> dis(0,n);
    for (int i = 0; i < n; i++)
    {
            arr[i] = rand() % 25;
            //arr[i] = dis(gen);
    }
}

// A utility function to get maximum value in arr[]
int getMax(int arr[], int n)
{
    int mx = arr[0];
    for (int i = 1; i < n; i++)
        if (arr[i] > mx)
            mx = arr[i];
    return mx;
}

// A function to do counting sort of arr[] according to
// the digit represented by exp.
void countSort(int arr[], int n, int exp)
{
    static int output[N]; // output array
    int i, count[10] = {0};
    int messageTag=0;
    int sourceRank, destinationRank;
    double localIntegral;

    //-------------------------------------------
    // Send n/size arr[]
    //-------------------------------------------

    if (rank == 0)
    {
        for (sourceRank=1; sourceRank<size; sourceRank++)
        {
            localIntegral = 0;
            MPI_Send(&localIntegral, 1, MPI_DOUBLE, destinationRank, messageTag, MPI_COMM_WORLD);
        }
    }
    //-------------------------------------------
    // Store count of occurrences in count[]
    for (i = 0; i < n; i++)
        count[ (arr[i]/exp)%10 ]++;


    //-------------------------------------------
    // Receive and merge n/size arrays
    //-------------------------------------------


    // Change count[i] so that count[i] now contains actual
    //  position of this digit in output[]
    for (i = 1; i < 10; i++)
        count[i] += count[i - 1];


    //-------------------------------------------
    // Send (n-1)/size
    //-------------------------------------------

    // Build the output array
    for (i = n - 1; i >= 0; i--)
    {
        output[count[ (arr[i]/exp)%10 ] - 1] = arr[i];
        count[ (arr[i]/exp)%10 ]--;
    }

    // Copy the output array to arr[], so that arr[] now
    // contains sorted numbers according to current digit
    for (i = 0; i < n; i++)
        arr[i] = output[i];

    //-------------------------------------------
    // Receive arr[i] and merge them
    //-------------------------------------------
}

// The main function to that sorts arr[] of size n using
// Radix Sort

//gettime declaration
double gettime(void);

void radixsort(int arr[], int n)
{
    int * tmp_array = new int[N];
    for (int i = 0; i < N; i++)
        tmp_array[i] = arr[i];

    // Find the maximum number to know number of digits
    int m = getMax(tmp_array, n);

    // Do counting sort for every digit. Note that instead
    // of passing digit number, exp is passed. exp is 10^i
    // where i is current digit number
    for (int exp = 1; m/exp > 0; exp *= 10)
        countSort(tmp_array, n, exp);
}

int main(int argc, char ** argv)
{

    int* arr = new int[N];

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD,&rank);
    MPI_Comm_size(MPI_COMM_WORLD,&size);
    MPI_Get_processor_name(name,&length);

    if (size==1)
    {
        printf ("The program execution requires at least 2 processes. Aborting...\n");
        return (-1);
    }

    if (rank == 0)
    {
        array_generation(arr, N);
    }
    for (int i = 1; i <= (size - 1); i++)
    {

    }
    radixsort(arr, N);
}
