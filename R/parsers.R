#' Parse a task node
#'
#' @param node the task node
#' @param ns xml namespace object
#'
#' @return list containing the data of a single task
#' 
#' @importFrom xml2 xml_find_first xml_attr xml_contents xml_text xml_name
parse_task_node <- function(node, ns) {
  list(
    task_id = xml_attr(node, "id"),
    name = xml_text(xml_find_first(node, "./d1:name", ns)),
    project_id = xml_attr(xml_find_first(node, "./d1:task", ns), "idref"),
    context_id = xml_attr(xml_find_first(node, "./d1:context", ns), "idref"),
    status = xml_text(xml_find_first(node, "./d1:project/d1:status", ns)),
    added = xml_text(xml_find_first(node, "./d1:added", ns)),
    completed = xml_text(xml_find_first(node, "./d1:completed", ns)),
    start = xml_text(xml_find_first(node, "./d1:start", ns)),
    due = xml_text(xml_find_first(node, "./d1:due", ns)),
    flagged = xml_text(xml_find_first(node, "./d1:flagged", ns))
  )
}

#' Parse the data from a single project node
#'
#' @param node the node for a single task
#' @param ns xml namespace object
#'
#' @return list containing the data of a single project
#' 
#' @importFrom xml2 xml_find_first xml_attr xml_contents xml_text xml_name
parse_project_node <- function(node, ns) {
  list(
    project_id = xml_attr(node, "id"),
    name = xml_text(xml_find_first(node, "./d1:name", ns)),
    folder_id = xml_attr(xml_find_first(node, "./d1:project/d1:folder", ns), "idref"),
    context_id = xml_attr(xml_find_first(node, "./d1:context", ns), "idref"),
    status = xml_text(xml_find_first(node, "./d1:project/d1:status", ns)),
    added = xml_text(xml_find_first(node, "./d1:added", ns)),
    completed = xml_text(xml_find_first(node, "./d1:completed", ns)),
    start = xml_text(xml_find_first(node, "./d1:start", ns)),
    due = xml_text(xml_find_first(node, "./d1:due", ns)),
    flagged = xml_text(xml_find_first(node, "./d1:flagged", ns))
  )
}

#' Parse the data from a single context node
#'
#' @param node the node for a single context
#' @param ns xml namespace object
#'
#' @return list containing the data of a single context
#' 
#' @importFrom xml2 xml_find_first xml_text
parse_context_node <- function(node, ns) {
  list(
    context_id = xml_text(xml_find_first(node, "@id", ns)),
    name = xml_text(xml_find_first(node, "./d1:name", ns))
  )
}

#' Parse the data from a single task-to-tag node
#'
#' @param node the node for a single task-to-tag
#' @param ns xml namespace object
#'
#' @return list containing the data of a single task-to-tag
#' 
#' @importFrom xml2 xml_find_first xml_text xml_attr
parse_task_to_tag_node <- function(node, ns) {
  list(
    task_id = xml_attr(xml_find_first(node, "d1:task", ns), "idref", ns),
    tag_id = xml_attr(xml_find_first(node, "d1:context", ns), "idref", ns),
    rank = xml_text(xml_find_first(node, "d1:rank-in-task", ns))
  )
}