context("test-filter-tasks")

mock_mixed_document <- function() {
  read_xml('<?xml version="1.0" encoding="UTF-8"?>
<omnifocus app-id="com.omnigroup.OmniFocus3" app-version="120.11.0.323402" machine-model="MacBookPro14,1" os-name="Mac OS X" os-version="10.14" xmlns="http://www.omnigroup.com/namespace/OmniFocus/v2">
<task id="gg0bK99uSq5">
		<project>
           <folder idref="fh4AfJuvkWq"/>
           <singleton>false</singleton>
           <last-review>2018-11-05T08:30:38.213Z</last-review>
           <next-review/>
           <review-interval>@1w</review-interval>
           <status>done</status>
           </project>
           <inbox>false</inbox>
           <task/>
           <added>2018-10-18T00:56:18.342Z</added>
           <name>Have built JIRA system for merchant on-boarding</name>
           <note/>
           <rank>0</rank>
           <context/>
           <start>2018-11-05T23:00:00.000Z</start>
           <due/>
           <completed>2018-11-09T09:15:14.937Z</completed>
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
           <modified>2018-11-09T09:15:15.077Z</modified>
           </task>
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
           <context id="nIr8xE7NZof">
		       <added order="12">2015-06-02T08:27:56.678Z</added>
           <modified>2016-11-19T13:02:08.968Z</modified>
           <name>Waiting</name>
           <rank>-1573330046</rank>
           <prohibits-next-action>true</prohibits-next-action>
           </context>
           </omnifocus>')
}

test_that("Filtering for projects works", {
  mock_document <- mock_mixed_document()
  
  result <- filter_projects(mock_document)
  expect_length(result, 1)
  expect_equal(xml_attr(result, 'id'), 'gg0bK99uSq5')
})

test_that("Filtering for tasks works", {
  mock_document <- mock_mixed_document()
  
  result <- filter_tasks(mock_document)
  expect_length(result, 1)
  expect_equal(xml_attr(result, 'id'), 'kWht8GKY4h8')
})

test_that("Filtering fopr context works", {
  mock_document <- mock_mixed_document()
  
  result <- filter_contexts(mock_document)
  expect_length(result, 1)
  expect_equal(xml_attr(result, 'id'), 'nIr8xE7NZof')
})
