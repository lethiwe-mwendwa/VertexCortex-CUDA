#include "raster.cuh"



// x and y signify the starting point.
// << grid, block>>
// TODO make code readable. this is a fuckin mess
void drawRectGPU(int x_start, int y_start, int width, int height, uint32_t colour, Window* window){

	// update GPU framebuffer
	updateDeviceframebuffer(window->gpuBuffer,window->mainBuffer);

	//compute
	drawRectKernel<<<height, width>>>(x_start, y_start, width, height, colour, window->gpuBuffer);

	// update main framebuffer
	updateHostframebuffer(window->mainBuffer, window->gpuBuffer);

}



__global__ void drawRectKernel(int x_start, int y_start, int width, int height, uint32_t colour, frameBuffer* fb) {
	
	int y = blockIdx.x + y_start;
	int x = threadIdx.x + x_start;

	if (y >= 0 && y < fb->height && x >= 0 && x < fb->width) {

		fb->colourBuffer[y * fb->width + x] = colour;
	}

	return;

}