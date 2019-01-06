#' This function filters for all project-like tasks
#'
#' @param x input document
#'
#' @return nodeset of all projects
filter_projects <- function(x) {
  xml_find_all(x, "./d1:task[d1:project/node()]", xml_ns(x))
}

#' This function filters for all tasks
#'
#' @param x input document
#'
#' @return nodeset of all tasks
filter_tasks <- function(x) {
  xml_find_all(x, "./d1:task[not(d1:project/node())]", xml_ns(x))
}

#' This function filters for all context nodes
#'
#' @param x input document
#'
#' @return nodeset of all contexts
filter_contexts <- function(x) {
  xml_find_all(x, "./d1:context", xml_ns(x))
}
