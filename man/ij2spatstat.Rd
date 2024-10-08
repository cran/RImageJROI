% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ij2spatstat.R
\name{ij2spatstat}
\alias{ij2spatstat}
\title{Convert 'ijroi' and 'ijzip' objects to spatstat spatial patterns}
\usage{
ij2spatstat(
  X,
  window = NULL,
  pattern.type = NULL,
  unitname = NULL,
  scale = 1,
  return.type = FALSE,
  convert.only = NULL
)
}
\arguments{
\item{X}{\code{\link[=read.ijroi]{ijroi}} or \code{\link[=read.ijzip]{ijzip}} object to be converted.}

\item{window}{the \link[spatstat.geom:owin]{window} for returned spatial patterns. Can be an \code{\link[spatstat.geom]{owin}} object defining a common window for all returned patterns, a character string \code{'range'} leading to a common window based \code{\link{range}} of all returned patterns, or \code{NULL} (default) leading to separate windows for each pattern.}

\item{pattern.type}{a character string specifying the desired pattern type to be returned (\code{\link[spatstat.geom]{ppp}}, \code{\link[spatstat.geom]{psp}} or \code{\link[spatstat.geom]{owin}}). Works only if \code{X} is an \code{\link[=read.ijroi]{ijroi}} object. Ignored otherwise. Defaults to an appropriate pattern type depending on the ROI type (see 'Details').}

\item{unitname}{Name of the unit of length for the resulting window(s) (see \code{\link[spatstat.geom]{owin}}).}

\item{scale}{A numeric value defining the scale of photograph in pixels / \code{unitname}. Defaults to 1.}

\item{return.type}{should the type of ROI object(s) be returned in addition to spatstat.geom spatial patterns? Defaults to \code{FALSE}.}

\item{convert.only}{a character vector specifying the \code{strType} of ROI objects to be converted (see \code{\link{plot.ijroi}} for possible pattern types). Pattern types not mentioned will not be converted. Works only if \code{X} is an \code{\link[=read.ijzip]{ijzip}} object. Ignored otherwise.}
}
\value{
Returns a list of \link[spatstat.geom]{spatstat.geom} patterns of approperiate type (see 'Details'). If \code{return.type = TRUE} returns a list with two levels specifying the spatstat.geom pattern and the ROI type.
}
\description{
Converts \code{\link[=read.ijroi]{ijroi}} and \code{\link[=read.ijzip]{ijzip}} objects to a list of \link[spatstat.geom]{spatstat.geom} spatial patterns.
}
\details{
The function converts \code{\link[=read.ijroi]{ijroi}} and \code{\link[=read.ijzip]{ijzip}} objects to \link[spatstat.geom]{spatstat.geom} spatial patterns for further calculations with the objects. By default, areal types ("rect", "oval", "ELLIPSE", "polygon") are converted to \code{\link[spatstat.geom]{owin}} objects. Line types ("line" (including "ARROW"), "freeline", "polyline", "angle", "freehand" (excluding "ELLIPSE")) are converted to \code{\link[spatstat.geom]{psp}} objects and "point" types to \code{\link[spatstat.geom]{ppp}} objects.
}
\examples{
file <- file.path(system.file(package = "RImageJROI"), "extdata", "ijroi", "ijzip.zip")
x <- read.ijzip(file)
ij2spatstat(x)
}
\seealso{
\code{\link{read.ijroi}} \code{\link{read.ijzip}}
}
\author{
Mikko Vihtakari
}
