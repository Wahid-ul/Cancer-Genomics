library("RCircos")

#Description of Human chromosome ideogram v38 in the data frame format
data("UCSC.HG38.Human.CytoBandIdeogram")

#
cyto.info = UCSC.HG38.Human.CytoBandIdeogram

#Initialize Core Components for RCircos Plot
RCircos.Set.Core.Components(cyto.info, 
                            chr.exclude=NULL, 
                            tracks.inside=10, 
                            tracks.outside=0)


#Setup Plot Area for RCircos Plot
RCircos.Set.Plot.Area()

#Plot Chromosome Ideogram
RCircos.Chromosome.Ideogram.Plot()

#null assigning to cyto info
cyto.info = UCSC.HG38.Human.CytoBandIdeogram
cyto.info$Name = NA
cyto.info$Stain = NA
RCircos.Set.Core.Components(cyto.info, 
                            chr.exclude=NULL, 
                            tracks.inside=10, 
                            tracks.outside=0)
chr_order = unique(cyto.info$Chromosome)

RCircos.Set.Plot.Area()
RCircos.Chromosome.Ideogram.Plot()

#ideogram plot with different color
ideo = RCircos.Get.Plot.Ideogram()
ideo$BandColor = 'salmon'
num = which(ideo$Chromosome == 'chrX')
ideo[num, 'BandColor'] = 'chartreuse'

num = which(ideo$Chromosome == 'chrY')
ideo[num, 'BandColor'] = 'purple'
RCircos.Reset.Plot.Ideogram(ideo)
RCircos.Set.Plot.Area()
RCircos.Chromosome.Ideogram.Plot()

#
num = which(ideo$Chromosome == 'chr1')
ideo[num, 'ChrColor'] = 'goldenrod2'
RCircos.Reset.Plot.Ideogram(ideo)
RCircos.Set.Plot.Area()
RCircos.Chromosome.Ideogram.Plot()


library(biomaRt)
library(org.Hs.eg.db)
#tracking deg file that contains upregulated genes 
mat1=read.csv("deg.csv", row.names = 1)

head(mat1)

library(biomaRt)
m = useMart('ensembl', dataset='hsapiens_gene_ensembl')
#getBM is main query function of biomaRt gives a set of filter and 
#its corrosponding value ,retrieves user specific attributes 
#from the biomaRt database

coords = getBM(attributes=c('chromosome_name', 'start_position', 
                            'end_position', 'hgnc_symbol'),
               filters = c('hgnc_symbol'),
               values = list(row.names(mat1)),
               mart = m)

#saving biomarts attributes in csv format
write.csv(coords, file = 'coords.csv')

#concatenate 'chromosome_name' vector into a single string with no space
coords$chromosome_name = paste0('chr', coords$chromosome_name)

#catagorized 'chromosome_name' data into different level
coords$chromosome_name = factor(coords$chromosome_name, levels = chr_order)

#selecting null value from chromosome_name column
num = which(is.na(coords$chromosome_name))

#elemenating null value
coords = coords[-num, ]

#taking upregulated genes of value less than 3 for both pvalue & log2FC
up = which((mat1$pvalue<3) &
             (mat1$log2FC<3))
upmat = mat1[up, ]

num = which(coords_new$hgnc_symbol %in% rownames(upmat))
coords1 = coords[num, ]

#draw gene names on a data track
RCircos.Gene.Name.Plot(coords1, name.col=4, track.num = 2, side = "in",
                       is.sorted = F)

#checking for intersecting genes from  coords and my dataset
genes = intersect(rownames(mat1), coords$hgnc_symbol)

#combining genes from both dataset into a single set with different column
mat2 = mat1[genes, ]
df = cbind.data.frame(row.names(mat1), mat1[, c(1,2,3)])
colnames(df)[1] = 'hgnc_symbol'

data = merge(coords, df, by = 'hgnc_symbol', all.x = T)
library(tidyr)
data=data %>% drop_na()

#reshaping data as first 3 rows are needed to be chromosome name,position(start & end)
data=data[,c(2,3,4,5,6,1,7)]

data = data[, c('chromosome_name', 'start_position',
                'end_position', 
                'meanTumor', 'meanControl', 'hgnc_symbol','log2FC')]
library(tibble)

#draw heatmap for one data track
RCircos.Heatmap.Plot(data, data.col = 7, track.num = 6, side = "in",
                     min.value = -3, max.value = 3.5, genomic.columns = 3,
                     is.sorted = F)

#heatmap track with color and number of track variation
RC.param = RCircos.Get.Plot.Parameters()
RC.param['heatmap.color'] = "GreenWhiteRed"
RCircos.Reset.Plot.Parameters(RC.param)

RCircos.Heatmap.Plot(data, data.col = 7, track.num = 10, side = "in",
                     min.value = -2, max.value = 2,
                     is.sorted = F)
