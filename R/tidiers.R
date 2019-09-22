#' Tidy project data retrieved from OmniFocus database file
#'
#' @param .data the data frame constructed by parse_projects
#'
#' @return data frame containing project information in tidy format
#'
#' @importFrom dplyr select mutate_at mutate funs vars
#' @importFrom lubridate ymd_hms
#' @importFrom rlang .data
tidy_projects <- function(.data) {
  .data <- select(
    .data,
    project_id, name, status,
    added, completed, folder_id,
    context_id, start, flagged, due
  )
  .data <- mutate_at(
    .data,
    vars(due, start, added, completed),
    list(ymd_hms)
  )
  .data <- mutate(
    .data,
    status = as.factor(ifelse(is.na(.data$status), "active", .data$status)),
    flagged = is_flagged(.data$flagged)
  )
  .data
}

#' Tidy task data retrieved from OmniFocus database file
#'
#' @param .data the data frame constructed by parse_tasks
#'
#' @return data frame containing task information in tidy format
#'
#' @importFrom dplyr mutate_at mutate select funs vars one_of
#' @importFrom lubridate ymd_hms
#' @importFrom rlang .data
tidy_tasks <- function(.data) {
  .data <- mutate_at(
    .data,
    vars(one_of("added", "start", "completed", "due")),
    list(ymd_hms)
  )
  .data <- mutate(
    .data,
    flagged = is_flagged(.data$flagged)
  )
  select(
    .data,
    task_id, name, context_id,
    project_id, added,
    due, completed, start,
    flagged
  )
}

#' Converts the xml formatting of flagged data into an R logical object
#'
#' @param x a string
#'
#' @return logical that define if a task/project was flagged
#' 
#' @importFrom dplyr if_else
is_flagged <- function(x) {
  if_else(is.na(x), FALSE, as.logical(x))
}
