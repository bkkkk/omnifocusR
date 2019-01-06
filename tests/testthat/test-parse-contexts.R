context("test-parse-contexts")

test_that("Parsing multiple contexts works", {
  result <- parse_contexts(test_document_with_multiple_contexts)
  
  expected <- data_frame(context_id = c("nIr8xE7NZof", "lzWqVt0DKfG"), name = c("Waiting", "Home"))
  
  expect_length(result, 2)
  expect_equal(result, expected)
})
