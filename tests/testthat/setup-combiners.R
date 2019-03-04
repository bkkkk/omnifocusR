library(tidyr)
library(dplyr)
library(xml2)
library(tibble)

test_projects_dataframe <- tibble(
  project_id = c("pro_1", "pro_2"),
  name = c("my project", "my other project")
)

test_tasks_dataframe <- tibble(
  task_id = c("task_1", "task_2"),
  project_id = c("pro_1", "pro_2"),
  context_id = list(tibble(context_id = c("con_1")), tibble(context_id = c("con_1", "con_2"))),
  name = c("my project", "my other project")
)

test_contexts_dataframe <- tibble(
  context_id = c("con_1", "con_2"),
  name = c("Waiting", "Read")
)

expected_with_project_dataframe <- tibble(
  task_id = c("task_1", "task_2"),
  name = c("my project", "my other project"),
  context_id = list(tibble(context_id = c("con_1")), tibble(context_id = c("con_1", "con_2"))),
  project_name = c("my project", "my other project")
)

expected_with_context_dataframe <- tibble(
  task_id = c("task_1", "task_2"),
  name = c("my project", "my other project"),
  project_id = c("pro_1", "pro_2"),
  tags = list(
    tibble(
      context_id = c("con_1"),
      context_name = c("Waiting")
    ),
    tibble(
      context_id = c("con_1", "con_2"),
      context_name = c("Waiting", "Read")
    )
  )
)
  