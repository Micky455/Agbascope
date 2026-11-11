# Agbascope: Validate count distribution, data types, and experimental design
library(SummarizedExperiment)

# 1. Load the subsetted TNBC dataset
se <- readRDS("data/GSE58135_tnbc.rds")
counts <- assay(se)

cat("=== 1. DATA TYPE CHECK ===\n")
is_integer <- all(counts == floor(counts))
cat("Are all counts integer values?:", is_integer, "\n\n")

cat("=== 2. COUNT MATRIX SUMMARY ===\n")
cat("Matrix Dimensions (Genes x Samples):", dim(counts), "\n")
print(summary(as.vector(counts)))
cat("\nZero count percentage:", mean(counts == 0) * 100, "%\n\n")

cat("=== 3. SAMPLE GROUP FACTOR LEVELS ===\n")
groups <- factor(colData(se)$tissue.ch1)
print(levels(groups))
print(table(groups))