#include <CL/cl.h>
#include <iostream>
#include <vector>

using namespace std;

int main() {
    cl_platform_id platform;
    cl_device_id device;
    cl_context context;
    cl_command_queue command_queue;
    cl_int error;

    if(clGetPlatformIDs(1, &platform, NULL) != CL_SUCCESS) {
        cout << "platform error" << endl;
    }

    if(clGetDeviceIDs(platform, CL_DEVICE_TYPE_GPU, 1, &device, NULL) != CL_SUCCESS) {
        cout << "device error" << endl;
    }

    context = clCreateContext(NULL, 1, &device, NULL, NULL, &error);
    if(error != CL_SUCCESS) {
        cout << "context error" << endl;
    }

    command_queue = clCreateCommandQueue(context, device, 0, &error);
    if(error != CL_SUCCESS) {
        cout << "command queue error" << endl;
    }

    return 0;
}
