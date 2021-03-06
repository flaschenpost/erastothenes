#include <utility>
#define __NO_STD_VECTOR // Use cl::vector instead of STL version
#include <CL/cl.hpp>
#include <cstdio>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <string>
#include <iterator>

const std::string hw("Hello World\n");

inline void
checkErr(cl_int err, const char * name)
{
    if (err != CL_SUCCESS) {
        std::cerr << "ERROR: " << name
            << " (" << err << ")" << std::endl;
        exit(EXIT_FAILURE);
    }
}

int
main(void)
{
    cl_int err;
    cl::vector< cl::Platform > platformList;
    cl::Platform::get(&platformList);
    checkErr(platformList.size()!=0 ? CL_SUCCESS : -1, "cl::Platform::get");
    std::cerr << "Platform number is: " << platformList.size() << std::endl;std::string platformVendor;
    platformList[0].getInfo((cl_platform_info)CL_PLATFORM_VENDOR, &platformVendor);
    std::cerr << "Platform is by: " << platformVendor << "\n";

    cl_context_properties cprops[3] =
    {CL_CONTEXT_PLATFORM, (cl_context_properties)(platformList[0])(), 0};
    cl::Context context(
            CL_DEVICE_TYPE_CPU,
            cprops,
            NULL,
            NULL,
            &err);
    checkErr(err, "Context::Context()"); 
    cl::vector<cl::Device> devices;
    devices = context.getInfo<CL_CONTEXT_DEVICES>();
    checkErr(
            devices.size() > 0 ? CL_SUCCESS : -1, "devices.size() > 0");
    std::cout << devices.size() << "\n";

    long *host = new long[1024];
    cl::Buffer memCL(context, CL_MEM_WRITE_ONLY | CL_MEM_USE_HOST_PTR, 1024, host, &err);
    checkErr(err, "Buffer::Buffer()");

}
