#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <chrono>

using namespace std::chrono;

__device__ void warpReduce(volatile float *sdata, int tid) {
    sdata[tid] += sdata[tid + 32];
    sdata[tid] += sdata[tid + 16];
    sdata[tid] += sdata[tid + 8];
    sdata[tid] += sdata[tid + 4];
    sdata[tid] += sdata[tid + 2];
    sdata[tid] += sdata[tid + 1];
}

__global__ void reduce5(float *g_idata, float *g_odata) {
    extern __shared__ float sdata[];

    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * (blockDim.x * 2) + threadIdx.x;
    sdata[tid] = g_idata[i] + g_idata[i + blockDim.x];
    __syncthreads();
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) { sdata[tid] += sdata[tid + s]; }
        __syncthreads();
    }

    if (tid > 32) warpReduce(sdata, tid);
}

int main(void) {
    int N = 100000000;
    float *g_indata_host, *g_indata_device, *g_outdata_host, *g_outdata_device;
    g_indata_host = (float *) malloc(N * sizeof(float));
    g_outdata_host = (float *) malloc(sizeof(float));

    cudaMalloc(&g_indata_device, N * sizeof(float));
    cudaMalloc(&g_outdata_device, sizeof(float));

    for (auto i = 0; i < N; i++) {
        g_indata_host[i] = static_cast <float> (rand()) / static_cast <float> (RAND_MAX);;
    }

    cudaMemcpy(g_indata_device, g_indata_host, N * sizeof(float), cudaMemcpyHostToDevice);

//    This is where the code is run
    auto start = high_resolution_clock::now();
    reduce5<<<(N + 255) / 256, 256>>>(g_indata_device, g_outdata_device);
    auto stop = high_resolution_clock::now();
    auto duration = duration_cast<microseconds>(stop - start);
    std::cout << "Time taken by function: "
              << duration.count() << " microseconds" << std::endl;
    cudaFree(g_indata_device);
    cudaFree(g_outdata_device);
    free(g_indata_host);
    free(g_outdata_host);

}