% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_function_QC.R
\name{plot_detect}
\alias{plot_detect}
\title{Visualize intensities of proteins with missing values}
\usage{
plot_detect(se)
}
\arguments{
\item{se}{SummarizedExperiment,
Data object with missing values.}
}
\value{
Density and CumSum plots of intensities of
proteins with and without missing values
(generated by \code{\link[ggplot2]{ggplot}}).
}
\description{
\code{plot_detect} generates density and CumSum plots
of protein intensities with and without missing values
}
\examples{
# Load example
data(Silicosis_pg)
data <- Silicosis_pg
data_unique <- make_unique(data, "Gene.names", "Protein.IDs", delim = ";")

# Construct SE
ecols <- grep("LFQ.", colnames(data_unique))
se <- make_se_parse(data_unique, ecols,mode = "delim")

# Filter
filt <- filter_se(se, thr = 0, fraction = 0.4, filter_formula = ~ Reverse != "+" & Potential.contaminant!="+")

# Plot intensities of proteins with missing values
plot_detect(filt)
}
