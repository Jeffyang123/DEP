% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_functions_frequencies.R
\name{plot_coverage}
\alias{plot_coverage}
\title{Plot protein coverage}
\usage{
plot_coverage(se, plot = TRUE, features_type = "features")
}
\arguments{
\item{se}{SummarizedExperiment,
Data object for which to plot observation frequency.}

\item{plot}{Logical(1),
If \code{TRUE} (default) the barplot is produced.
Otherwise (if \code{FALSE}), the data which the
barplot is based on are returned.}

\item{features_type}{Character(1), the type of features used in title, like 'proteins', 'genes',
'peptides', default is 'features'}
}
\value{
Barplot of protein coverage in samples
(generated by \code{\link[ggplot2]{ggplot}})
}
\description{
\code{plot_coverage} generates a barplot
of the protein coverage in all samples.
}
\examples{
# Load example
data(Silicosis_pg)
data <- Silicosis_pg
data_unique <- make_unique(data, "Gene.names", "Protein.IDs", delim = ";")

# Make SummarizedExperiment
ecols <- grep("LFQ.", colnames(data_unique))


## Load experiement design
data(Silicosis_ExpDesign)
exp_design <- Silicosis_ExpDesign
se <- make_se(data_unique, ecols, exp_design)

# Filter and normalize
filt <- filter_se(se, thr = 0, fraction = 0.4, filter_formula = ~ Reverse != "+" & Potential.contaminant!="+")

plot_coverage(filt)
}
