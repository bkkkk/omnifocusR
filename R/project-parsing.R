#' Retrieve projects from OmniFocus database file
#'
#' @param x the XML document in xml2 document format
#'
#' @return data frame containing project information
#' @export
#'
#' @importFrom xml2 as_list xml_find_all xml_find_one xml_attr xml_attrs xml_contents xml_text xml_name
#' @importFrom dplyr bind_rows
parse_projects <- function(x) {
  parse_project_node <- function(node) {
    project_id <- xml_attrs(node)
    folder_id <- xml_attr(xml_find_one(node, "./d1:project/d1:folder", ns), "idref")
    context_id <- xml_attr(xml_find_one(node, "./d1:context", ns), "idref")
    status <- xml_text(xml_find_one(node, "./d1:project/d1:status", ns))
    node_content <- xml_contents(node)

    node_text <- xml_text(node_content)[-1]
    names(node_text) <- xml_name(node_content)[-1]

    temp <- data.frame(as.list(node_text), stringsAsFactors = F)
    temp$folder_id <- folder_id
    temp$status <- status
    temp$project_id <- project_id
    temp$context_id <- context_id
    temp
  }

  ns <- xml_ns(x)

  project_nodes <- as_list(xml_find_all(x, "/*/d1:task[d1:project]", ns))

  bind_rows(lapply(project_nodes, parse_project_node))
}


#' Tidy project data retrieved from OmniFocus database file
#'
#' @param .data the data frame constructed by parse_projects
#'
#' @return data frame containing project information in tidy format
#' @export
#'
#' @importFrom dplyr select_ mutate_each mutate funs
#' @importFrom lubridate ymd_hms
tidy_projects <- function(.data) {
  .data <- select_(
    .data,
    "project_id", "name", "status",
    "added", "completed", "folder_id",
    "order", "context_id", "note",
    "start", "flagged", "due"
  )
  .data <- mutate_each(
    .data,
    funs(ymd_hms),
    one_of("due", "start", "added", "completed")
  )
  .data <- mutate(
    .data,
    status = as.factor(ifelse(is.na(status), "active", status)),
    flagged = ifelse(is.na(as.logical(flagged)), FALSE, TRUE),
    order = as.factor(order)
  )
  .data
}
