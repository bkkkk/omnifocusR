library(tidyr)
library(dplyr)
library(xml2)
library(tibble)

test_document_with_multiple_task_to_tag_nodes <- read_xml('<?xml version="1.0" encoding="UTF-8"?>
<omnifocus app-id="com.omnigroup.OmniFocus3" app-version="120.11.0.323402" machine-model="MacBookPro14,1" os-name="Mac OS X" os-version="10.14" xmlns="http://www.omnigroup.com/namespace/OmniFocus/v2">
<task-to-tag id="XKjx-azQ6Cq.osOs7sKsHJ5">
		<added>2018-12-18T05:05:44.559Z</added>
		<task idref="XKjx-azQ6Cq"/>
		<context idref="osOs7sKsHJ5"/>
		<rank-in-task>d06b</rank-in-task>
		<rank-in-tag/>
	</task-to-tag>
	<task-to-tag id="bJ9xiUfw3-t.osOs7sKsHJ5">
		<added>2018-12-18T05:06:22.349Z</added>
		<task idref="bJ9xiUfw3-t"/>
		<context idref="osOs7sKsHJ5"/>
		<rank-in-task>28c8</rank-in-task>
		<rank-in-tag/>
	</task-to-tag>
	<task-to-tag id="kx7HP9SGmGx.nFSbMtPEGrh">
		<added order="1">2018-12-18T05:06:35.878Z</added>
		<task idref="kx7HP9SGmGx"/>
		<context idref="nFSbMtPEGrh"/>
		<rank-in-task>0001</rank-in-task>
		<rank-in-tag/>
	</task-to-tag>
</omnifocus>')