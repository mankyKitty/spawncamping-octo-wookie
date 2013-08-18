#include <stdio.h>
#include <cuda_runtime.h>

__global__ void add(int a, int b, int *c) 
{
  *c = a + b;
}

int main()
{
  int c;
  int *dev_c;
  add<<1,1>>(100, 100, *dev_c);
  cudaMemcpy(&c, dev_c, sizeof(int), cudaMemcpyDeviceToHost);
  printf("100 + 100 = %d\n", c);
  cudaFree(dev_c);
  return 0;
}
