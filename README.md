Statistics Toolbox 统计工具箱
====

## Overview
Statistics Toolbox is a quick and convenient tool for users to perform common tasks in statistics without writing computer programs. Statistics Toolbox currently provides three major statistics functions: 1. drawing and calculating pdf and cdf functions of common statistics distributions; 2. Performing common statistical tests; 3. Calculating sample size and statistical power. Statistics Toolbox was developed using R and shiny package. Statistics Toolbox is free on all platforms. For other versions of Statistics Toolbox please visit the home page of Statistics Toolbox: http://www.biostat.jhsph.edu/~zji4/#Statisticstoolbox. Please visit the home page to make donations if you feel this software useful!

## 简介
统计工具箱是一款无需编程即可方便快捷实行多种统计方法的工具。统计工具箱目前提供三种主要统计功能：1. 常用统计分布概率密度函数和累积分布函数的作图及计算；2. 常用统计检验；3. 样本量及统计效力计算。统计工具箱使用R语言及shiny软件包进行开发。统计工具箱在所有平台上免费。如需获取其他版本的统计工具箱请访问统计工具箱主页：http://www.biostat.jhsph.edu/~zji4/#Statisticstoolbox. 如您感觉统计工具箱有用欢迎前往主页捐赠！

## Statistics Toolbox Online User Interface
Statistics Toolbox user interface can be directly launched online without installing any software package. The URL to English version is https://statool.shinyapps.io/English and the URL to Chinese version https://statool.shinyapps.io/Chinese. It is strongly recommended that users install Statistics Toolbox on their own computers with following procedures.

## 统计工具箱在线用户界面
统计工具箱在线用户界面无需按照任何软件即可直接运行。英文版网址为：https://statool.shinyapps.io/English; 中文版网址为：https://statool.shinyapps.io/Chinese. 强烈推荐用户使用以下方法在本地计算机安装并运行统计工具箱。

## Statistics Toolbox Installation

Users should first have R installed on their computer before installing Statistics Toolbox. R(https://www.r-project.org/) is the most widely used statistics software and is free. R for Windows can be downloaded here: https://cran.rstudio.com/bin/windows/base/R-3.2.2-win.exe. R for OSX can be downloaded here: https://cran.rstudio.com/bin/macosx/R-3.2.2.pkg.

To install the latest version of Statistics Toolbox package, run following commands in R:
```{r }
if (!require("devtools"))
  install.packages("devtools")
devtools::install_github("statisticstoolbox","zji90")
```
To launch English version user interface after installation, run following commands in R:
```{r }
library(statisticstoolbox)
EnglishUI()
```

To launch Chinese version user interface after installation, run following commands in R:
```{r }
library(statisticstoolbox)
ChineseUI()
```
##安装统计工具箱

安装统计工具箱前用户首先必须安装R统计软件。R (https://www.r-project.org/) 是最常用的统计软件并且是免费的。Windows版本的R可在下列网站下载：https://cran.rstudio.com/bin/windows/base/R-3.2.2-win.exe. 苹果OSX版本的R可在下列网站下载：https://cran.rstudio.com/bin/macosx/R-3.2.2.pkg.

在R中运行以下程序来安装最新版的统计工具箱：
```{r }
if (!require("devtools"))
  install.packages("devtools")
devtools::install_github("statisticstoolbox","zji90")
```

在R中运行以下程序来开始中文版统计工具箱用户界面：
```{r }
library(statisticstoolbox)
ChineseUI()
```

在R中运行以下程序来开始英文版统计工具箱用户界面：
```{r }
library(statisticstoolbox)
EnglishUI()
```

## Contact the Author
Author: Zhicheng Ji

Report bugs and provide suggestions by sending email to:

Maintainer: Zhicheng Ji (zji4@jhu.edu)

Or open a new issue in this Github page

## 联系作者
作者：季志成

请发送意见和建议至：

维护者：季志成 (zji4@jhu.edu)

或者在此Github页面上新开issue

## License
GPL(>=2)

## 许可
GPL(>=2)
