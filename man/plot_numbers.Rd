% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_functions_frequencies.R
\name{plot_numbers}
\alias{plot_numbers}
\title{Plot protein numbers}
\usage{
plot_numbers(se, plot = TRUE, features_type = "proteins")
}
\arguments{
\item{se}{SummarizedExperiment,
Data object for which to plot protein numbers
(output from \code{\link{make_se}()} or \code{\link{make_se_parse}()}).}

\item{plot}{Logical(1),
If \code{TRUE} (default) the barplot is produced.
Otherwise (if \code{FALSE}), the data which the
barplot is based on are returned.}

\item{features_type}{Character(1), the type of features used in title, like 'proteins', 'genes',
'peptides', default is 'features'}
}
\value{
Barplot of the number of identified proteins per sample
(generated by \code{\link[ggplot2]{ggplot}})
}
\description{
\code{plot_numbers} generates a barplot
of the number of identified proteins per sample.
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

plot_numbers(filt)
}
