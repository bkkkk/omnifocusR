context("test-filter-tasks")

test_that("Filtering for projects works", {
  result <- filter_projects(test_document_for_filters)
  expect_length(result, 1)
  expect_equal(xml_attr(result, 'id'), 'gg0bK99uSq5')
})

test_that("Filtering for tasks works", {
  result <- filter_tasks(test_document_for_filters)
  expect_length(result, 1)
  expect_equal(xml_attr(result, 'id'), 'kWht8GKY4h8')
})

test_that("Filtering fopr context works", {
  result <- filter_contexts(test_document_for_filters)
  expect_length(result, 1)
  expect_equal(xml_attr(result, 'id'), 'nIr8xE7NZof')
})

test_that("Filtering for task-to-tag works", {
  result <- filter_task_to_tag(test_document_for_filters)
  expect_length(result, 1)
  expect_equal(xml_attr(result, 'id'), 'fhPlxmBdyCS.9.nFSbMtPEGrh')
})

