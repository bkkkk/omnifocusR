context("test-parse-context-node")

test_that("Parsing a context node works", {
  ns <- xml_ns(test_document)
  result <- parse_context_node(xml_find_all(test_document, "./d1:context", ns), ns)
  
  expect_length(result, 2)
  expect_equal(result$id, 'nIr8xE7NZof')
  expect_equal(result$name, 'Waiting')
})
