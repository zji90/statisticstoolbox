######################################################
##                  Statistics Toolbox              ##
##             Interactive User Interface           ##
##                     Server File                  ##
##                 Author:Zhicheng Ji               ##
##       Maintainer:Zhicheng Ji (zji4@jhu.edu)      ##
######################################################

library(ggplot2)
library(shiny)
library(DT)

shinyServer(function(input, output,session) {
      
      ##### Distributions #####
      
      # Binomial Distribution
      
      output$DistributionbinomPlot <- renderPlot({
            xrange <- 0:as.numeric(input$DistributionbinomPlotn)            
            if (input$DistributionbinomPlottype=="PDF") {
                  plotdata <- data.frame(x=xrange,y=dbinom(xrange,as.numeric(input$DistributionbinomPlotn),as.numeric(input$DistributionbinomPlotp)))
            } else if (input$DistributionbinomPlottype=="CDF") {
                  plotdata <- data.frame(x=xrange,y=pbinom(xrange,as.numeric(input$DistributionbinomPlotn),as.numeric(input$DistributionbinomPlotp)))
            }
            g <- ggplot(aes(x=x,y=y),data=plotdata) + geom_point() +
                  xlab("X") + ylab("Probability") +
                  theme(axis.line = element_line(colour = "black"),
                        panel.grid.major = element_blank(),
                        panel.grid.minor = element_blank(),
                        panel.border = element_blank(),
                        panel.background = element_blank(),
                        axis.text.x = element_text(size=17,color="black"),
                        axis.text.y = element_text(size=17,color='black'),
                        axis.title.x = element_text(size=20,vjust=-1),
                        axis.title.y = element_text(size=20,vjust=1)                        
                  )
            print(g)
      })
      
      output$DistributionbinomCalcanswer <- renderText({            
            if (input$DistributionbinomCalctype == "PDF") {
                  dbinom(as.numeric(input$DistributionbinomCalcX),as.numeric(input$DistributionbinomCalcn),as.numeric(input$DistributionbinomCalcp))
            } else if (input$DistributionbinomCalctype == "CDF") {
                  pbinom(as.numeric(input$DistributionbinomCalcX),as.numeric(input$DistributionbinomCalcn),as.numeric(input$DistributionbinomCalcp))
            } else if (input$DistributionbinomCalctype == "Quantile") {
                  qbinom(as.numeric(input$DistributionbinomCalcX),as.numeric(input$DistributionbinomCalcn),as.numeric(input$DistributionbinomCalcp))
            }
      })
      
      # Poisson Distribution
      
      output$DistributionpoisPlot <- renderPlot({
            xrange <- 0:(2*as.numeric(input$DistributionpoisPlotmean))            
            if (input$DistributionpoisPlottype=="PDF") {
                  plotdata <- data.frame(x=xrange,y=dpois(xrange,as.numeric(input$DistributionpoisPlotmean)))
            } else if (input$DistributionpoisPlottype=="CDF") {
                  plotdata <- data.frame(x=xrange,y=ppois(xrange,as.numeric(input$DistributionpoisPlotmean)))
            }
            g <- ggplot(aes(x=x,y=y),data=plotdata) + geom_point() +
                  xlab("X") + ylab("Probability") +
                  theme(axis.line = element_line(colour = "black"),
                        panel.grid.major = element_blank(),
                        panel.grid.minor = element_blank(),
                        panel.border = element_blank(),
                        panel.background = element_blank(),
                        axis.text.x = element_text(size=17,color="black"),
                        axis.text.y = element_text(size=17,color='black'),
                        axis.title.x = element_text(size=20,vjust=-1),
                        axis.title.y = element_text(size=20,vjust=1)                        
                  )
            print(g)
      })
      
      output$DistributionpoisCalcanswer <- renderText({                   
            if (input$DistributionpoisCalctype == "PDF") {
                  dpois(as.numeric(input$DistributionpoisCalcX),as.numeric(input$DistributionpoisCalcmean))                  
            } else if (input$DistributionpoisCalctype == "CDF") {
                  ppois(as.numeric(input$DistributionpoisCalcX),as.numeric(input$DistributionpoisCalcmean))
            } else if (input$DistributionpoisCalctype == "Quantile") {
                  qpois(as.numeric(input$DistributionpoisCalcX),as.numeric(input$DistributionpoisCalcmean))
            }
      })
      
      # Normal Distribution
      
      output$DistributionnormPlot <- renderPlot({
            xrange <- seq(as.numeric(input$DistributionnormPlotmean)-3*as.numeric(input$DistributionnormPlotsd),as.numeric(input$DistributionnormPlotmean)+3*as.numeric(input$DistributionnormPlotsd),length.out = 100)
            if (input$DistributionnormPlottype=="PDF") {
                  plotdata <- data.frame(x=xrange,y=dnorm(xrange,as.numeric(input$DistributionnormPlotmean),as.numeric(input$DistributionnormPlotsd)))
            } else if (input$DistributionnormPlottype=="CDF") {
                  plotdata <- data.frame(x=xrange,y=pnorm(xrange,as.numeric(input$DistributionnormPlotmean),as.numeric(input$DistributionnormPlotsd)))
            }
            g <- ggplot(aes(x=x,y=y),data=plotdata) + geom_line() +
                  xlab("X") + ylab("Probability") +
                  theme(axis.line = element_line(colour = "black"),
                        panel.grid.major = element_blank(),
                        panel.grid.minor = element_blank(),
                        panel.border = element_blank(),
                        panel.background = element_blank(),
                        axis.text.x = element_text(size=17,color="black"),
                        axis.text.y = element_text(size=17,color='black'),
                        axis.title.x = element_text(size=20,vjust=-1),
                        axis.title.y = element_text(size=20,vjust=1)                        
                  )
            print(g)
      })
      
      output$DistributionnormCalcanswer <- renderText({                   
            if (input$DistributionnormCalctype == "PDF") {
                  dnorm(as.numeric(input$DistributionnormCalcX),as.numeric(input$DistributionnormCalcmean),as.numeric(input$DistributionnormCalcsd))                  
            } else if (input$DistributionnormCalctype == "CDF") {
                  pnorm(as.numeric(input$DistributionnormCalcX),as.numeric(input$DistributionnormCalcmean),as.numeric(input$DistributionnormCalcsd))
            } else if (input$DistributionnormCalctype == "Quantile") {
                  qnorm(as.numeric(input$DistributionnormCalcX),as.numeric(input$DistributionnormCalcmean),as.numeric(input$DistributionnormCalcsd))
            }
      })
      
      # t Distribution
      
      output$DistributiontPlot <- renderPlot({
            if (as.numeric(input$DistributiontPlotncp) == 0) {
                  xrange <- seq(-4,4,length.out=100)
            } else if (as.numeric(input$DistributiontPlotncp) < 0) {
                  xrange <- seq(floor(as.numeric(input$DistributiontPlotncp))*4,1/abs(as.numeric(input$DistributiontPlotncp)),length.out = 100)
            } else {
                  xrange <- seq(-1/abs(as.numeric(input$DistributiontPlotncp)),ceiling(as.numeric(input$DistributiontPlotncp))*4,length.out = 100)
            }
            if (input$DistributiontPlottype=="PDF") {
                  plotdata <- data.frame(x=xrange,y=dt(xrange,as.numeric(input$DistributiontPlotdf),as.numeric(input$DistributiontPlotncp)))
            } else if (input$DistributiontPlottype=="CDF") {
                  plotdata <- data.frame(x=xrange,y=pt(xrange,as.numeric(input$DistributiontPlotdf),as.numeric(input$DistributiontPlotncp)))
            }
            g <- ggplot(aes(x=x,y=y),data=plotdata) + geom_line() +
                  xlab("X") + ylab("Probability") +
                  theme(axis.line = element_line(colour = "black"),
                        panel.grid.major = element_blank(),
                        panel.grid.minor = element_blank(),
                        panel.border = element_blank(),
                        panel.background = element_blank(),
                        axis.text.x = element_text(size=17,color="black"),
                        axis.text.y = element_text(size=17,color='black'),
                        axis.title.x = element_text(size=20,vjust=-1),
                        axis.title.y = element_text(size=20,vjust=1)                        
                  )
            print(g)
      })
      
      output$DistributiontCalcanswer <- renderText({                   
            if (input$DistributiontCalctype == "PDF") {
                  dt(as.numeric(input$DistributiontCalcX),as.numeric(input$DistributiontCalcdf),as.numeric(input$DistributiontCalcncp))                  
            } else if (input$DistributiontCalctype == "CDF") {
                  pt(as.numeric(input$DistributiontCalcX),as.numeric(input$DistributiontCalcdf),as.numeric(input$DistributiontCalcncp))
            } else if (input$DistributiontCalctype == "Quantile") {
                  qt(as.numeric(input$DistributiontCalcX),as.numeric(input$DistributiontCalcdf),as.numeric(input$DistributiontCalcncp))
            }
      })
      
      # F Distribution
      
      output$DistributionFPlot <- renderPlot({
            xrange <- seq(0.001,4,length.out = 100)
            if (input$DistributionFPlottype=="PDF") {
                  plotdata <- data.frame(x=xrange,y=df(xrange,as.numeric(input$DistributionFPlotdf1),as.numeric(input$DistributionFPlotdf2)))
            } else if (input$DistributionFPlottype=="CDF") {
                  plotdata <- data.frame(x=xrange,y=pf(xrange,as.numeric(input$DistributionFPlotdf1),as.numeric(input$DistributionFPlotdf2)))
            }
            g <- ggplot(aes(x=x,y=y),data=plotdata) + geom_line() +
                  xlab("X") + ylab("Probability") +
                  theme(axis.line = element_line(colour = "black"),
                        panel.grid.major = element_blank(),
                        panel.grid.minor = element_blank(),
                        panel.border = element_blank(),
                        panel.background = element_blank(),
                        axis.text.x = element_text(size=17,color="black"),
                        axis.text.y = element_text(size=17,color='black'),
                        axis.title.x = element_text(size=20,vjust=-1),
                        axis.title.y = element_text(size=20,vjust=1)                        
                  )
            print(g)
      })
      
      output$DistributionFCalcanswer <- renderText({                   
            if (input$DistributionFCalctype == "PDF") {
                  df(as.numeric(input$DistributionFCalcX),as.numeric(input$DistributionFCalcdf1),as.numeric(input$DistributionFCalcdf2))                  
            } else if (input$DistributionFCalctype == "CDF") {
                  pf(as.numeric(input$DistributionFCalcX),as.numeric(input$DistributionFCalcdf1),as.numeric(input$DistributionFCalcdf2))
            } else if (input$DistributionFCalctype == "Quantile") {
                  qf(as.numeric(input$DistributionFCalcX),as.numeric(input$DistributionFCalcdf1),as.numeric(input$DistributionFCalcdf2))
            }
      })
      
      ##### Tests #####
      
      # z-test
      
      output$Testzui <- renderUI({
            if (input$Testzinput == "Raw Data") {                  
                  if (input$Testztesttype == "Two Sample") {
                        tagList(h4("Numbers should be separated using non-numeric characters (e.g. ;/_,)"),
                                textInput("Testzrawdata1","Sample 1 Raw Data"),
                                textInput("Testzrawdata2","Sample 2 Raw Data"),
                                textInput("Testztruedif","True Difference","0"))                        
                  } else {
                        tagList(h5("Numbers should be separated using non-numeric characters (e.g. ;/_,)"),
                                textInput("Testzrawdata","Raw Data"),
                                textInput("Testztruemean","True Mean","0"))                        
                  }                  
            } else {
                  if (input$Testztesttype == "Two Sample") {
                        tagList(
                              fluidRow(
                                    column(width = 4,
                                           textInput("Testzmean1","Sample 1 Mean")
                                    ),
                                    column(width = 4,
                                           textInput("Testzmean2","Sample 2 Mean")
                                    )
                              ),
                              fluidRow(
                                    column(width = 4,
                                           textInput("Testzvar1","Sample 1 Variance")
                                    ),
                                    column(width = 4,
                                           textInput("Testzvar2","Sample 2 Variance")
                                    )
                              ),
                              fluidRow(
                                    column(width = 4,
                                           textInput("Testzn1","Sample 1 Sample Size")
                                    ),
                                    column(width = 4,
                                           textInput("Testzn2","Sample 2 Sample Size")
                                    )
                              ),
                              fluidRow(
                                    column(width = 4,
                                           textInput("Testztruedif","True Difference","0")
                                    )
                              )
                        )
                  } else {
                        tagList(
                              textInput("Testzmean","Sample Mean"),
                              textInput("Testzvar","Sample Variance"),
                              textInput("Testzn","Sample Size"),
                              textInput("Testztruemean","True Mean","0")
                        )
                  }      
            }            
      })
      
      observe({
            if (input$Testzbutton > 0) {
                  isolate({
                        if (input$Testzinput == "Raw Data") {
                              if (input$Testztesttype == "Two Sample") {
                                    data1 <- as.numeric(strsplit(input$Testzrawdata1,"[^0-9]")[[1]])
                                    data2 <- as.numeric(strsplit(input$Testzrawdata2,"[^0-9]")[[1]])
                                    stat <- (mean(data1) - mean(data2) - as.numeric(input$Testztruedif))/sqrt(var(data1)/length(data1)+var(data2)/length(data2))                  
                              } else {
                                    data <- as.numeric(strsplit(input$Testzrawdata,"[^0-9]")[[1]])
                                    stat <- (mean(data) - as.numeric(input$Testztruemean))/sqrt(var(data))*length(data)
                              }          
                        } else {
                              if (input$Testztesttype == "Two Sample") {
                                    stat <- (as.numeric(input$Testzmean1) - as.numeric(input$Testzmean2) - as.numeric(input$Testztruedif))/sqrt(as.numeric(input$Testzvar1)/as.numeric(input$Testzn1)+as.numeric(input$Testzvar2)/as.numeric(input$Testzn2))                  
                              } else {
                                    stat <- (as.numeric(input$Testzmean) - as.numeric(input$Testztruemean))/sqrt(as.numeric(input$Testzvar))*as.numeric(input$Testzn)
                              }       
                        }
                        pval <- pnorm(stat,0,1)
                        if (input$Testzalt == "Two Sided") {
                              if (pval < 0.5) {
                                    pval <- pval * 2
                              } else {
                                    pval <- (1-pval) * 2
                              }
                        } else if (input$Testzalt == "Greater") {
                              pval <- 1 - pval
                        }
                        output$Testzanswer1 <- renderText(paste("z-statistic: ",stat))
                        output$Testzanswer2 <- renderText(paste("p-value: ",pval))
                        if (pval < 0.05) {
                              output$Testzanswer3 <- renderText("H0 is rejected. Tend to accept H1")
                        } else {
                              output$Testzanswer3 <- renderText("H0 is not rejected.")
                        }
                  })
            }            
      })
      
      # t-test
      
      output$Testtui <- renderUI({
            if (input$Testtinput == "Raw Data") {         
                  if (input$Testttesttype == "Two Sample") {
                        tagList(h4("Numbers should be separated using non-numeric characters (e.g. ;/_,)"),
                                textInput("Testtrawdata1","Sample 1 Raw Data"),
                                textInput("Testtrawdata2","Sample 2 Raw Data"),                                
                                textInput("Testttruedif","True Difference","0"),
                                radioButtons("Testtvartype","Variance Type",list("Equal Variance"="Equal Variance","Unequal Variance"="Unequal Variance"))
                        )
                  } else {
                        tagList(h5("Numbers should be separated using non-numeric characters (e.g. ;/_,)"),
                                textInput("Testtrawdata","Raw Data"),
                                textInput("Testttruemean","True Mean","0"))                        
                  }                  
            } else {
                  if (input$Testttesttype == "Two Sample") {
                        tagList(
                              fluidRow(
                                    column(width = 4,
                                           textInput("Testtmean1","Sample 1 Mean")
                                    ),
                                    column(width = 4,
                                           textInput("Testtmean2","Sample 2 Mean")
                                    )
                              ),
                              fluidRow(
                                    column(width = 4,
                                           textInput("Testtvar1","Sample 1 Variance")
                                    ),
                                    column(width = 4,
                                           textInput("Testtvar2","Sample 2 Variance")
                                    )
                              ),
                              fluidRow(
                                    column(width = 4,
                                           textInput("Testtn1","Sample 1 Sample Size")
                                    ),
                                    column(width = 4,
                                           textInput("Testtn2","Sample 2 Sample Size")
                                    )
                              ),
                              fluidRow(
                                    column(width = 4,
                                           textInput("Testttruedif","True Difference","0")
                                    )
                              ),
                              radioButtons("Testtvartype","",list("Equal Variance"="Equal Variance","Unequal Variance"="Unequal Variance"))
                        )
                  } else {
                        tagList(
                              textInput("Testtmean","Sample Mean"),
                              textInput("Testtvar","Sample Variance"),
                              textInput("Testtn","Sample Size"),
                              textInput("Testttruemean","True Mean","0")
                        )
                  }      
            }            
      })
      
      observe({
            if (input$Testtbutton > 0) {
                  isolate({                        
                        if (input$Testttesttype == "Two Sample") {
                              if (input$Testtinput == "Raw Data") {
                                    data1 <- as.numeric(strsplit(input$Testtrawdata1,"[^0-9]")[[1]])
                                    data2 <- as.numeric(strsplit(input$Testtrawdata2,"[^0-9]")[[1]])
                                    n1 <- length(data1)
                                    n2 <- length(data2)
                                    var1 <- var(data1)
                                    var2 <- var(data2)
                                    mean1 <- mean(data1)
                                    mean2 <- mean(data2)
                              } else {
                                    n1 <- as.numeric(input$Testtn1)
                                    n2 <- as.numeric(input$Testtn2)
                                    var1 <- as.numeric(input$Testtvar1)
                                    var2 <- as.numeric(input$Testtvar2)
                                    mean1 <- as.numeric(input$Testtmean1)
                                    mean2 <- as.numeric(input$Testtmean2)
                              }
                              if (input$Testtvartype == "Equal Variance") {                                          
                                    sp <- ((n1-1)*var1 + (n2-1)*var2)/(n1+n2-2)
                                    stat <- (mean1-mean2-as.numeric(input$Testttruedif))/sqrt(sp*(1/n1+1/n2))
                                    pval <- pt(stat, n1+n2-2)                                        
                              } else {
                                    tmp1 <- var1/n1
                                    tmp2 <- var2/n2
                                    stat <- (mean1-mean2-as.numeric(input$Testttruedif))/sqrt(tmp1+tmp2)
                                    pval <- pt(stat,(tmp1+tmp2)*(tmp1+tmp2)/(tmp1*tmp1/(n1-1)+tmp2*tmp2/(n2-1)))
                              }
                        } else {
                              if (input$Testtinput == "Raw Data") {
                                    data <- as.numeric(strsplit(input$Testtrawdata,"[^0-9]")[[1]])                         
                                    mean <- mean(data)
                                    var <- var(data)
                                    n <- length(data)
                              } else {
                                    mean <- as.numeric(input$Testtmean)
                                    var <- as.numeric(input$Testtvar)
                                    n <- as.numeric(input$Testtn)                                    
                              }
                              stat <- (mean-as.numeric(input$Testttruemean))/sqrt(var)*sqrt(n)
                              pval <- pt(stat, n-1)                              
                        }                                  
                        if (input$Testtalt == "Two Sided") {
                              if (pval < 0.5) {
                                    pval <- pval * 2
                              } else {
                                    pval <- (1-pval) * 2
                              }
                        } else if (input$Testtalt == "Greater") {
                              pval <- 1 - pval
                        }
                        output$Testtanswer1 <- renderText(paste("t-statistic: ",stat))
                        output$Testtanswer2 <- renderText(paste("p-value: ",pval))
                        if (pval < 0.05) {
                              output$Testtanswer3 <- renderText("H0 is rejected. Tend to accept H1")
                        } else {
                              output$Testtanswer3 <- renderText("H0 is not rejected.")
                        }
                  })
            }            
      })
      
      # Proportional Test
      observe({
            if (input$Testpropbutton > 0) {
                  isolate({
                        if (input$Testproptesttype=="One Sample") {
                              testres <- prop.test(cbind(as.numeric(input$Testpropsuccess),as.numeric(input$Testpropfailure)),p=as.numeric(input$Testproptruep),alternative=input$Testpropalt,correct=input$Testpropcorrect)                              
                              output$Testpropanswer1 <- renderText(paste("X-squared statistic: ",testres$statistic))
                              output$Testpropanswer2 <- renderText(paste("p-value: ",testres$p.value))                                    
                        } else {
                              success <- as.numeric(strsplit(input$Testpropsuccess,"[^0-9]")[[1]])
                              failure <- as.numeric(strsplit(input$Testpropfailure,"[^0-9]")[[1]])
                              testres <- prop.test(cbind(success,failure),alternative=input$Testpropalt,correct=input$Testpropcorrect)                              
                              output$Testpropanswer1 <- renderText(paste("Chi-squared statistic: ",testres$statistic))
                              output$Testpropanswer2 <- renderText(paste("p-value: ",testres$p.value))      
                        }
                        if (testres$p.value < 0.05) {
                              output$Testpropanswer3 <- renderText("H0 is rejected. Tend to accept H1")
                        } else {
                              output$Testpropanswer3 <- renderText("H0 is not rejected.")
                        }
                  })
            }            
      })
      
      # Fisher Exact Test
      observe({
            if (input$Testfisherbutton > 0) {
                  isolate({
                        testres <- fisher.test(matrix(c(as.numeric(input$Testfishern11),as.numeric(input$Testfishern12),as.numeric(input$Testfishern21),as.numeric(input$Testfishern22)),2,byrow = TRUE),alternative = input$Testfisheralt)                        
                        output$Testfisheranswer1 <- renderText(paste("p-value: ",testres$p.value))      
                        if (testres$p.value < 0.05) {
                              output$Testfisheranswer2 <- renderText("H0 is rejected. Tend to accept H1")
                        } else {
                              output$Testfisheranswer2 <- renderText("H0 is not rejected.")
                        }
                  })
            }            
      })
      
      # Chi-square Test
      observe({
            if (input$Testchibutton > 0) {
                  isolate({                        
                        textinput <- strsplit(input$Testchiinput,"\n")[[1]]
                        textinput <- textinput[nchar(textinput) > 0]
                        datainput <- t(sapply(textinput,function(i) as.numeric(strsplit(i,"[^0-9]")[[1]])))
                        testres <- chisq.test(datainput,correct = input$Testchicorrect)   
                        output$Testchianswer1 <- renderText(paste("Chi-squared statistic: ",testres$statistic))
                        output$Testchianswer2 <- renderText(paste("p-value: ",testres$p.value))      
                        if (testres$p.value < 0.05) {
                              output$Testchianswer3 <- renderText("H0 is rejected. Tend to accept H1")
                        } else {
                              output$Testchianswer3 <- renderText("H0 is not rejected.")
                        }
                  })
            }            
      })
      
      ##### Sample Size Calculation #####
      
      # Student's t test
      
      observe({
            if (input$Samplesizetbutton > 0) {
                  isolate({
                        if (nchar(input$Samplesizetn) == 0) {
                              text <- paste("Sample Size:",power.t.test(n=NULL,delta=as.numeric(input$Samplesizetdelta),sd=as.numeric(input$Samplesizetsd),sig.level=as.numeric(input$Samplesizetsiglevel),power=as.numeric(input$Samplesizetpower),type=input$Samplesizettesttype,alternative=input$Samplesizetalt)$n)      
                        } else if (nchar(input$Samplesizetdelta) == 0) {
                              text <- paste("Difference in Mean:",power.t.test(n=as.numeric(input$Samplesizetn),delta=NULL,sd=as.numeric(input$Samplesizetsd),sig.level=as.numeric(input$Samplesizetsiglevel),power=as.numeric(input$Samplesizetpower),type=input$Samplesizettesttype,alternative=input$Samplesizetalt)$delta)      
                        } else if (nchar(input$Samplesizetsd) == 0) {
                              text <- paste("Standard Deviation:",power.t.test(n=as.numeric(input$Samplesizetn),delta=as.numeric(input$Samplesizetdelta),sd=NULL,sig.level=as.numeric(input$Samplesizetsiglevel),power=as.numeric(input$Samplesizetpower),type=input$Samplesizettesttype,alternative=input$Samplesizetalt)$sd)      
                        } else if (nchar(input$Samplesizetsiglevel) == 0) {
                              text <- paste("Significance Level:",power.t.test(n=as.numeric(input$Samplesizetn),delta=as.numeric(input$Samplesizetdelta),sd=as.numeric(input$Samplesizetsd),sig.level=NULL,power=as.numeric(input$Samplesizetpower),type=input$Samplesizettesttype,alternative=input$Samplesizetalt)$sig.level)      
                        } else if (nchar(input$Samplesizetpower) == 0) {
                              text <- paste("Power:",power.t.test(n=as.numeric(input$Samplesizetn),delta=as.numeric(input$Samplesizetdelta),sd=as.numeric(input$Samplesizetsd),sig.level=as.numeric(input$Samplesizetsiglevel),power=NULL,type=input$Samplesizettesttype,alternative=input$Samplesizetalt)$power)      
                        }    
                        output$Samplesizetanswer <- renderText(text)
                  })
            }
      })
      
      # Proportional test
      
      observe({
            if (input$Samplesizepropbutton > 0) {
                  isolate({
                        if (nchar(input$Samplesizepropn) == 0) {
                              text <- paste("Number of Observations:",power.prop.test(n=NULL,p1=as.numeric(input$Samplesizepropp1),p2=as.numeric(input$Samplesizepropp2),sig.level=as.numeric(input$Samplesizepropsiglevel),power=as.numeric(input$Samplesizeproppower),alternative=input$Samplesizepropalt)$n)      
                        } else if (nchar(input$Samplesizepropp1) == 0) {
                              text <- paste("Probability in Group 1:",power.prop.test(n=as.numeric(input$Samplesizepropn),p1=NULL,p2=as.numeric(input$Samplesizepropp2),sig.level=as.numeric(input$Samplesizepropsiglevel),power=as.numeric(input$Samplesizeproppower),alternative=input$Samplesizepropalt)$p1)      
                        } else if (nchar(input$Samplesizepropp2) == 0) {
                              text <- paste("Probability in Group 2:",power.prop.test(n=as.numeric(input$Samplesizepropn),p1=as.numeric(input$Samplesizepropp1),p2=NULL,sig.level=as.numeric(input$Samplesizepropsiglevel),power=as.numeric(input$Samplesizeproppower),alternative=input$Samplesizepropalt)$p2)      
                        } else if (nchar(input$Samplesizepropsiglevel) == 0) {
                              text <- paste("Significance Level:",power.prop.test(n=as.numeric(input$Samplesizepropn),p1=as.numeric(input$Samplesizepropp1),p2=as.numeric(input$Samplesizepropp2),sig.level=NULL,power=as.numeric(input$Samplesizeproppower),alternative=input$Samplesizepropalt)$sig.level)      
                        } else if (nchar(input$Samplesizeproppower) == 0) {
                              text <- paste("Power:",power.prop.test(n=as.numeric(input$Samplesizepropn),p1=as.numeric(input$Samplesizepropp1),p2=as.numeric(input$Samplesizepropp2),sig.level=as.numeric(input$Samplesizepropsiglevel),power=NULL,alternative=input$Samplesizepropalt)$power)      
                        }    
                        output$Samplesizepropanswer <- renderText(text)
                  })
            }
      })
      
            
         
      
})
