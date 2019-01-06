context("test-filter-tasks")

test_that("Filtering for projects works", {
  result <- filter_projects(mock_mixed_document)
  expect_length(result, 1)
  expect_equal(xml_attr(result, 'id'), 'gg0bK99uSq5')
})

test_that("Filtering for tasks works", {
  result <- filter_tasks(mock_mixed_document)
  expect_length(result, 1)
  expect_equal(xml_attr(result, 'id'), 'kWht8GKY4h8')
})

test_that("Filtering fopr context works", {
  result <- filter_contexts(mock_mixed_document)
  expect_length(result, 1)
  expect_equal(xml_attr(result, 'id'), 'nIr8xE7NZof')
})
