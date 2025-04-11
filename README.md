## Rulia
Create a docker image with R, Julia, and shiny-server for deploying R-based shiny apps that rely on Julia. It's setup to precompile your julia code as a module into a sysimage to speed up the initial loading of the Julia environment. This uses the rocker/shiny docker image.

## Installation
```sh
git clone https://github.com/Rulia
docker build -t myapp .
docker run -d -p 4444:3838 myapp
```

## Access app
http://localhost:4444/MyApp/