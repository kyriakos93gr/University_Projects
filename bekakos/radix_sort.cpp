//code base on: http://www.geeksforgeeks.org/radix-sort/

// C++ implementation of Radix Sort
#include <iostream>
#include <cstdio>
#include <sys/time.h>
#include <time.h>
#include <cstdlib>
#include <random>
#include <omp.h>

#define  N 10000

using namespace std;

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

    // Store count of occurrences in count[]
    for (i = 0; i < n; i++)
        count[ (arr[i]/exp)%10 ]++;

    // Change count[i] so that count[i] now contains actual
    //  position of this digit in output[]
    for (i = 1; i < 10; i++)
        count[i] += count[i - 1];

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

    double start_time = gettime();
    // Do counting sort for every digit. Note that instead
    // of passing digit number, exp is passed. exp is 10^i
    // where i is current digit number
    for (int exp = 1; m/exp > 0; exp *= 10)
        countSort(tmp_array, n, exp);

    double end_time = gettime();
    double execution_time = end_time - start_time;
    printf("Serial execution time is: %f\n",execution_time);
}

void radixsort_omp(int arr[], int n)
{
    int * tmp_array = new int[N];
    for (int i = 0; i < N; i++)
        tmp_array[i] = arr[i];

    // Find the maximum number to know number of digits
    int m = getMax(tmp_array, n);

    double start_time = gettime();
    // Do counting sort for every digit. Note that instead
    // of passing digit number, exp is passed. exp is 10^i
    // where i is current digit number
    for (int exp = 1; m/exp > 0; exp *= 10)
        countSort(tmp_array, n, exp);

    double end_time = gettime();
    double execution_time = end_time - start_time;
    printf("OpenMP execution time is: %f\n",execution_time);
}

void radixsort_mpi(int arr[], int n)
{
    int * tmp_array = new int[N];
    for (int i = 0; i < N; i++)
        tmp_array[i] = arr[i];

    // Find the maximum number to know number of digits
    int m = getMax(tmp_array, n);

    double start_time = gettime();
    // Do counting sort for every digit. Note that instead
    // of passing digit number, exp is passed. exp is 10^i
    // where i is current digit number
    for (int exp = 1; m/exp > 0; exp *= 10)
        countSort(tmp_array, n, exp);

    double end_time = gettime();
    double execution_time = end_time - start_time;
    printf("MPI execution time is: %f\n",execution_time);
}
// A utility function to print an array
void print(int arr[], int n)
{
    for (int i = 0; i < n; i++)
        cout << arr[i] << " ";
}

//--------------------------------------------------------------------
//Function to calculate execution time
double gettime(void)
{
    struct timeval tv;
    gettimeofday(&tv,NULL);
    return tv.tv_sec + 1e-6 * tv.tv_usec;
}

//Random array generation
void array_generation(int *arr, int n) {
    //srand (time(NULL));
    std::mt19937 gen(time(NULL));
    std::uniform_int_distribution<int> dis(0,n);
    for (int i = 0; i < n; i++)
    {
            //arr[i] = rand() % 25;
            arr[i] = dis(gen);
    }
}


// Driver program to test above functions
int main()
{
    int* arr = new int[N];
    array_generation(arr, N);
    radixsort(arr, N);
    radixsort_omp(arr, N);
    radixsort_mpi(arr, N);
    //print(arr, N);
    delete[] arr;
    return 0;
}
