\name{shb_calc}
\alias{shb_calc}
\title{
Calculate mean geometric diameter and standard deviation
}
\description{
Calculate mean geometric diameter and standard deviation
}
\usage{
shb_calc(psa, sys, plt, seg_dat)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{psa}{
    Numeric vector - mass percentages of clay, silt and sand. E.g. c(20,30,50).
}
  \item{sys}{
    Character string - classification system used. Options: "au2", "iuss", "usda".  
}
  \item{plt_par}{
    Single boolean - should the parent distributions be plotted?
}
  \item{dat_par}{
    Single boolean - should the mean geometric diameter and standard 
    deviation of the parent distributions be returned?
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
  res=shb_calc(psa = c(20,30,50), sys = "usda", plt_par = T, dat_par = F)
  sbTT_usda(add=F,cols="black",size=1)
  points(log10(res[1]),res[2], pch=16, col="red")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
