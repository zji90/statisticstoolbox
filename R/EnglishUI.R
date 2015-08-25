#' EnglishUI
#' 
#' Launch the Statistics Toolbox (English Version) Graphical User Interface
#'
#' This function will automatically launch the Statistics Toolbox user interface in a web browser. 
#' The user interface can also be accessed by https://statool.shinyapps.io/English. Neither R nor any packages are required in this online version.
#' However, it is highly recommended that the user interface be launched locally.
#' 
#' @export
#' @author Zhicheng Ji <zji4@@zji4.edu>
#' @examples
#' if(interactive()) {
#'    EnglishUI()
#' }

EnglishUI <- function() {
      shiny::runApp(system.file("shiny_en",package="statisticstoolbox"))
}

