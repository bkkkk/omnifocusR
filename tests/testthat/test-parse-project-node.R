context("test-parse-project-node")

mock_simple_project <- function() {
  read_xml('<?xml version="1.0" encoding="UTF-8"?>
<omnifocus app-id="com.omnigroup.OmniFocus3" app-version="120.11.0.323402" machine-model="MacBookPro14,1" os-name="Mac OS X" os-version="10.14" xmlns="http://www.omnigroup.com/namespace/OmniFocus/v2">
             <task id="py39KH8utgc">
             <project>
             <folder idref="j-oFhs5nHjX"/>
             <singleton>true</singleton>
             <last-review>2018-12-18T05:04:23.648Z</last-review>
             <review-interval>@1w</review-interval>
             <next-review/>
             <status>active</status>
             </project>
             <added>2015-11-15T15:00:20.641Z</added>
             <modified>2018-12-18T05:04:23.692Z</modified>
             <name>Skills to Learn SM</name>
             <rank>1263225674</rank>
             <context idref="nSo5IErWg3X"/>
             <order>parallel</order>
             <completed-by-children>false</completed-by-children>
             <inbox>false</inbox>
             <task/>
             </task>
             </omnifocus>')
}

mock_completed_project <- function() {
  read_xml('<?xml version="1.0" encoding="UTF-8"?>
           <omnifocus app-id="com.omnigroup.OmniFocus3" app-version="120.11.0.323402" machine-model="MacBookPro14,1" os-name="Mac OS X" os-version="10.14" xmlns="http://www.omnigroup.com/namespace/OmniFocus/v2">
           <task id="OepwndhgNNE">
           <project>
           <folder idref="aWCtbrgg6in"/>
           <singleton>false</singleton>
           <last-review>2018-10-23T03:14:45.875Z</last-review>
           <next-review/>
           <review-interval>@1w</review-interval>
           <status>done</status>
           </project>
           <inbox>false</inbox>
           <task/>
           <added>2018-10-16T06:23:06.000Z</added>
           <name>Have shared Opening Balance codebase with KPMG</name>
           <note/>
           <rank>-1431655766</rank>
           <context/>
           <start>2018-11-05T23:00:00.000Z</start>
           <due>2018-11-05T23:00:00.000Z</due>
           <completed>2018-10-25T22:46:31.030Z</completed>
           <estimated-minutes/>
           <order>sequential</order>
           <flagged>true</flagged>
           <completed-by-children>false</completed-by-children>
           <repetition-rule/>
           <repetition-method/>
           <next-clone-identifier>0</next-clone-identifier>
           <due-date-alarm-policy/>
           <defer-date-alarm-policy/>
           <latest-time-to-start-alarm-policy/>
           <modified>2018-10-25T22:46:32.144Z</modified>
           </task>
           </omnifocus>')
}

test_that("Project parsing with no extra fields", {
  sample <- mock_simple_project()

  result <- parse_project_node(xml_find_first(sample, 'd1:task'), xml_ns(sample))
  
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
  sample <- mock_completed_project()

  result <- parse_project_node(xml_find_first(sample, 'd1:task'), xml_ns(sample))
  
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
