#load libraries
library(shiny)
library(JuliaCall)

shinyServer(function(input, output, session) {
	julia_setup(sysimage_path = "./sysimage.so") #loads julia with the sysimage
	data <- julia_call("myjulia.mymean", c(1,2,3,4,5)) #calls our julia function with some data
	output$myresults <- renderText({
		paste("Mean", data, sep = ":")
	})
})
