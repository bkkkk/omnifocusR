#' Process an OmniFocus content XML file
#'
#' @param path full path to OmniFocus XML file
#'
#' @return data frame containing task information in tidy format
#' @export
#'
#' @importFrom xml2 read_xml
process_of_db <- function(path) {
  xml_doc <- read_xml(path)

  contexts_data <- parse_contexts(xml_doc)
  projects_data <- tidy_projects(parse_projects(xml_doc))
  tasks_data <- tidy_tasks(parse_tasks(xml_doc))

  result <- add_context_name(tasks_data, contexts_data)
  result <- add_project_name(result, projects_data)

  return(result)
}

