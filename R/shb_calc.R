shb_calc <-
function(psa,sys="usda",plt_par=T,dat_par=F){
  if(sys%in%c("au2","iuss")){
   s0 = 0.00002
   lim = c(0.002,0.02,2)
  }else{
   s0 = 0.00005
   lim = c(0.002,0.05,2)
  }

  sizes=c(s0,lim)

  ###probabilties
  p_3 = 0.9999 ##probability of upper size limit
  p_0 = 0.0001 ##probability of lower size limit
  ##cummulative clay and silt
  probs=c(p_0,cumsum(psa[-length(psa)])/100,p_3)
  probs[which(probs<p_0)]=p_0 ##min probability= 0.0001
  probs[which(probs>p_3)]=p_3 ##max probability= 0.9999


  ###functions
  d_lognorm  = function(x) {exp(-(log10(x)-a)^2/(2*b^2))/(b*sqrt(2*pi))}
  integrand0 = function(x) {exp(-(x-a)^2/(2*b^2))/(b*sqrt(2*pi))}
  integrand1 = function(x) {exp(-(x-a)^2/(2*b^2))/(b*sqrt(2*pi))*x}
  integrand2 = function(x) {exp(-(x-a)^2/(2*b^2))/(b*sqrt(2*pi))*x^2}

  ##integrated moments
  m0=c()
  m1=c()
  m2=c()

  ##run it
  if(plt_par){
    plot(NA,xlim=c(log10(sizes[1]),log10(10)),ylim=c(0,12),yaxs="i",xaxs="i", ylab="Theoretical lognormal prob.", xlab="Grain size (mm)", xaxt="n")
    axis(1,at= -5:1, labels=c("0.00001","0.0001","0.001","0.01","0.1","1.0","10.0"))
    abline(v=log10(sizes[2:(length(sizes))]),lty=2, col="grey")
  }

  if(dat_par){cat("\nSegment d_g\tSeg. sigma_g")} ##d_g and sigma of segment
  for(i in 1:length(psa)){ #i=1
    ##Normal deviates
    x1 = log10(sizes[i])
    Y1 = qnorm(probs[i])
    x2 = log10(sizes[i+1])
    Y2 = qnorm(probs[i+1])

    ##calculate values
    b=(x2-x1)/(Y2-Y1)
    a=-Y1*b+x1

    if(!is.nan(a)&!is.infinite(a)){

      if(dat_par){cat("\n",10^a,"\t",10^b,"\n")} ##d_g and sigma of segment

      ##plot fitted distributions for each segment
      if(plt_par){
        vals=seq(log10(sizes[i]),log10(sizes[i+1]),length.out =1000)
        nums=seq(log10(sizes[1]),log10(100),length.out =1000)
        lines(nums,d_lognorm(10^nums)*10, lty=2) ##dodgy *10 constant, I cannot produce theier results without it
        lines(vals,d_lognorm(10^vals)*10, lwd=2) ##dodgy *10 constant, I cannot produce theier results without it
      }

      m0=c(m0,integrate(integrand0, lower = log10(sizes[i]), upper = log10(sizes[i+1]))$value)
      m1=c(m1,integrate(integrand1, lower = log10(sizes[i]), upper = log10(sizes[i+1]))$value)
      m2=c(m2,integrate(integrand2, lower = log10(sizes[i]), upper = log10(sizes[i+1]))$value)
    }else{
      if(seg_dat){cat("\n",0,"\t",0)} ##d_g and sigma of segment
    }
  }
  area=sum(m0)
  a=sum(m1)/area
  b=sqrt(sum(m2)/area-a^2)

  d_g=10^a
  sigma_g=10^b

  return(data.frame("d_g"=d_g,"sigma_g"=sigma_g))
}
