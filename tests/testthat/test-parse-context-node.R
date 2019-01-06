context("test-parse-context-node")

mock_context_document <- function() {
  read_xml('<?xml version="1.0" encoding="UTF-8"?>
<omnifocus app-id="com.omnigroup.OmniFocus3" app-version="120.11.0.323402" machine-model="MacBookPro14,1" os-name="Mac OS X" os-version="10.14" xmlns="http://www.omnigroup.com/namespace/OmniFocus/v2">
	<context id="nIr8xE7NZof">
		<added order="12">2015-06-02T08:27:56.678Z</added>
		<modified>2016-11-19T13:02:08.968Z</modified>
		<name>Waiting</name>
		<rank>-1573330046</rank>
		<prohibits-next-action>true</prohibits-next-action>
	</context>
</omnifocus>')
}

test_that("Parsing a context node works", {
  mock_doc <- mock_context_document()
  ns <- xml_ns(mock_doc)
  result <- parse_context_node(xml_find_all(mock_doc, "./d1:context", ns), ns)
  
  expect_length(result, 2)
  expect_equal(result$id, 'nIr8xE7NZof')
  expect_equal(result$name, 'Waiting')
})
