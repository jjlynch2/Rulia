#set working directory
cd("/home/shiny/sysimage/")

using Pkg
Pkg.add("PackageCompiler")

using PackageCompiler

#create new environment
Pkg.activate("/home/shiny/sysimage/")

#Add packages
Pkg.add("Pkg")
Pkg.add("Statistics")
Pkg.add("RCall")
Pkg.add("Suppressor")
Pkg.develop(PackageSpec(path="/home/shiny/myjulia"))

#Create sysimage and precompile our code
create_sysimage(sysimage_path="/srv/shiny-server/MyApp/sysimage.so", precompile_execution_file="/home/shiny/sysimage/execution_precompile.jl")