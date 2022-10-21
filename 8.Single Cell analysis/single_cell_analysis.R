library("patchwork")
library("Seurat")
library("dplyr")
library(Matrix)
# rt=read.table("lymphoma/features.tsv.gz")
# gene=rt[1:10,1:2]
# save(gene,file = "genes.tsv.gz")
# data=read.csv("GSM6601966_p1001_raw_counts.csv.gz")
# head(data)
# data1=Matrix(data,spars=T)
# data1
pbmc.data = Read10X(data.dir = "lymphoma/",gene.column = 2,unique.features = TRUE,strip.suffix = -1)
pbmc = CreateSeuratObject(counts = pbmc.data, min.cells = 3, min.features = 200)
pbmc

#data=read.csv

pbmc.data[1:50, 1:10]

pbmc[["percent.mt"]] = PercentageFeatureSet(pbmc, pattern = "^MT-")
head(pbmc@meta.data)

# FeatureScatter is typically used to visualize feature-feature relationships, but can be used
# for anything calculated by the object, i.e. columns in object metadata, PC scores etc.

plot1 = FeatureScatter(pbmc, feature1 = "nCount_RNA", feature2 = "percent.mt")
plot2 = FeatureScatter(pbmc, feature1 = "nCount_RNA", feature2 = "nFeature_RNA")
plot1
plot2

pbmc = subset(pbmc, subset = nFeature_RNA > 200 & nFeature_RNA < 2500 & percent.mt < 5)
pbmc

pbmc = NormalizeData(pbmc)
pbmc = FindVariableFeatures(pbmc, selection.method = "vst", nfeatures = 2000)

# Identify the 10 most highly variable genes
top10 = head(VariableFeatures(pbmc), 10)
top10

# plot variable features with and without labels
plot1 = VariableFeaturePlot(pbmc)
plot2 = LabelPoints(plot = plot1, points = top10, repel = TRUE)
plot2

all.genes = rownames(pbmc)
pbmc = ScaleData(pbmc, features = all.genes)
VlnPlot(pbmc, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)

## Centering and scaling data matrix
pbmc@assays$RNA@scale.data[1:50, 1:5]

pbmc = RunPCA(pbmc, features = VariableFeatures(object = pbmc))
DimHeatmap(pbmc, dims = 1:15, cells = 500, balanced = TRUE)

ElbowPlot(pbmc)

pbmc = FindNeighbors(pbmc, dims = 1:10)

## Computing nearest neighbor graph
## Computing SNN
pbmc = FindClusters(pbmc, resolution = 0.5)
head(pbmc@meta.data)

pbmc = RunUMAP(pbmc, dims = 1:10)

DimPlot(pbmc, reduction = "umap")
DimPlot(pbmc, reduction = "umap", label = T)

pbmc.markers = FindAllMarkers(pbmc, only.pos = TRUE, min.pct = 0.25, logfc.threshold = 0.25)

head(pbmc.markers)

a = pbmc.markers %>% group_by(cluster) %>% top_n(n = 2, wt = avg_log2FC)
a

genes = a %>% pull(gene)
genes
FeaturePlot(pbmc, features = genes[1:2], cols = c("white", "red"))