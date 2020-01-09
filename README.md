# ShiraziBoersma
This package can:  
 * calculate geometric mean diameter and standard deviation from particle size analaysis based on Shirazi et al. (1988).  
 * plot Shirazi and Boersma (1984) style texture triangles for USDA, IUSS and Australian classification systems based on vertices provided in the soiltexture package, as seen in Stockmann et al. (2018).  
  
Shirazi MA, Boersma L (1984) A unifying quantitative analysis of soil texture. Soil Sci Soc Am J 48:142–147.  
Shirazi MA, Boersma L, Hart JW (1988) A unifying quantitative analysis of soil texture: improvement of precision and extension of scale. Soil Sci Soc Am J 52:181–190.  
Stockmann U, Jones EJ, Odeh IOA, McBratney AB (2018) Pedometric Treatment of Soil Attributes. In: McBratney A, Minasny B, Stockmann U (eds) Pedometrics. Progress in Soil Science. Springer, Cham.  
                         
## Demo
devtools::install_github("edwardjjones/ShiraziBoersma")  

require(ShiraziBoersma)  

sbTT_usda()  

sbTT_au2(cols="red")  
sbTT_iuss(add=T,cols="blue")  

res=sbh_calc(psa = c(20,30,50), sys = "usda", plt_par = T, dat_par = F)  
sbTT_usda(add=F,cols="black",size=1)  
points(log10(res[1]),res[2], pch=16, col="red")  
