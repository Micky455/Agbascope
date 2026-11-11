# Agbascope: Retrieve, cache, and inspect real RNA-seq data
library(GEOquery)
library(SummarizedExperiment)

accession <- "GSE58135"
rds_path <- "data/GSE58135.rds"

# 1. Check if local cache exists; if not, download and save
if (file.exists(rds_path)) {
  message("Loading dataset from local cache: ", rds_path)
  se <- readRDS(rds_path)
} else {
  message("Local cache not found. Downloading from NCBI GEO...")
  available <- hasRNASeqQuantifications(accession)
  
  if (available) {
    se <- getRNASeqData(accession)
    
    if (!dir.exists("data")) {
      dir.create("data")
    }
    
    saveRDS(se, rds_path)
    message("Dataset successfully downloaded and saved to ", rds_path)
  } else {
    stop("RNA-seq quantifications not available for ", accession)
  }
}

# 2. Display dataset dimensions
print(se)

# 3. Inspect sample metadata tissue categories
sample_metadata <- as.data.frame(colData(se))
print(table(sample_metadata$tissue.ch1, useNA = "ifany"))