path.nm <- 'C:/zot/Casal2/2023/9sep/sep28/' # local path
path.dat <- paste(path.nm,'data/',sep='') # path to data
#path.out <- paste(path.nm,'propRec_csvs/',sep='')
p.diets <- read.csv(paste(path.dat,'AERD_KRILL_LF_DATA.csv',sep=''))

p.diets$amount <- NA # set up totals per sample_id column
amount <- aggregate(p.diets$KRILL_LENGTH,list(p.diets$SAMPLE_ID),length)

for (id in 1:length(unique(p.diets$SAMPLE_ID))){
  p.diets$amount[p.diets$SAMPLE_ID == amount$Group.1[id]] <- amount$x[id]
  }
p.diets <- p.diets[!p.diets$SAMPLE_ID == "2007045A",] # remove the sample with a character ID

# use January and February diet samples
diet.spp_mo_1_2 <- tapply(p.diets$amount,                 # Numbers measured in each length-class
                    list(p.diets$KRILL_LENGTH,p.diets$SAMPLE_YEAR,
                    p.diets$SAMPLE_MONTH==1 | p.diets$SAMPLE_MONTH==2,p.diets$SPP),  # by sample, length, year,length
                    length)

# merge January and February diet samples
diet.spp_mo_1_2 <- tapply(p.diets$amount,    
                    list(p.diets$KRILL_LENGTH,p.diets$SAMPLE_YEAR,
                    p.diets$SPP),  # by sample, length, year,length
                    length)

diet.spp_mo_1_2[is.na(diet.spp_mo_1_2)] <- 0

# calculate krill lf proportions for each predator
ADPE.props <- prop.table(diet.spp_mo_1_2[,,1],2)
CHPE.props <- prop.table(diet.spp_mo_1_2[,,2],2)
GEPE.props <- prop.table(diet.spp_mo_1_2[,,3],2)

# drop unsampled years for each predator
ADPE.props <- ADPE.props[,colSums(is.na(ADPE.props))<nrow(ADPE.props)]
CHPE.props <- CHPE.props[,colSums(is.na(CHPE.props))<nrow(CHPE.props)]
GEPE.props <- GEPE.props[,colSums(is.na(GEPE.props))<nrow(GEPE.props)]

write.table(na.omit(t(ADPE.props)),'ADPE.txt',quote=FALSE)
write.table(na.omit(t(CHPE.props)),'CHPE.txt',quote=FALSE)
write.table(na.omit(t(GEPE.props)),'GEPE.txt',quote=FALSE)






