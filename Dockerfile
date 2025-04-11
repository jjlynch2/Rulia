# Base R Shiny image
FROM rocker/shiny:4.4.3

# Copy shiny-server config file
COPY shiny-server.conf /etc/shiny-server/shiny-server.conf

# Delete example apps from shiny-server
RUN rm -rf /srv/shiny-server/*

# Install R dependencies
RUN R -e "install.packages('JuliaCall')"

# Copy the Shiny app code
COPY MyApp /srv/shiny-server/MyApp

# Copy the sysimage code
COPY sysimage /home/shiny/sysimage

# Copy the Julia code
COPY myjulia /home/shiny/myjulia

# Change ownership of app directory and home directory recursively
RUN chown -R shiny /srv/shiny-server/MyApp &&\
    chown -R shiny /home/shiny

# Switch to user shiny
USER shiny

# Set the working directory
WORKDIR /home/shiny

# Install Julia and build sysimage
ARG JULIAVER=1.11.4

RUN wget -O juliaup https://install.julialang.org &&\
    sh juliaup -y &&\
    /home/shiny/.juliaup/bin/juliaup add $JULIAVER &&\
    /home/shiny/.juliaup/bin/juliaup default $JULIAVER &&\ 
    /home/shiny/.juliaup/bin/julia /home/shiny/sysimage/create_sysimage.jl

# Switch back to root
USER root

# Expose the application port
EXPOSE 3838

# Start shiny-server
CMD shiny-server