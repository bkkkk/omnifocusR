context("test-parse-task-node")

mock_task <- function() {
  read_xml('<?xml version="1.0" encoding="UTF-8"?>
           <omnifocus app-id="com.omnigroup.OmniFocus3" app-version="120.11.0.323402" machine-model="MacBookPro14,1" os-name="Mac OS X" os-version="10.14" xmlns="http://www.omnigroup.com/namespace/OmniFocus/v2">
<task id="kWht8GKY4h8">
		       <project/>
           <inbox>false</inbox>
           <task idref="gg0bK99uSq5"/>
           <added>2018-10-18T01:37:13.089Z</added>
           <name>Look into creating re-ocurring sub tasks on JIRA</name>
           <note/>
           <rank>0</rank>
           <context idref="osOs7sKsHJ5"/>
           <start/>
           <due/>
           <completed>2018-10-29T08:54:18.906Z</completed>
           <estimated-minutes/>
           <order>sequential</order>
           <flagged>false</flagged>
           <completed-by-children>false</completed-by-children>
           <repetition-rule/>
           <repetition-method/>
           <next-clone-identifier>0</next-clone-identifier>
           <due-date-alarm-policy/>
           <defer-date-alarm-policy/>
           <latest-time-to-start-alarm-policy/>
           <modified>2018-10-29T08:54:18.917Z</modified>
           </task>
           </omnifocus>')
}

test_that("Task parsing with no extra fields", {
  sample <- mock_task()
  
  result <- parse_task_node(xml_find_first(sample, 'd1:task'), xml_ns(sample))
  
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
