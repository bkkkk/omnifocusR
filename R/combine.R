#' Add project names to tasks information
#'
#' @param tasks data frame with tidy tasks information
#' @param projects data frame with tidy project information
#'
#' @return data frame of tasks with project name added
#'
#' @importFrom dplyr select left_join
add_project_name <- function(tasks, projects) {
  tasks %>%
    left_join(
      select(projects, project_id, project_name = name),
      by = "project_id"
    ) %>%
    select(-project_id)
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
#'
#' @importFrom dplyr select left_join
#' @importFrom tidyr nest unnest
add_context_name <- function(tasks, contexts) {
  tasks %>%
    unnest(cols = c(context_id)) %>%
    left_join(
      select(contexts, context_id, context_name = name),
      by = "context_id"
    ) %>%
    nest(tags = c(context_id, context_name))
}
