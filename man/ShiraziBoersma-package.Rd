\name{ShiraziBoersma-package}
\alias{ShiraziBoersma-package}
\alias{ShiraziBoersma}
\docType{package}
\title{
\packageTitle{ShiraziBoersma}
}
\description{
\packageDescription{ShiraziBoersma}
}
\details{

The DESCRIPTION file:
\packageDESCRIPTION{ShiraziBoersma}
\packageIndices{ShiraziBoersma}
~~ An overview of how to use the package, including the most important functions ~~
}
\author{
\packageAuthor{ShiraziBoersma}

Maintainer: \packageMaintainer{ShiraziBoersma}
}
\references{
~~ Literature or other references for background information ~~
}
~~ Optionally other standard keywords, one per line, from file KEYWORDS in the R documentation directory ~~
\keyword{ package }
\seealso{
~~ Optional links to other man pages, e.g. ~~
~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
}
\examples{
##calculate new value for 
res=shb_calc(psa = c(20,20,60),lim = c(0.002,0.05,2),plt = T,seg_dat = F)
sbTT_usda(add=F,cols="black",size=1)
points(log10(res[1]),res[2], pch=16, col="red")
}
