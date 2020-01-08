sbTT_usda <-
function(add=F,cols="black",size=1){
  data("usda_lines")
  lines_out = usda_lines
  data("usda_x")
  x = usda_x
  data("usda_y")
  y = usda_y
  
  if(!add){plot(NA,cex=0.0, xlim=c(-4,0), ylim=c(1,13),ylab="Geometric standard deviation", xlab="Geometric mean diameter (mm)", xaxt="n",xaxs="i")
    axis(1,at=c(-4,-3,-2,-1,0), labels=c("0.0001","0.001","0.01","0.1","1.0"),lwd.ticks=2)
    axis(1,at=log10(1:10)-1, labels=F)
    axis(1,at=log10(1:10)-2, labels=F)
    axis(1,at=log10(1:10)-3, labels=F)
    axis(1,at=log10(1:10)-4, labels=F)
  }
  
  
  for(i in 1:length(lines_out)){
    lines(lines_out[[i]][,1],lines_out[[i]][,2], col=cols, lwd=size)
  }
  
  ###Ids at polygon centroid
  vert_tab=TT.classes.tbl(class.sys = "USDA.TT", collapse = NULL)
  for(r in 1:nrow(vert_tab)){
    ids=as.numeric(unlist(str_split(vert_tab[r,3],", ")))
    text(TT.polygon.centroids(x[ids], y[ids])[1],
         TT.polygon.centroids(x[ids], y[ids])[2],vert_tab[r,1], col=cols, cex=size)
  }
}
