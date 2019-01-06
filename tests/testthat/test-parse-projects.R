context("test-parse-projects")

test_that("Binding projects data frame works", {
  result <- dplyr::arrange(parse_projects(test_document_with_multiple_projects), project_id)
  expect_identical(result, test_dataframe_with_multiple_projects)
})

test_that("Tidying projects works", {
  result <- tidy_projects(test_dataframe_with_multiple_projects)
  expect_identical(result, result_dataframe_with_multiple_projects)
})
