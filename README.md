***Project Name: Gene Expression Analysis And Survival Analysis***

Gene Expression ANalysis:
Gene expression analysis provides quantitative information about the population of RNA species in cells and tissues

High-throughput technologies to measure global gene expression levels started with Serial Analysis of Gene Expression (SAGE) and 
are widely used with microarray and RNA-seq 

For gene expression we are taking GEO database and my case study has lymphoma cancer type of RNA sequence which I have collected from NCBI GEO database

FIle link: https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE145011

File: "GSE145011_RCK8_WT_KO_readcounts.txt"

The file contains two types of reads we have to analysis expression of both types.

Before that we have to proceed following steps first:

Normalization:

Data normalization is a crucial step in the gene expression analysis as it ensures the validity of its downstream analyses

MEthodology:

count per matrix with the formula or available functions (formula is : function(x) x/sum(as.numeric(x)) * 10^6)

Count log with base 2 of cpm 

Count z score with formula = (x-mean)/standard deviation 

count variance of zscore

HeatMap Plot:

MAke a function that contains upto all zscroe counts in array 

Using sns we select only first 10 genes and proceed for heatmap plot

DEG:

Differential expression analysis means taking the normalised read count data and performing statistical analysis to discover 
quantitative changes in expression levels between experimental groups.

Here we take normalized data logCPM matrix value 

Assumption: A549_WT1, A549_WT2 and A549_WT3 belong to Tumor class and A549_KO1, A549_KO2 and
A549_KO3 belong to Control class.

Objective: to identify genes which are differential in tumor vs control samples

Output:

<img width="516" alt="image" src="https://user-images.githubusercontent.com/107881646/197228148-f4b38d9f-dc68-47e2-9ba9-0a6622f80a6f.png">

for every gene:
vec1 = gene[i, tumor]

vec2 = gene[i, control]

to identify DEG,
perform t.test using vec1 vec2

calculate log2FC:
log2FC = mean(vec1) - mean(vec2)

Circos plot:

Circos, is a circular ideogram layout to display relationships between genomic intervals.

First of all we build the basic chromosome  ideogram
and take my deg file that contains log2 fold change values and p values

Intersect deg gene name  with bimaRT 'hgnc_symbol' gene name 

Track upsiginificant genes in the chromosome

Ssgsea Analysis:

Single Sample Geneset Enrichment Analysis The ssGSEA method is an extension of the GSEA method, working at the level of a single sample rather than a sample population as in the original GSEA application. The score derived from ssGSEA reflects the degree to which the input gene signature is coordinately up- or downregulated within a sample.
 Create a ssgsea function
 
Read the log2 normalized data into an object for further analysis

zscore the ssgsea output for comparative analysis

Heatmap plot for zscore 

Survival Analysis:

Survival Analysis using bulk cancer types:

Survival analysis is a set of statistical approaches used to find out the time it takes for an event of interest to occur. 

Survival analysis is used to study the time until some event of interest (often referred to as death) occurs. 

Time could be measured in years, months, weeks, days, etc. In cancer studies, most of the survival analyses use the following methods. 

  (1) Kaplan-Meier plots to visualize survival curves. 
  
  (2) Nelson-Aalen plots to visualize the cumulative hazard. 
  
  (3) Log-rank test to compare the survival curves of two or more groups 
  
  (4) Cox proportional hazards regression to find out the effect of different variables like age, sex, race on survival.
  
Survival analysis of Breast cancer using R:
 With the help of  R inbuild lbrary survival I have ploted survival plobability of different attributes. 

10X single-cell RNA-seq analysis :

In RNA-seq single cell analysis we  analyse 10X Chromium single-cell RNA-seq profiles using R. 
This will include reading the count data into R, quality control, normalisation, dimensionality reduction, cell clustering and finding marker genes. 

The main part of the workflow uses the package. 

I have generated some  common plots for visualising single-cell data, such as t-SNE plots (using dimensionality reduction technology) and heatmaps. 


Name:
Wahidul Alam Barbhuiya
