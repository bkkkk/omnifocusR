#' Retrieve tasks from OmniFocus database file
#'
#' @param x the XML document in xml2 document format
#'
#' @return data frame in raw format containing task information
#' @export
#'
#' @importFrom xml2 as_list xml_find_all xml_find_one xml_attr xml_attrs xml_contents xml_text xml_name
#' @importFrom dplyr bind_rows
parse_tasks <- function(x) {
  parse_task_node <- function(x) {
    task_id <- xml_attrs(x)
    context_id <- xml_attr(xml_find_one(x, "d1:context", ns), "idref")
    project_id <- xml_attr(xml_find_one(x, "d1:task", ns), "idref")
    node_content <- xml_contents(x)

    node_text <- xml_text(node_content)
    cols <- xml_name(node_content)

    temp <- data.frame(as.list(node_text), stringsAsFactors = FALSE)
    colnames(temp) <- cols
    temp$task_id <- task_id
    temp$context_id <- context_id
    temp$project_id <- project_id
    temp
  }

  ns <- xml_ns(x)

  task_nodes <- as_list(xml_find_all(x, "./d1:task[not(d1:project)]", ns))

  bind_rows(lapply(task_nodes, parse_task_node))
}


#' Tidy task data retrieved from OmniFocus database file
#'
#' @param .data the data frame constructed by parse_tasks
#'
#' @return data frame containing task information in tidy format
#' @export
#'
#' @importFrom dplyr mutate_each mutate select_ funs
#' @importFrom lubridate ymd_hms
tidy_tasks <- function(.data) {
  .data <- mutate_each(
    .data,
    funs(ymd_hms),
    one_of("added", "start", "modified", "completed", "due")
  )
  .data <- mutate(
    .data,
    flagged = ifelse(is.na(as.logical(flagged)), FALSE, TRUE)
  )
  select_(
    .data,
    "task_id", "name", "context_id",
    "project_id", "added", "modified",
    "due", "completed", "start",
    "flagged"
  )
}
