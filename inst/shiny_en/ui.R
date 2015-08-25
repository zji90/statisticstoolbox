######################################################
##                  Statistics Toolbox              ##
##             Interactive User Interface           ##
##                       UI File                    ##
##                 Author:Zhicheng Ji               ##
##       Maintainer:Zhicheng Ji (zji4@jhu.edu)      ##
######################################################

shinyUI(      
      fluidPage(
            
            headerPanel('Statistics Toolbox'),
            #_headerPanel('统计工具箱'),
            
            sidebarPanel(helpText(a("Statistics Toolbox Home Page",href="http://www.biostat.jhsph.edu/~zji4/#Statisticstoolbox",target="_blank")),
                         #_sidebarPanel(helpText(a("统计工具箱主页",href="http://www.biostat.jhsph.edu/~zji4/#Statisticstoolbox",target="_blank")),
                         wellPanel(
                               radioButtons("Mainmenu","Main Menu",list("Common Distributions"="Distribution","Statistical Tests"="Test","Sample Size Calculation"="Samplesize"))
                               #_radioButtons("Mainmenu","主菜单",list("常用分布"="Distribution","统计检验"="Test","样本量计算"="Samplesize"))
                         ),
                         wellPanel(
                               conditionalPanel(condition="input.Mainmenu=='Distribution'",
                                                radioButtons("Distributionselect","Choose Distribution",list("Binomial Distribution"="binom","Poisson Distribution"="pois","Normal Distribution"="norm","Student's t Distribution"="t","F Distribution"="F"))
                                                #_radioButtons("Distributionselect","选择分布",list("二项分布"="binom","泊松分布"="pois","正态分布"="norm","t分布"="t","F分布"="F"))
                               ),                        
                               conditionalPanel(condition="input.Mainmenu=='Test'",
                                                radioButtons("Testselect","Choose Test",list("z-test"="z","t-test"="t","Proportional Test"="prop","Fisher Exact Test"="fisher","Chi-square Test"="chi"))
                                                #_radioButtons("Testselect","选择检验",list("z检验"="z","t检验"="t","比例检验"="prop","Fisher精确检验"="fisher","卡方检验"="chi"))
                               ),
                               conditionalPanel(condition="input.Mainmenu=='Samplesize'",
                                                radioButtons("Samplesizeselect","Choose Test Type",list("Student's t test"="t","Proportional Test"="prop"))
                                                #_radioButtons("Samplesizeselect","选择检验类型",list("t检验"="t","比例检验"="prop"))
                               )
                         )
                         ,width=3),
            
            mainPanel(
                  conditionalPanel(condition="input.Mainmenu=='Distribution'",
                                   conditionalPanel(condition="input.Distributionselect=='binom'",
                                                    h4("Binomial Distribution"),
                                                    #_h4("二项分布"),
                                                    br(),
                                                    tabsetPanel(
                                                          tabPanel("Plot",            
                                                          #_tabPanel("图形",            
                                                                   br(),
                                                                   radioButtons("DistributionbinomPlottype","Type",list("PDF"="PDF","CDF"="CDF")),
                                                                   #_radioButtons("DistributionbinomPlottype","类型",list("概率密度函数"="PDF","累积分布函数"="CDF")),
                                                                   textInput("DistributionbinomPlotn","Number of Trials","10"),
                                                                  #_textInput("DistributionbinomPlotn","试验次数","10"),
                                                                   textInput("DistributionbinomPlotp","Probability of Success","0.5"),
                                                                  #_textInput("DistributionbinomPlotp","成功概率","0.5"),
                                                                   br(),
                                                                   plotOutput("DistributionbinomPlot",width = "500px",height = "400px")
                                                                   
                                                          ),
                                                          tabPanel("Calculation",
                                                            #_tabPanel("计算",
                                                                   br(),
                                                                   radioButtons("DistributionbinomCalctype","Type",list("PDF"="PDF","CDF"="CDF","Quantile"="Quantile")),
                                                            #_radioButtons("DistributionbinomCalctype","类型",list("概率密度函数"="PDF","累积分布函数"="CDF","分位数"="Quantile")),
                                                                   textInput("DistributionbinomCalcX","X","0"),
                                                            #_textInput("DistributionbinomCalcX","自变量","0"),
                                                                   textInput("DistributionbinomCalcn","Number of Trials","10"),
                                                            #_textInput("DistributionbinomCalcn","试验次数","10"),
                                                                   textInput("DistributionbinomCalcp","Probability of Success","0.5"),
                                                            #_textInput("DistributionbinomCalcp","成功概率","0.5"),
                                                                   br(),
                                                                   h4("Answer:"),
                                                            #_h4("结果:"),
                                                                   textOutput("DistributionbinomCalcanswer")
                                                          )                                                          
                                                          ,id="Distributionbinomtabset")                                              
                                   ),
                                   conditionalPanel(condition="input.Distributionselect=='pois'",
                                                    h4("Poisson Distribution"),
                                                    #_h4("泊松分布"),
                                                    br(),
                                                    tabsetPanel(
                                                          tabPanel("Plot",
                                                            #_tabPanel("图形",
                                                                   br(),
                                                                   radioButtons("DistributionpoisPlottype","Type",list("PDF"="PDF","CDF"="CDF")),
                                                            #_radioButtons("DistributionpoisPlottype","类型",list("概率密度函数"="PDF","累积分布函数"="CDF")),
                                                                   textInput("DistributionpoisPlotmean","Mean","5"),     
                                                            #_textInput("DistributionpoisPlotmean","均值","5"),     
                                                                   br(),
                                                                   plotOutput("DistributionpoisPlot",width = "500px",height = "400px")
                                                                   
                                                          ),
                                                          tabPanel("Calculation",
                                                                   #_tabPanel("计算",
                                                                   br(),
                                                                   radioButtons("DistributionpoisCalctype","Type",list("PDF"="PDF","CDF"="CDF","Quantile"="Quantile")),
                                                                   #_radioButtons("DistributionpoisCalctype","类型",list("概率密度函数"="PDF","累积分布函数"="CDF","分位数"="Quantile")),
                                                                   textInput("DistributionpoisCalcX","X","0"),
                                                                   #_textInput("DistributionpoisCalcX","自变量","0"),
                                                                   textInput("DistributionpoisCalcmean","Mean","5"),                                                                   
                                                                   #_textInput("DistributionpoisCalcmean","均值","5"),                                                                   
                                                                   br(),
                                                                   h4("Answer:"),
                                                                   #_h4("结果:"),
                                                                   textOutput("DistributionpoisCalcanswer")
                                                          )                                                          
                                                          ,id="Distributionpoistabset")  
                                   ),
                                   conditionalPanel(condition="input.Distributionselect=='norm'",
                                                    h4("Normal Distribution"),
                                                    #_h4("正态分布"),
                                                    br(),
                                                    tabsetPanel(
                                                          tabPanel("Plot", 
                                                                   #_tabPanel("图形",
                                                                   br(),
                                                                   radioButtons("DistributionnormPlottype","Type",list("PDF"="PDF","CDF"="CDF")),
                                                                   #_radioButtons("DistributionnormPlottype","类型",list("概率密度函数"="PDF","累积分布函数"="CDF")),
                                                                   textInput("DistributionnormPlotmean","Mean","0"),
                                                                   #_textInput("DistributionnormPlotmean","均值","0"),
                                                                   textInput("DistributionnormPlotsd","Standard Deviation","1"),
                                                                   #_textInput("DistributionnormPlotsd","标准差","1"),
                                                                   br(),
                                                                   plotOutput("DistributionnormPlot",width = "500px",height = "400px")
                                                                   
                                                          ),
                                                          tabPanel("Calculation",
                                                                   #_tabPanel("计算",
                                                                   br(),
                                                                   radioButtons("DistributionnormCalctype","Type",list("PDF"="PDF","CDF"="CDF","Quantile"="Quantile")),
                                                                   #_radioButtons("DistributionnormCalctype","类型",list("概率密度函数"="PDF","累积分布函数"="CDF","分位数"="Quantile")),
                                                                   textInput("DistributionnormCalcX","X","0"),
                                                                   #_textInput("DistributionnormCalcX","自变量","0"),
                                                                   textInput("DistributionnormCalcmean","Mean","0"),                                                                   
                                                                   #_textInput("DistributionnormCalcmean","均值","0"),                                                                   
                                                                   textInput("DistributionnormCalcsd","Standard Deviation","1"),                                                                   
                                                                   #_textInput("DistributionnormCalcsd","标准差","1"),                                                                   
                                                                   br(),
                                                                   h4("Answer:"),
                                                                   #_h4("结果:"),
                                                                   textOutput("DistributionnormCalcanswer")
                                                          )                                                          
                                                          ,id="Distributionnormtabset")  
                                   ),
                                   conditionalPanel(condition="input.Distributionselect=='t'",
                                                    h4("Student's t Distribution"),
                                                    #_h4("t分布"),
                                                    br(),
                                                    tabsetPanel(
                                                          tabPanel("Plot",   
                                                            #_tabPanel("图形",
                                                                   br(),
                                                                   radioButtons("DistributiontPlottype","Type",list("PDF"="PDF","CDF"="CDF")),
                                                            #_radioButtons("DistributiontPlottype","类型",list("概率密度函数"="PDF","累积分布函数"="CDF")),
                                                                   textInput("DistributiontPlotdf","Degree of Freedom","1"),
                                                            #_textInput("DistributiontPlotdf","自由度","1"),
                                                                   textInput("DistributiontPlotncp","Non Centrality","0"),
                                                            #_textInput("DistributiontPlotncp","非中心度","0"),
                                                                   br(),
                                                                   plotOutput("DistributiontPlot",width = "500px",height = "400px")
                                                                   
                                                          ),
                                                          tabPanel("Calculation",
                                                                   #_tabPanel("计算",
                                                                   br(),
                                                                   radioButtons("DistributiontCalctype","Type",list("PDF"="PDF","CDF"="CDF","Quantile"="Quantile")),
                                                                   #_radioButtons("DistributiontCalctype","类型",list("概率密度函数"="PDF","累积分布函数"="CDF","分位数"="Quantile")),
                                                                   textInput("DistributiontCalcX","X","0"),
                                                                   #_textInput("DistributiontCalcX","自变量","0"),
                                                                   textInput("DistributiontCalcdf","Degree of Freedom","1"),         
                                                                   #_textInput("DistributiontCalcdf","自由度","1"),
                                                                   textInput("DistributiontCalcncp","Non Centrality","0"),  
                                                                   #_textInput("DistributiontCalcncp","非中心度","0"),
                                                                   br(),
                                                                   h4("Answer:"),
                                                                   #_h4("结果:"),
                                                                   textOutput("DistributiontCalcanswer")
                                                          )                                                          
                                                          ,id="Distributionttabset")  
                                   ),
                                   conditionalPanel(condition="input.Distributionselect=='F'",
                                                    h4("F Distribution"),
                                                    #_h4("F分布"),
                                                    br(),
                                                    tabsetPanel(
                                                          tabPanel("Plot",  
                                                                   #_tabPanel("图形",
                                                                   br(),
                                                                   radioButtons("DistributionFPlottype","Type",list("PDF"="PDF","CDF"="CDF")),
                                                                   #_radioButtons("DistributionFPlottype","类型",list("概率密度函数"="PDF","累积分布函数"="CDF")),
                                                                   textInput("DistributionFPlotdf1","Degree of Freedom 1","1"),
                                                                   #_textInput("DistributionFPlotdf1","自由度1","1"),
                                                                   textInput("DistributionFPlotdf2","Degree of Freedom 2","1"),
                                                                   #_textInput("DistributionFPlotdf2","自由度2","1"),
                                                                   br(),
                                                                   plotOutput("DistributionFPlot",width = "500px",height = "400px")
                                                                   
                                                          ),
                                                          tabPanel("Calculation",
                                                                   #_tabPanel("计算",
                                                                   br(),
                                                                   radioButtons("DistributionFCalctype","Type",list("PDF"="PDF","CDF"="CDF","Quantile"="Quantile")),
                                                                   #_radioButtons("DistributionFCalctype","类型",list("概率密度函数"="PDF","累积分布函数"="CDF","分位数"="Quantile")),
                                                                   textInput("DistributionFCalcX","X","0"),
                                                                   #_textInput("DistributionFCalcX","自变量","0"),
                                                                   textInput("DistributionFCalcdf1","Degree of Freedom 1","1"),
                                                                   #_textInput("DistributionFCalcdf1","自由度1","1"),
                                                                   textInput("DistributionFCalcdf2","Degree of Freedom 2","1"),
                                                                   #_textInput("DistributionFCalcdf2","自由度2","1"),
                                                                   br(),
                                                                   h4("Answer:"),
                                                                   #_h4("结果:"),
                                                                   textOutput("DistributionFCalcanswer")
                                                          )                                                          
                                                          ,id="DistributionFtabset")
                                   )
                                   
                  ),
                  conditionalPanel(condition="input.Mainmenu=='Test'",                                   
                                   conditionalPanel(condition="input.Testselect=='z'",
                                                    h4("z-test"),
                                                    br(),
                                                    fluidRow(
                                                          column(width = 4,
                                                                 radioButtons("Testzinput","Input Type",list("Raw Data"="Raw Data","Summary Statistics"="Summary Statistics"))
                                                          ),
                                                          column(width = 4,
                                                                 radioButtons("Testztesttype","Test Type",list("Two Sample"="Two Sample","One Sample"="One Sample"))
                                                          )
                                                    ),uiOutput("Testzui"),
                                                    radioButtons("Testzalt","Alternative",list("Two Sided"="Two Sided", "Less"="Less", "Greater"="Greater")),
                                                    actionButton("Testzbutton","Perform Test"),
                                                    br(),
                                                    h4("Answer:"),
                                                    br(),
                                                    textOutput("Testzanswer1"),
                                                    br(),
                                                    textOutput("Testzanswer2"),
                                                    br(),
                                                    textOutput("Testzanswer3")
                                   ),
                                   conditionalPanel(condition="input.Testselect=='t'",
                                                    h4("t-test"),
                                                    br(),
                                                    fluidRow(
                                                          column(width = 4,
                                                                 radioButtons("Testtinput","Input Type",list("Raw Data"="Raw Data","Summary Statistics"="Summary Statistics"))
                                                          ),
                                                          column(width = 4,
                                                                 radioButtons("Testttesttype","Test Type",list("Two Sample"="Two Sample","One Sample"="One Sample"))
                                                          )
                                                    ),
                                                    uiOutput("Testtui"),
                                                    radioButtons("Testtalt","Alternative",list("Two Sided"="Two Sided", "Less"="Less", "Greater"="Greater")),
                                                    actionButton("Testtbutton","Perform Test"),
                                                    br(),
                                                    h4("Answer:"),
                                                    br(),
                                                    textOutput("Testtanswer1"),
                                                    br(),
                                                    textOutput("Testtanswer2"),
                                                    br(),
                                                    textOutput("Testtanswer3")
                                   ),
                                   conditionalPanel(condition="input.Testselect=='prop'",
                                                    h4("Proportional test"),
                                                    br(),                          
                                                    radioButtons("Testproptesttype","Test Type",list("One Sample"="One Sample","Multiple Samples"="Multiple Samples")),
                                                    conditionalPanel(condition = "input.Testproptesttype=='Multiple Samples'",
                                                                     h5("Numbers should be separated using non-numeric characters (e.g. ;/_,)"),
                                                                     h5("Number of successes and failures should be the same.")
                                                    ),
                                                    textInput("Testpropsuccess","Number of Success"),
                                                    textInput("Testpropfailure","Number of Failure"),
                                                    conditionalPanel(condition = "input.Testproptesttype=='One Sample'",
                                                                     textInput("Testproptruep","True Probability")
                                                    ),
                                                    radioButtons("Testpropalt","Alternative",list("Two Sided"="two.sided", "Less"="less", "Greater"="greater")),
                                                    checkboxInput("Testpropcorrect","Apply continuity correction",value=TRUE),
                                                    actionButton("Testpropbutton","Perform Test"),
                                                    br(),
                                                    h4("Answer:"),
                                                    br(),
                                                    textOutput("Testpropanswer1"),
                                                    br(),
                                                    textOutput("Testpropanswer2"),
                                                    br(),
                                                    textOutput("Testpropanswer3")                                                    
                                   ),
                                   conditionalPanel(condition="input.Testselect=='fisher'",
                                                    h4("Fisher exact test"),
                                                    br(),
                                                    h5("Only integers are accepted in the 2 by 2 table"),
                                                    fluidRow(                                                          
                                                          column(width = 4,
                                                                 textInput("Testfishern11","")
                                                          ),
                                                          column(width = 4,
                                                                 textInput("Testfishern12","")
                                                          )
                                                    ),                                                    
                                                    fluidRow(                                                          
                                                          column(width = 4,
                                                                 textInput("Testfishern21","")
                                                          ),
                                                          column(width = 4,
                                                                 textInput("Testfishern22","")
                                                          )
                                                    ),
                                                    radioButtons("Testfisheralt","Alternative",list("Two Sided"="two.sided", "Less"="less", "Greater"="greater")),                                                    
                                                    actionButton("Testfisherbutton","Perform Test"),
                                                    br(),
                                                    h4("Answer:"),
                                                    br(),
                                                    textOutput("Testfisheranswer1"),
                                                    br(),
                                                    textOutput("Testfisheranswer2")
                                   ),
                                   conditionalPanel(condition="input.Testselect=='chi'",
                                                    h4("Chi-square test"),
                                                    br(),
                                                    h5("Enter the contingency table in the text box below"),                                                    
                                                    h5("Numbers should be separated using non-numeric characters (e.g. ;/_,)"),
                                                    h5("Each row should have same number of elements"),
                                                    h5("Example input:"),
                                                    h5("10,20"),
                                                    h5("30,25"),
                                                    br(),
                                                    tags$style(type="text/css", "textarea {width:100%}"),
                                                    tags$textarea(id = 'Testchiinput', placeholder = 'Input here', rows = 20, ""),                                                    
                                                    checkboxInput("Testchicorrect","Apply continuity correction",value=TRUE),
                                                    actionButton("Testchibutton","Perform Test"),
                                                    br(),
                                                    h4("Answer:"),
                                                    br(),
                                                    textOutput("Testchianswer1"),
                                                    br(),
                                                    textOutput("Testchianswer2"),
                                                    br(),
                                                    textOutput("Testchianswer3")
                                   )
                  ),
                  conditionalPanel(condition="input.Mainmenu=='Samplesize'",
                                   conditionalPanel(condition="input.Samplesizeselect=='t'",
                                                    h4("Student's t test"),
                                                    br(),
                                                    h5("Leave blank exactly one input field"),
                                                    textInput("Samplesizetn","Sample Size"),
                                                    textInput("Samplesizetdelta","Difference in Mean"),
                                                    textInput("Samplesizetsd","Standard Deviation"),
                                                    textInput("Samplesizetsiglevel","Significance Level"),
                                                    textInput("Samplesizetpower","Power"),
                                                    radioButtons("Samplesizettesttype","Test Type",list("Two Sample"="two.sample","One Sample"="one.sample","Paired"="paired")),
                                                    radioButtons("Samplesizetalt","Alternative",list("Two Sided"="two.sided","One Sided"="one.sided")),
                                                    actionButton("Samplesizetbutton","Perform Test"),
                                                    br(),
                                                    h4("Answer:"),
                                                    br(),
                                                    textOutput("Samplesizetanswer")
                                   ),
                                   conditionalPanel(condition="input.Samplesizeselect=='prop'",
                                                    h4("Proportional test"),
                                                    br(),
                                                    h5("Leave blank exactly one input field"),
                                                    textInput("Samplesizepropn","Number of Observations in Each Group"),
                                                    textInput("Samplesizepropp1","Probability in Group 1"),
                                                    textInput("Samplesizepropp2","Probability in Group 2"),
                                                    textInput("Samplesizepropsiglevel","Significance Level"),
                                                    textInput("Samplesizeproppower","Power"),                                                    
                                                    radioButtons("Samplesizepropalt","Alternative",list("Two Sided"="two.sided","One Sided"="one.sided")),
                                                    actionButton("Samplesizepropbutton","Perform Test"),
                                                    br(),
                                                    h4("Answer:"),
                                                    br(),
                                                    textOutput("Samplesizepropanswer")
                                   )
                                   
                                   
                  )
            )            
      )
)
