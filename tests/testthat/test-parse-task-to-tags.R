context("test-parse-task-to-tags")

test_that("Parsing multiple task to tags works", {
  result <- parse_task_to_tags(test_document_with_multiple_task_to_tag_nodes)
  
  expect_equal(nrow(result), 3)
  expect_equal(result$task_id, c("XKjx-azQ6Cq", "bJ9xiUfw3-t", "kx7HP9SGmGx"))
  expect_equal(result$context_id, c("osOs7sKsHJ5", "osOs7sKsHJ5", "nFSbMtPEGrh"))
})
