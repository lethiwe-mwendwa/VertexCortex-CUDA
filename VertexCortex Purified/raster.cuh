#pragma once

#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>
#include "framebuffer.h"
#include <iostream>


// first kernel to work on!
__global__ void drawRectKernel(int x, int y, int width, int height, uint32_t colour, frameBuffer&);