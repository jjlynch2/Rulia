module myjulia

#pulls depends into scope
using Statistics

#include julia code
include("myfunctions.jl")

#export function calls
export mymean

end # module myjulia
