context("test-parse-tasks")

test_that("Task parsing with no extra fields", {
  result <- parse_tasks(test_document_with_single_task)

  expect_length(result, 10)
  
  expect_equal(result$task_id, 'kWht8GKY4h8')
  expect_equal(result$project_id, 'gg0bK99uSq5')
  expect_equal(result$added, '2018-10-18T01:37:13.089Z')
  expect_equal(result$name, 'Look into creating re-ocurring sub tasks on JIRA')
  expect_true(is.na(result$status))
  expect_equal(result$start, '')
  expect_equal(result$due, '')
  expect_equal(result$completed, '2018-10-29T08:54:18.906Z')
  expect_equal(result$context_id, 'osOs7sKsHJ5')
  expect_equal(result$flagged, 'false')
})