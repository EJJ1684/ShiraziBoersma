# ShiraziBoersma
This package can:  
 * calculate geometric mean diameter and standard deviation from particle size analaysis based on Shirazi et al. (1988).  
 * plot Shirazi and Boersma (1984) style texture triangles.

## Demo
devtools::install_github("EJJ1684/ShiraziBoersma",auth_token="3fc46050a3aaada187cb2ddd550b1f0f272561b8")  

require(ShiraziBoersma)  
sbTT_usda(add=F,cols="red",size=1)  
sbTT_aus(add=T,cols="black",size=1)  
sbTT_iuss(add=T,cols="blue",size=1)  

res=shb_calc(psa = c(20,20,60), lim = c(0.002,0.05,2), plt = T, seg_dat = F)  
sbTT_usda(add=F,cols="black",size=1)  
points(log10(res[1]),res[2], pch=16, col="red")  
