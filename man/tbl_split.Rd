% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tbl_split.R
\name{tbl_split}
\alias{tbl_split}
\alias{print.tbl_split}
\title{Split gtsummary Table}
\usage{
tbl_split(x, variables)

\method{print}{tbl_split}(x, ...)
}
\arguments{
\item{x}{gtsummary table}

\item{variables}{variables to split gtsummary table at}

\item{...}{not used}
}
\value{
tbl_split object
}
\description{
Split gtsummary Table
}
\section{Possible Changes}{

\itemize{
\item Function may be migrated to the gtsummary package
\item May update print method within R markdown to add a page break between tables
}
}

\examples{
library(gtsummary)

tbl <-
  tbl_summary(trial) \%>\%
  tbl_split(variables = c(marker, grade))

}
\seealso{
Other gtsummary-related functions: 
\code{\link{add_inline_forest_plot}()},
\code{\link{as_ggplot}()},
\code{\link{gts_add_p_footnotes}()},
\code{\link{gtsummary_butcher}()},
\code{\link{style_tbl_compact}()},
\code{\link{tbl_2way_summary}()},
\code{\link{theme_gtsummary_msk}()}
}
\concept{gtsummary-related functions}
