context("test-parse-tasks")

test_that("Task parsing with no extra fields", {
  result <- parse_tasks(test_document_tasks)

  expect_equal(nrow(result), 2)
  
  expect_equal(result$task_id, c("omKTQWuRmGj", "joUNfE5u-jV"))
  expect_equal(result$project_id, c("nHuzve_WGfT", "nHuzve_WGfT"))
  expect_equal(result$added, c("2015-11-15T16:28:08.631Z", "2015-11-15T16:28:08.631Z"))
  expect_equal(result$name, c("Live in a nourishing environment with people that build me up. Learn from others; constantly question yourself.", 
                              "Look at life, myself, and others in a positive and mindful way."))
  expect_equal(result$status, c(NA_character_, NA_character_))
  expect_equal(result$start, c('2018-03-14T04:32:41.923Z', '2018-11-01T00:43:48.502Z'))
  expect_equal(result$due, c('2018-03-14T04:32:41.923Z', '2018-11-01T00:43:48.502Z'))
  expect_equal(result$completed, c('2018-03-14T04:32:41.923Z', '2018-11-01T00:43:48.502Z'))
  expect_equal(result$context_id, c("nFSbMtPEGrh", "nFSbMtPEGrh"))
  expect_equal(result$flagged, c(NA_character_, 'true'))
})

test_that("Tidying tasks works", {
  test_document <- parse_tasks(test_document_tasks)
  result <- tidy_tasks(test_document)
  
  expect_equal(nrow(result), 2)
  expect_equal(result$task_id, c("omKTQWuRmGj", "joUNfE5u-jV"))
  expect_equal(result$project_id, c("nHuzve_WGfT", "nHuzve_WGfT"))
  expect_equal(result$added, ymd_hms(c("2015-11-15T16:28:08.631Z", "2015-11-15T16:28:08.631Z")))
  expect_equal(result$name, c("Live in a nourishing environment with people that build me up. Learn from others; constantly question yourself.", 
                              "Look at life, myself, and others in a positive and mindful way."))
  expect_equal(result$start, ymd_hms(c('2018-03-14T04:32:41.923Z', '2018-11-01T00:43:48.502Z')))
  expect_equal(result$due, ymd_hms(c('2018-03-14T04:32:41.923Z', '2018-11-01T00:43:48.502Z')))
  expect_equal(result$completed, ymd_hms(c('2018-03-14T04:32:41.923Z', '2018-11-01T00:43:48.502Z')))
  expect_equal(result$context_id, c("nFSbMtPEGrh", "nFSbMtPEGrh"))
  expect_equal(result$flagged, c(FALSE, TRUE))
})
