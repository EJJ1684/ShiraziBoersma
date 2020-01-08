\name{shb_calc}
\alias{shb_calc}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
shb_calc(psa, lim, plt, seg_dat)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{psa}{
%%     ~~Describe \code{psa} here~~
}
  \item{lim}{
%%     ~~Describe \code{lim} here~~
}
  \item{plt}{
%%     ~~Describe \code{plt} here~~
}
  \item{seg_dat}{
%%     ~~Describe \code{seg_dat} here~~
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
function (psa, lim, plt, seg_dat) 
{
    s0 = 5e-05
    sizes = c(s0, lim)
    p_3 = 0.9999
    p_0 = 1e-04
    probs = c(p_0, cumsum(psa[-length(psa)])/100, p_3)
    probs[which(probs < p_0)] = p_0
    probs[which(probs > p_3)] = p_3
    d_lognorm = function(x) {
        exp(-(log10(x) - a)^2/(2 * b^2))/(b * sqrt(2 * pi))
    }
    integrand0 = function(x) {
        exp(-(x - a)^2/(2 * b^2))/(b * sqrt(2 * pi))
    }
    integrand1 = function(x) {
        exp(-(x - a)^2/(2 * b^2))/(b * sqrt(2 * pi)) * x
    }
    integrand2 = function(x) {
        exp(-(x - a)^2/(2 * b^2))/(b * sqrt(2 * pi)) * x^2
    }
    m0 = c()
    m1 = c()
    m2 = c()
    if (plt) {
        plot(NA, xlim = c(log10(sizes[1]), log10(10)), ylim = c(0, 
            12), yaxs = "i", xaxs = "i", ylab = "Theoretical lognormal prob.", 
            xlab = "Grain size (mm)", xaxt = "n")
        axis(1, at = -5:1, labels = c("0.00001", "0.0001", "0.001", 
            "0.01", "0.1", "1.0", "10.0"))
        abline(v = log10(sizes[2:(length(sizes))]), lty = 2, 
            col = "grey")
    }
    if (seg_dat) {
        cat("\nSegment d_g\tSeg. sigma_g")
    }
    for (i in 1:length(psa)) {
        x1 = log10(sizes[i])
        Y1 = qnorm(probs[i])
        x2 = log10(sizes[i + 1])
        Y2 = qnorm(probs[i + 1])
        b = (x2 - x1)/(Y2 - Y1)
        a = -Y1 * b + x1
        if (!is.nan(a) & !is.infinite(a)) {
            if (seg_dat) {
                cat("\n", 10^a, "\t", 10^b, "\n")
            }
            if (plt) {
                vals = seq(log10(sizes[i]), log10(sizes[i + 1]), 
                  length.out = 1000)
                nums = seq(log10(sizes[1]), log10(100), length.out = 1000)
                lines(nums, d_lognorm(10^nums) * 10, lty = 2)
                lines(vals, d_lognorm(10^vals) * 10, lwd = 2)
            }
            m0 = c(m0, integrate(integrand0, lower = log10(sizes[i]), 
                upper = log10(sizes[i + 1]))$value)
            m1 = c(m1, integrate(integrand1, lower = log10(sizes[i]), 
                upper = log10(sizes[i + 1]))$value)
            m2 = c(m2, integrate(integrand2, lower = log10(sizes[i]), 
                upper = log10(sizes[i + 1]))$value)
        }
        else {
            if (seg_dat) {
                cat("\n", 0, "\t", 0)
            }
        }
    }
    area = sum(m0)
    a = sum(m1)/area
    b = sqrt(sum(m2)/area - a^2)
    d_g = 10^a
    sigma_g = 10^b
    return(data.frame(d_g = d_g, sigma_g = sigma_g))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
