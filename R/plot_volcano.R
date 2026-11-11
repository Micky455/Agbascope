# Agbascope: Generate Volcano Plot from DESeq2 Results

# 1. Load differential expression results
res_df <- read.csv("results/deseq2_tnbc_vs_normal.csv", row.names = 1)

# Remove rows with NA values in p-values or log2 fold changes
res_df <- res_df[!is.na(res_df$padj) & !is.na(res_df$log2FoldChange), ]

# 2. Define significance thresholds
padj_thresh <- 0.05
lfc_thresh <- 1.0

# Classify genes for coloring
res_df$expression <- "Not Significant"
res_df$expression[res_df$padj < padj_thresh & res_df$log2FoldChange > lfc_thresh] <- "Upregulated"
res_df$expression[res_df$padj < padj_thresh & res_df$log2FoldChange < -lfc_thresh] <- "Downregulated"

# 3. Create output directory and open PNG graphics device
dir.create("results", showWarnings = FALSE)
png("results/volcano_plot.png", width = 800, height = 600, res = 120)

# 4. Generate Volcano Plot
cols <- c("Upregulated" = "firebrick3", "Downregulated" = "dodgerblue3", "Not Significant" = "grey70")
plot(
  res_df$log2FoldChange, -log10(res_df$padj),
  col = cols[res_df$expression],
  pch = 20, cex = 0.6,
  xlab = expression(Log[2]~Fold~Change~(Tumor~vs~Normal)),
  ylab = expression(-log[10]~Adjusted~P-value),
  main = "Volcano Plot: TNBC vs Adjacent Normal Tissues"
)

# Add threshold guideline lines
abline(h = -log10(padj_thresh), col = "black", lty = 2, lwd = 0.8)
abline(v = c(-lfc_thresh, lfc_thresh), col = "black", lty = 2, lwd = 0.8)

# Add legend
legend(
  "topright", 
  legend = c("Upregulated", "Downregulated", "Not Significant"),
  col = c("firebrick3", "dodgerblue3", "grey70"), 
  pch = 20, bty = "n", cex = 0.8
)

dev.off()
cat("Volcano plot successfully generated and saved to results/volcano_plot.png!\n")