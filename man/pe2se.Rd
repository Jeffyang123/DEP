% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DEP_aggregation.R
\name{pe2se}
\alias{pe2se}
\title{Extract the proteins SummarizedExperiment object from a QFeatures container}
\usage{
pe2se(
  pe_aggregated,
  names = "Gene.names",
  ids = "smallestProteingroups",
  delim = ";"
)
}
\arguments{
\item{pe_aggregated}{A QFeatures object output from \code{aggregate_pe()}, which contain a "protein" quantative assay.}

\item{names}{The column of gene names, which serve as feature identifier and is transmitted to \link{make_unique}}

\item{ids}{The column of protein ID, transmitted to \link{make_unique}. aggregate_pe automatically generate a "smallestProteingroups" column
to store ids in proteingroups.}

\item{delim}{Character. The separator in names of ids.}
}
\value{
A SummarizedExperiment object.
}
\description{
This function accept a result from \link{aggregate_pe}(),
tidy features identifiers and return a SE object for following analyze
}
\examples{
\dontrun{
# Load example peptide data
data(Silicosis_peptide)
ecols <- grep("Intensity.", colnames(Silicosis_peptide), value = TRUE)

# construct QFeatures object
pe_peptides <- make_pe_parse(Silicosis_peptide, columns = ecols, remove_prefix = TRUE, log2transform = TRUE,mode = "delim")

# Filter, imputation
pe <- filter_pe(pe_peptides, thr = 1,fraction = 0.4, filter_formula = ~ Reverse != '+' & Potential.contaminant !="+" )
pe <- impute_pe(pe, fun = "QRILC", name = "peptideImp")

# Normalization
pe <- normalize_pe(pe,method = "quantiles", i = "peptideImp", name = "peptideNorm")

# Summarize peptide value to protein quantity
protein_pe <- DEP2::aggregate_pe(pe, fcol = "Proteins", i = "peptideNorm")
class(protein_pe)

# Construct a SE object
se <- pe2se(protein_pe)
class(se)
}
}
