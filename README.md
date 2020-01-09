# ShiraziBoersma
This package can:  
 * calculate geometric mean diameter and standard deviation from particle size analaysis based on Shirazi et al. (1988).  
 * plot Shirazi and Boersma (1984) style texture triangles for USDA, IUSS and Australian classification systems based on vertices provided in the soiltexture package, as seen in Stockmann et al. (2018).

## Demo
devtools::install_github("EJJ1684/ShiraziBoersma",auth_token="3fc46050a3aaada187cb2ddd550b1f0f272561b8")  

require(ShiraziBoersma)  

sbTT_usda()  

sbTT_au2(cols="red")  
sbTT_iuss(add=T,cols="blue")  

res=shb_calc(psa = c(20,30,50), sys = "usda", plt_par = T, dat_par = F)  
sbTT_usda(add=F,cols="black",size=1)  
points(log10(res[1]),res[2], pch=16, col="red")  
