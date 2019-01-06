context("test-parse-contexts")

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
           <context id="lzWqVt0DKfG">
           <added>2015-06-02T09:02:56.489Z</added>
           <modified>2015-12-03T18:34:53.517Z</modified>
           <name>Home</name>
           <rank>-1914233748</rank>
           <location latitude="51.9004" longitude="-8.48057" notificationFlags="1" radius="10"/>
           </context>
           </omnifocus>')
}

test_that("Parsing multiple contexts works", {
  
})
