# Agbascope: Differential Gene Expression Analysis using DESeq2
library(SummarizedExperiment)
library(DESeq2)

# 1. Load subsetted TNBC dataset
cat("Loading dataset...\n")
se <- readRDS("data/GSE58135_tnbc.rds")

# 2. Extract counts and colData
count_matrix <- assay(se)
sample_info <- as.data.frame(colData(se))

# Ensure sample info has our target group factor properly defined
sample_info$condition <- factor(sample_info$tissue.ch1)

# Set the reference level to the adjacent normal control tissue
sample_info$condition <- relevel(sample_info$condition, ref = "Uninvolved Breast Tissue Adjacent to TNBC Primary Tumor")

# 3. Construct DESeqDataSet
cat("Constructing DESeqDataSet...\n")
dds <- DESeqDataSetFromMatrix(
  countData = count_matrix,
  colData = sample_info,
  design = ~ condition
)

# Pre-filter low count genes
keep <- rowSums(counts(dds)) >= 10
dds <- dds[keep,]

# 4. Run DESeq2 analysis
cat("Running DESeq2 differential expression pipeline...\n")
dds <- DESeq(dds)

# 5. Extract results comparing Tumor vs Adjacent Normal
res <- results(dds)
res_df <- as.data.frame(res)
res_df <- res_df[order(res_df$padj), ]

# 6. Save results with a proper, descriptive name
dir.create("results", showWarnings = FALSE)
output_path <- "results/deseq2_tnbc_vs_normal.csv"
write.csv(res_df, file = output_path)

cat("DESeq2 analysis completed successfully!\n")
cat("Results saved to:", output_path, "\n")

# Print summary of top differentially expressed genes
print(head(res_df))