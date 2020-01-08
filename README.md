## ShiraziBoersmaTT

devtools::install_github("EJJ1684/ShiraziBoersma",auth_token="c279eb9ff17480d2671d4e8761944faaeb314f56")

# Demo

require(ShiraziBoersma)\n
sbTT_usda(add=F,cols="red",size=1)\n
sbTT_aus(add=T,cols="black",size=1)\n
sbTT_iuss(add=T,cols="blue",size=1)\n

res=shb_calc(psa = c(20,20,60), lim = c(0.002,0.05,2), plt = T, seg_dat = F)\n
sbTT_usda(add=F,cols="black",size=1)\n
points(log10(res[1]),res[2], pch=16, col="red")\n
