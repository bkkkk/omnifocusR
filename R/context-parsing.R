#' Retrieve contexts from OmniFocus database file
#'
#' @param x an xml2 document built from the contents.xml
#'
#' @return data frame containing context name and internal ID
#'
#' @importFrom xml2 xml_ns xml_find_all xml_text
#' @importFrom tibble data_frame
parse_contexts <- function(x) {
  ns <- xml_ns(x)

  nodeset <- xml_find_all(x, "//d1:context", ns)
  name <- xml_text(xml_find_all(nodeset, "./d1:name", ns))
  id <- xml_text(xml_find_all(nodeset, "@id", ns))

  data_frame(context_id = id, context = name)
}