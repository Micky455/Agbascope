# Agbascope

Agbascope is a bioinformatics project focused on the computational analysis of gene expression data, with an emphasis on understanding molecular differences between biological conditions.

The project uses R and Python to explore gene expression datasets, perform differential expression analysis, and generate visualisations that support the interpretation of molecular data.

## Dataset

This project uses the publicly available RNA-sequencing dataset GSE58135, obtained from the NCBI Gene Expression Omnibus (GEO).

Dataset source: https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE58135

## Methodology

The project combines R and Python for data processing, statistical analysis, and visualisation.

- R: RNA-sequencing data handling and differential gene expression analysis.
- Python: Data inspection and computational support.
- Visualisation: Volcano plots to explore patterns of differential gene expression.

## Results

The project includes:

- A differential gene expression results table (`deseq2_tnbc_vs_normal.csv`).
- A volcano plot (`volcano_plot.png`) for visual exploration of differential expression patterns.

## Project Structure

Agbascope/
|-- data/
|-- python/
|-- R/
|-- results/
|-- tests/
|-- .gitignore
|-- README.md
|-- requirements.txt

## Reproducibility

The analysis scripts are organised into separate R and Python directories. The `requirements.txt` file lists the Python dependencies required by the project.

## Tools

- R
- Python
- Git and GitHub
- Visual Studio Code

## Author

Developed by Michael Agbale.

Interests: Molecular biotechnology, computational biology, gene expression analysis, and genetic engineering.

GitHub Repository: https://github.com/Micky455/Agbascope
