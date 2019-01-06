#' Tidy project data retrieved from OmniFocus database file
#'
#' @param .data the data frame constructed by parse_projects
#'
#' @return data frame containing project information in tidy format
#' @export
#'
#' @importFrom dplyr select_ mutate_at mutate funs vars
#' @importFrom lubridate ymd_hms
#' @importFrom rlang .data
tidy_projects <- function(.data) {
  .data <- select_(
    .data,
    "project_id", "name", "status",
    "added", "completed", "folder_id",
    "context_id", "start", "flagged", "due"
  )
  .data <- mutate_at(
    .data,
    vars("due", "start", "added", "completed"),
    funs(ymd_hms)
  )
  .data <- mutate(
    .data,
    status = as.factor(ifelse(is.na(.data$status), "active", .data$status)),
    flagged = ifelse(is.na(as.logical(.data$flagged)), FALSE, TRUE)
  )
  .data
}

#' Tidy task data retrieved from OmniFocus database file
#'
#' @param .data the data frame constructed by parse_tasks
#'
#' @return data frame containing task information in tidy format
#' @export
#'
#' @importFrom dplyr mutate_at mutate select_ funs vars one_of
#' @importFrom lubridate ymd_hms
#' @importFrom rlang .data
tidy_tasks <- function(.data) {
  .data <- mutate_at(
    .data,
    vars(one_of("added", "start", "modified", "completed", "due")),
    funs(ymd_hms)
  )
  .data <- mutate(
    .data,
    flagged = ifelse(is.na(as.logical(.data$flagged)), FALSE, TRUE)
  )
  select_(
    .data,
    "task_id", "name", "context_id",
    "project_id", "added", "modified",
    "due", "completed", "start",
    "flagged"
  )
}
