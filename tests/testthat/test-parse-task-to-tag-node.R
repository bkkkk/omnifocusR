context("test-parse-task-to-tag-node")

test_that("Task to tag parsing works", {
  ns <- xml_ns(test_document_task_to_tag)
  node <- xml_find_first(test_document_task_to_tag, "./d1:task-to-tag", ns)
  
  result <- parse_task_to_tag_node(node, ns)
  
  expect_length(result, 3)
  expect_equal(result$task_id, "XKjx-azQ6Cq")
  expect_equal(result$tag_id, "osOs7sKsHJ5")
  expect_equal(result$rank, "d06b")
})
