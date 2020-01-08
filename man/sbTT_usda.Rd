\name{sbTT_usda}
\alias{sbTT_usda}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
USDA texture triangle represented as mean geometric diameter and standard deviation
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
sbTT_usda(add = F, cols = "black", size = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{add}{
%%     ~~Describe \code{add} here~~
}
  \item{cols}{
%%     ~~Describe \code{cols} here~~
}
  \item{size}{
%%     ~~Describe \code{size} here~~
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
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (add = F, cols = "black", size = 1) 
{
    if (!add) {
        plot(NA, cex = 0, xlim = c(-4, 0), ylim = c(1, 13), ylab = "Geometric standard deviation", 
            xlab = "Geometric mean diameter (mm)", xaxt = "n", 
            xaxs = "i")
        axis(1, at = c(-4, -3, -2, -1, 0), labels = c("0.0001", 
            "0.001", "0.01", "0.1", "1.0"), lwd.ticks = 2)
        axis(1, at = log10(1:10) - 1, labels = F)
        axis(1, at = log10(1:10) - 2, labels = F)
        axis(1, at = log10(1:10) - 3, labels = F)
        axis(1, at = log10(1:10) - 4, labels = F)
    }
    for (i in 1:length(lines_out)) {
        lines(lines_out[[i]][, 1], lines_out[[i]][, 2], col = cols, 
            lwd = size)
    }
    vert_tab = TT.classes.tbl(class.sys = "USDA.TT", collapse = NULL)
    for (r in 1:nrow(vert_tab)) {
        ids = as.numeric(unlist(str_split(vert_tab[r, 3], ", ")))
        text(TT.polygon.centroids(x[ids], y[ids])[1], TT.polygon.centroids(x[ids], 
            y[ids])[2], vert_tab[r, 1], col = cols, cex = size)
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
