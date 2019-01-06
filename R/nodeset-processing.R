#' Retrieve projects from OmniFocus database file
#'
#' @param x the XML document in xml2 document format
#'
#' @return data frame containing project information
#' @export
#'
#' @importFrom xml2 xml_find_all xml_ns
#' @importFrom dplyr bind_rows
parse_items <- function(x, filter, parser) {
  nodes <- filter(x)
  
  bind_rows(lapply(nodes, parser, ns = xml_ns(x)))
}

#' Retrieve projects from OmniFocus database file
#'
#' @param x the XML document in xml2 document format
#'
#' @return data frame containing project information
#' @export
parse_projects <- function(x) {
  parse_items(x, filter_projects, parse_project_node)
}

#' Retrieve tasks from OmniFocus database file
#'
#' @param x the XML document in xml2 document format
#'
#' @return data frame in raw format containing task information
#' @export
parse_tasks <- function(x) {
  parse_items(x, filter_tasks, parse_task_node)
}

#' Retrieve contexts from OmniFocus database file
#'
#' @param x the XML document in xml2 document format
#'
#' @return data frame in raw format containing context information
#' @export
parse_contexts <- function(x) {
  parse_items(x, filter_contexts, parse_context_node)
}
