# #converting ensemble id  to  gene name
# gen=mat$gene
# #considering ensemble value before decimal
# ens_id <- gsub("\\.[0-9]*$", "", gen)
# ens_id
#
# library(org.Hs.eg.db)
# library(AnnotationDbi)
# #data=as.data.frame(data)
# mat$gene_symbol<-mapIds(org.Hs.eg.db,keys=ens_id,keytype = "ENSEMBL",column = "SYMBOL")
# head(mat)
# #taking gene_symbol column to first colmn of the dataframe
# library(dplyr)
# mat=mat %>% dplyr::select(gene_symbol,everything())
# head(mat)
# #removing na value
# library(tidyr)
# mat=mat %>% drop_na()
# #removing ensemble ids
# mat=mat[-2]
# dim(mat)
# head(mat)
write.csv(mat,file="deg_gene_name.csv")