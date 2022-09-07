#' @title Obtaining species of fishes by family/subfamily periodically
#' @description This function get genera/species of fishes by family/subfamily in real time.
#' @rdname species_family
#' @name species_family
#' @format The following data frame of the fields to be returned are recognized:
#' \itemize{
#' \item class : Class of fishes returned.
#' \item order : Order of fishes returned.
#' \item family : Family of fishes returned.
#' \item subfamily : Subfamily of fishes returned.
#' \item available_genera : The number of available genera.
#' \item valid_genera : The number of valid genera.
#' \item available_species : The number of available species.
#' \item valid_species : The number of valid species.
#' \item ...
#' }
#' @return Data frame.
#' @author Liuyong Ding \email{ly_ding@126.com}
#' @importFrom httr GET
#' @importFrom httr status_code
#' @importFrom magrittr `%>%`
#' @importFrom xml2 read_html
#' @importFrom xml2 xml_find_first
#' @importFrom rvest html_table
#' @importFrom tibble as_tibble
#' @importFrom utils browseURL
#' @importFrom janitor clean_names
#' @importFrom dplyr filter
#' @details See for website \url{https://researcharchive.calacademy.org/research/ichthyology/catalog/SpeciesByFamily.asp} details.
#' @references \url{https://github.com/curso-r/lives/blob/6e042cf5f0bae0d957ff487a39b6601ac6f514ea/drafts/20210915_webscraping_ichthyology.R}
#' @examples
#' \dontrun{
#' # Genera/Species of Fishes by Family/Subfamily through 2022:
#'
#' db <- species_family()
#'
#' # Each matching row by family
#'  
#' library(magrittr)
#' r <- search_cas(query = c("Anguilla nebulosa", "Clupisoma sinense"),type = "species")
#' r %>% dplyr::left_join(db[,1:4],by = "family")
#'
#' }
#' @export
#'

species_family <- function(){
  url <- "https://researcharchive.calacademy.org/research/ichthyology/catalog/SpeciesByFamily.asp"
  res <- httr::GET(url)
  if (httr::status_code(res) == 200){
    text <- res %>%
      xml2::read_html() %>%
      rvest::html_elements("p") %>%
      rvest::html_text()
    cat("****************************************\n")
    cat(paste0(gsub("Finally, our data","Eschmeyer's Catalog of Fishes online database",text[6]),"\n"))
    cat("****************************************\n")
    result = res %>%
      xml2::read_html() %>%
      xml2::xml_find_first("//*[@style='width:700px; border-collapse:collapse']") %>%
      rvest::html_table() %>%
      janitor::clean_names() %>%
      dplyr::filter(class != "Totals")
    return(tibble::as_tibble(result))
  }else{
    cat("Error request - the parameter query is not valid")
    browseURL(url)
  }
}
