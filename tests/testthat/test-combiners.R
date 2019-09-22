context("test-combiners")

test_that("Adding project name to a single task works", {
  result <- add_project_name(test_tasks_dataframe, test_projects_dataframe)
  
  expect_equal(unnest(result, cols = c(context_id)),
               unnest(expected_with_project_dataframe, cols = c(context_id)))
})

test_that("Adding context name to a single task works", {
  result <- add_context_name(test_tasks_dataframe, test_contexts_dataframe)

  expect_equal(unnest(result, cols = c(tags)), unnest(expected_with_context_dataframe, cols = c(tags)))
})

