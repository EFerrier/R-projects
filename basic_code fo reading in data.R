# TODO: Program use to read-in and process the High speed video data for Bolis
# Author: 10104515
###############################################################################
#clear all objects from the console before reading in the current data
rm(list = ls())

## set-up the folder/directory location
path=file.path="C:\\eclipse\\workspace\\"
setwd(path)

# Required libraries
require(zoo)
require(plyr)

#Filenames that will read in
file.root="Box"
x.files=list.files()
index=grep(file.root, x.files)
use.files=x.files[index]
options(stringsAsFactors=FALSE)

## Get data files for group
	nFile=length(use.files)
	
	## Variable Initialization
	Force.Max = numeric(nFile)
	
	# Dataframe to store the output data
	df.out <- NULL
		
	## Reads in the files 
	for(iFile in 1:nFile){
			#Read in the data files
		df.temp=read.csv(use.files[iFile], sep=";", header=FALSE, 
				col.names=c("Time", "Force", "blank"))[-1:-3, ]  #this will skip the 1st 3 rows
		
		df.temp$Force=as.numeric(df.temp$Force)
		df.temp$Time=as.numeric(df.temp$Time)
								
	}
	
#Print out the Data to a .csv file
	df.out=data.frame(FileName=use.files)
	write.csv(df.out, file="Force-All.csv",row.names=FALSE)

