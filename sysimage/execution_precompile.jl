#used to precompile the julia code in the sysimage
using Statistics
using myjulia
using RCall
using Suppressor

data = rand(20,1)

mymean(data)
