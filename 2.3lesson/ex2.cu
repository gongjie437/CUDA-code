#include <stdio.h>

__global__ void hello_from_gpu()
{
    const int bid = blockIdx.x;
    const int tid = threadIdx.x;

    const int id = threadIdx.x + blockIdx.x * blockDim.x; 
    printf("Hello World from block %d and thread %d, global id %d\n", bid, tid, id);
}


int main(void)
{
    hello_from_gpu<<<2, 4>>>();
    cudaDeviceSynchronize();

    return 0;
}


/*
The deprecated cudaThreadSynchronize() function in CUDA has been replaced by the recommended cudaDeviceSynchronize() function. Let’s delve into the details:

cudaThreadSynchronize():
This function waits for all previous asynchronous operations (such as kernel calls and asynchronous memory copies) to complete.
It halts execution in the CPU/host thread until the GPU finishes processing all previously requested CUDA tasks.
However, it is deprecated, meaning it still works for now but is not recommended for future use.
cudaDeviceSynchronize():
Similar to cudaThreadSynchronize(), it also waits for all previous CUDA tasks to complete.
It is the preferred replacement for cudaThreadSynchronize().
Use cudaDeviceSynchronize() to ensure synchronization between the CPU and GPU.
In summary, if you were using cudaThreadSynchronize(), consider switching to cudaDeviceSynchronize() for better compatibility and future-proofing your code1234. 🚀


*/
