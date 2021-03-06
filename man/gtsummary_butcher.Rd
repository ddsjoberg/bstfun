% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gtsummary_butcher.R
\name{gtsummary_butcher}
\alias{gtsummary_butcher}
\title{Reduce size of gtsummary objects}
\usage{
gtsummary_butcher(x)
}
\arguments{
\item{x}{a gtsummary object}
}
\value{
a gtsummary object
}
\description{
Some gtsummary objects can become large and the size becomes cumbersome
when working with the object.
The function removes all elements from a gtsummary object, except those
required to print the table. This may result in gtsummary functions
that add information or modify the table, such as \code{add_global_p()},
will no longer execute
after the excess elements have been removed (aka butchered). Of note,
the majority of \code{inline_text()} calls will continue to execute
properly.
}
\examples{
library(gtsummary)

tbl_large <-
 trial \%>\%
 tbl_uvregression(
   y = age,
   method = lm
 )

 tbl_butchered <-
   tbl_large \%>\%
   gtsummary_butcher()

 # size comparison
 object.size(tbl_large) \%>\% format(units = "Mb")
 object.size(tbl_butchered) \%>\% format(units = "Mb")
}
\seealso{
Other gtsummary-related functions: 
\code{\link{add_inline_forest_plot}()},
\code{\link{as_ggplot}()},
\code{\link{gts_add_p_footnotes}()},
\code{\link{style_tbl_compact}()},
\code{\link{tbl_2way_summary}()},
\code{\link{tbl_split}()},
\code{\link{theme_gtsummary_msk}()}
}
\concept{gtsummary-related functions}
