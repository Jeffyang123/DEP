% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DEP_aggregation.R
\name{make_pe_parse}
\alias{make_pe_parse}
\title{Data.frame to QFeatures object conversion by parsing column names}
\usage{
make_pe_parse(
  Peptide,
  columns,
  fnames,
  mode = c("char", "delim"),
  chars = 1,
  sep = "_",
  remove_prefix = T,
  remove_suffix = F,
  assay_name = "peptideRaw",
  log2transform = T
)
}
\arguments{
\item{Peptide}{Data.frame,
Peptide table with its belonging proteingroup.}

\item{columns}{A numeric indicating the indices of the columns
to be used as expression values. Can also be a character indicating the names of the columns.}

\item{fnames}{An optional character(1) or numeric(1) indicating the column identifier.}

\item{mode}{"char" or "delim",
The mode of parsing the column headers.
"char" will parse the last number of characters as replicate number
and requires the 'chars' parameter.
"delim" will parse on the separator and requires the 'sep' parameter.}

\item{chars}{Numeric(1),
The number of characters to take at the end of the column headers
as replicate number (only for mode = "char").}

\item{sep}{Character(1),
The separator used to parse the column header
(only for mode = "delim").}

\item{remove_prefix}{Logical(1),
whether remove the prefix of expression columns.}

\item{remove_suffix}{Logical(1),
whether remove the suffix of expression columns.}

\item{assay_name}{An character(1) to name assay in the QFeatures object.}

\item{log2transform}{Logical(1), whether log2 transform the assay, default TRUE.}
}
\value{
An character(1) to name assay in the QFeatures object.
}
\description{
\code{make_pe_parse} creates a QFeatures object
based on a single data.frame. The experiment design is constructed
by colnames of expression assay.
}
\examples{
# Load a peptides
data(Silicosis_peptide)
ecols <- grep("Intensity.", colnames(Silicosis_peptide), value = TRUE)
# Construct a QFeatures object, with a 'peptideRaw' assay
pe_peptides <- make_pe_parse(Silicosis_peptide, columns = ecols,   # columns is the abundance columns
                             mode = "delim", sep = "_",
                             remove_prefix = TRUE, log2transform = TRUE)
pe_peptides
}
