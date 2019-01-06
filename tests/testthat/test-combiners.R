context("test-combiners")

test_that("Adding project name to a single task works", {
  result <- add_project_name(test_tasks_dataframe, test_projects_dataframe)
  
  expect_equal(result, expected_with_project_dataframe)
})

test_that("Adding context name to a single task works", {
  result <- add_context_name(test_tasks_dataframe, test_contexts_dataframe)
  
  expect_equal(result, expected_with_context_dataframe)
})

