% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_function_result.R
\name{plot_statistics}
\alias{plot_statistics}
\title{Plot the distribution of statistic valuse. develop from statistics_plot}
\usage{
plot_statistics(
  object,
  statistic = c("diff", "t.stastic", "p.val", "p.adj"),
  contrasts = NULL
)
}
\arguments{
\item{object}{A SummarizedExperiment or DEGdata obejct from \code{\link{test_diff}} / \code{\link{test_diff_deg}}
or \code{add_rejections}}

\item{statistic}{Character, in c("diff","t","p.val","p.adj")}

\item{contrasts}{Characters or NULL, plot contrasts. If NULL, plot all tested contrasts in objest.}
}
\value{
The distribution histogram of statistics
}
\description{
Plot the distribution of statistic valuse. develop from statistics_plot
}
\examples{
# Load example
data(Silicosis_pg)
data <- Silicosis_pg
data_unique <- make_unique(data, "Gene.names", "Protein.IDs", delim = ";")

# Differential test
ecols <- grep("LFQ.", colnames(data_unique))
se <- make_se_parse(data_unique, ecols,mode = "delim")
filt <- filter_se(se, thr = 0, fraction = 0.4, filter_formula = ~ Reverse != "+" & Potential.contaminant!="+")
norm <- normalize_vsn(filt)
imputed <- impute(norm, fun = "MinProb", q = 0.05)
diff <- test_diff(imputed, type = "control", control  = c("PBS"), fdr.type = "Storey's qvalue")
dep <- add_rejections(diff, alpha = 0.01,lfc = 2)

# plot statistics distribution
plot_statistics(dep, statistic = "t.stastic")
plot_statistics(dep, statistic = "diff")

}
