# Agbascope: Isolate TNBC primary tumors and adjacent normal tissues
library(SummarizedExperiment)

# 1. Load locally cached dataset
rds_path <- "data/GSE58135.rds"
se <- readRDS(rds_path)

# 2. Extract sample metadata
col_data <- as.data.frame(colData(se))

# 3. Define target comparison categories
target_groups <- c(
  "Triple Negative Breast Cancer Primary Tumor",
  "Uninvolved Breast Tissue Adjacent to TNBC Primary Tumor"
)

# 4. Subset SummarizedExperiment object
keep_samples <- col_data$tissue.ch1 %in% target_groups
se_tnbc <- se[, keep_samples]

# 5. Save filtered object locally
saveRDS(se_tnbc, "data/GSE58135_tnbc.rds")

# 6. Output verification statistics
print("Subsetted TNBC object saved successfully!")
print(dim(se_tnbc))
print(table(colData(se_tnbc)$tissue.ch1))