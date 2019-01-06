context("test-parse-project-node")

test_that("Project parsing with no extra fields", {
  result <- parse_project_node(xml_find_first(test_document_with_simple_project, 'd1:task'), xml_ns(test_document_with_simple_project))
  
  expect_length(result, 10)

  expect_equal(result$project_id, 'py39KH8utgc')
  expect_equal(result$folder_id, 'j-oFhs5nHjX')
  expect_equal(result$added, '2015-11-15T15:00:20.641Z')
  expect_equal(result$name, 'Skills to Learn SM')
  expect_equal(result$status, 'active')
  expect_true(is.na(result$start))
  expect_true(is.na(result$due))
  expect_true(is.na(result$completed))
  expect_equal(result$context_id, 'nSo5IErWg3X')
  expect_true(is.na(result$flagged))
})


test_that("Project parsing with no extra fields", {
  result <- parse_project_node(xml_find_first(test_document_with_completed_due_defered_project, 'd1:task'), xml_ns(test_document_with_completed_due_defered_project))
  
  expect_length(result, 10)
  expect_equal(result$project_id, 'OepwndhgNNE')
  expect_equal(result$folder_id, 'aWCtbrgg6in')
  expect_equal(result$added, '2018-10-16T06:23:06.000Z')
  expect_equal(result$name, 'Have shared Opening Balance codebase with KPMG')
  expect_equal(result$status, 'done')
  expect_equal(result$start, '2018-11-05T23:00:00.000Z')
  expect_equal(result$due, '2018-11-05T23:00:00.000Z')
  expect_equal(result$completed, '2018-10-25T22:46:31.030Z')
  expect_true(is.na(result$context_id))
  expect_equal(result$flagged, 'true')
})
