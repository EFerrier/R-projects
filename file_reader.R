# TODO: Program use to read-in and process the High speed video data for Bolis
# Author: 10104515
###############################################################################
#clear all objects from the console before reading in the current data
rm(list = ls())

## set-up the folder/directory location C:\Users\10124429\OneDrive - BD\Documents\sample revenue dashboard\HY-EN-11808 data
path=file.path="C:\\Users\\10124429\\OneDrive - BD\\Documents\\R sample revenue dashboard\\HY-EN-11808 data"
setwd(path)

# Required libraries
require(zoo)
require(plyr)


#Filenames that will read in
file.root="HY-EN-11808"
x.files=list.files()
index=grep(file.root, x.files)
use.files=x.files[index]
options(stringsAsFactors=FALSE)

## Get data files for group
nFile=length(use.files)

## Variable Initialization
Torque.Max = numeric(nFile)

# Dataframe to store the output data
df.out <- NULL

data <- vector("list", nFile)

## Reads in the files 
for(iFile in 1:nFile){
  #Read in the data files
  
  df.temp=read.csv(use.files[iFile], nrows=10, skip=23, sep= ",", header=FALSE, 
                   col.names=c("Sample", "Torque", "Time", "Comments"))
  
  #df.temp=read.csv(use.files[iFile], sep= ",", header=FALSE, 
                   #col.names=c("Sample", "Torque", "Time", "Comments"))[-1:-23, ]  #this will skip the 1st 3 rows
  
  #df.temp$Sample=as.numeric(df.temp$Sample)
  #df.temp$Torque=as.numeric(df.temp$Torque)
  
  data[[iFile]] = df.temp
}

'HY-EN-11808_G1_00' = data[[1]]
'HY-EN-11808_G10_00' = data[[2]]

#Print out the Data to a .csv file
df.out=data.frame(FileName=use.files)
write.csv(df.out, file="Torque-All.csv",row.names=FALSE)