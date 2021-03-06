
#### Data to extract Age Length keys from ICES Exchange format  #####

parseExchangeFormatALKs <- function (wd =  "D:/bearedo/Database/DATRAS/NS-IBTS")  {

 setwd(wd)

fnames<-list.files()
fnames<-fnames[grep("Exchange Data_",fnames)]
fnames<-fnames[grep(".csv",fnames)]

#Age length keys data

out<-NULL
for(i in 1:length(fnames)){
cnts<-count.fields(fnames[i],sep=",")
alk<-readLines(fnames[i])
alk<-cbind(alk,cnts)
alk<-alk[alk[,2]=="23",][,-2]
print(length(alk))
out<-c(out,alk[-1])
}

alk <- data.frame(matrix(unlist(strsplit(out,",")),byrow=T,ncol=23))

dimnames(alk)[[2]] <-c("recordtype","quarter","country","ship","gear","sweeplngt","gearexp","doortype","stno","haulno",
"year","speccodetype","speccode","areatype","areacode","lngtcode","lngtclass","sex","maturity","plusgr","age","noatalk","indwgt")

alk$quarter <- as.numeric(as.character(alk$quarter))
alk$sweeplngt <- as.numeric(as.character(alk$sweeplngt)) 
alk$haulno <- as.numeric(as.character(alk$haulno)) 
 alk$stno <- as.numeric(as.character(alk$stno)) 
 alk$year <- as.numeric(as.character(alk$year))
 alk$speccode <-as.numeric(as.character(alk$speccode)) 
 alk$areatype <- as.character(alk$areatype) 
 alk$areacode <- as.character(alk$areacode)
 alk$lngtclass <- as.numeric(as.character(alk$lngtclass)) 
 alk$noatalk <- as.numeric(as.character(alk$noatalk))  
 alk$indwgt  <- as.numeric(as.character(alk$indwgt))
 alk$age  <- as.numeric(as.character(alk$age))
 
 
print(str(alk))

alk 

}


### Example ######

### alk <-  parseExchangeFormatALKs(wd =  "D:/bearedo/Database/DATRAS/NS-IBTS") 






