# set the directory to file where the 21 downloaded R functions are#
sdir = "C:/open-fvs/rFVS/R"
for (rf in dir (sdir)) source (paste(sdir,rf,sep="/"))


# load the FVS libraryin rstudio (where you have built a copy of your FVS variant)#
{{{
  fvsLoad("FVSiec", bin="C:/open-fvs/trunk/bin")
}}}

#set the directory for writing the .key file#
key.dir <- getwd()
key.filename <- "trial.key"
keyfile <- file.path(key.dir,key.filename)


##make fake data##

FVS.Tree.Data<- data.frame(plot=rep(1:4,each=5),tree=1:20,
                        count=1,species="DF",dbh=rnorm(20,12,3),
                        hist=1,height=NA,crown.ratio=c(NA,runif(19,0,1)*100))

##OR Load Your Own Dataframe##

FVS.Tree.Data<- <your data here>

#Make sure that your crown ratios are out of 100 (ie not .30)

FVS.Tree.Data$crown.ratio<-FVS_TreeInit$crown.ratio*100


#Make sure that the column headers of your data frame match this:#
  #note that you may have to change headers from what you use in suppose#
  #plot:      plot number corresponding to tree record#
  #tree:     for tree identifer number#
  #count:    for how many trees are represented by the record
  #species:  see FVS IE variant for species codes#
  #dbh:      diameter at breast height#
  #hist:     1=alive, 6 =tree died during obs period, 9=died prior to obs#
  
  ##Entries for the following are optional, although NA if absent##
  #height:       in feet
  #crown.ratio:  as a percentage of 100

## set options##

#Suppress simulated natural Ingrowth? (TRUE/FALSE)#
NOAUTOES <- TRUE

#Request output table that shows a statistical desription of input data#
STATS <- TRUE

#Set seed to 0 for stochastic output, to some other
#integer for repeatable stochastic output#
RANNSEED <- 55329

#Prevent tripling of tree records?#
NOTRIPLE <- TRUE 

#Name of Stand (STDIDENT)#
stdname<-("Murphy")

##Cruise Design##
#BAF- Negative value is interpreted as the inverse of a large fixed area plot#
BAF<-(20)
#Fixed Plot Size- the inverse area for cruise designs using a nested fixed radius plot for small trees#
FRP<-(100)
#Break point- the diameter cuttoff between large and small tree plots, default is 5in, put "999"#
#for cruise designs that only use one plot size#
DiamCO<-(5)
#Plot Count#
Plotcount<-(15)
#Non-Stockable Plots#
nonstock<-(0)
#Prop of stand considered stockable#  
propstockstand<-(1)


##Stand Info (STDINFO)##
#National Forest Near Where Stand is Located (Refer to variant guides)#
NFcode<-(118)
#Stand habitat code
habtype <- 11
#Stand age in years#
age<-(34)
#Stand Aspect in degrees #
aspect<-(300)
#Stand Slope in percent#
slope<-(30)
#Stand Elevation in feet#
elev <- 3200
elev <- round(elev/100)

##Inventory Year (INVYEAR)##
year <- (2000)

##Number of Cycles to be projected (NUMCYCLE)##
numcycle<-(10)

## Cycle length in years ##
cyclelen <- (10)


# make a keyword file (set to where your make.keyword.r file is located)
source('C:/open-fvs/rFVS/R/make.keyword.R')

