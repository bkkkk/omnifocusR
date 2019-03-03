#' Add project names to tasks information
#'
#' @param tasks data frame with tidy tasks information
#' @param projects data frame with tidy project information
#'
#' @return data frame of tasks with project name added
#' @export
#'
#' @importFrom dplyr select_ left_join
add_project_name <- function(tasks, projects) {
  projects <- select_(projects, "project_id", project_name = "name")
  .data <- left_join(tasks, projects, by = "project_id")
  select_(.data, "-project_id")
}



#' Add context names to tasks information
#'
#' Task information is stored with an associated context ID
#' However for analysis context name is far more useful
#' This function takes context and task data frames and converts
#' context ID to context name.
#'
#' @param tasks data frame with tidy tasks information
#' @param contexts data frame with tidy context information
#'
#' @return data frame of task information with named context
#' @export
#'
#' @importFrom dplyr select_ left_join
#' @importFrom tidyr nest unnest
add_context_name <- function(tasks, contexts) {
  contexts <- select_(contexts, "context_id", context_name = "name")
  tasks <- unnest(tasks)
  .data <- left_join(tasks, contexts, by = "context_id")
  nest(.data, context_id, context_name, .key = "tags")
}
