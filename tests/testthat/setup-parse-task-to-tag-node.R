library(xml2)

test_document_task_to_tag <- read_xml('<?xml version="1.0" encoding="UTF-8"?>
<omnifocus app-id="com.omnigroup.OmniFocus3" app-version="120.11.0.323402" machine-model="MacBookPro14,1" os-name="Mac OS X" os-version="10.14" xmlns="http://www.omnigroup.com/namespace/OmniFocus/v2">
  <task-to-tag id="XKjx-azQ6Cq.osOs7sKsHJ5">
		<added>2018-12-18T05:05:44.559Z</added>
		<task idref="XKjx-azQ6Cq"/>
		<context idref="osOs7sKsHJ5"/>
		<rank-in-task>d06b</rank-in-task>
		<rank-in-tag/>
	</task-to-tag>
	<task-to-tag id="bzvHSorP4dg.4.osOs7sKsHJ5">
		<added order="2">2019-01-02T02:10:36.215Z</added>
		<task idref="bzvHSorP4dg.4"/>
		<context idref="osOs7sKsHJ5"/>
		<rank-in-task>0001</rank-in-task>
		<rank-in-tag/>
	</task-to-tag>
	<task-to-tag id="nFj8ry4saRv.4.osOs7sKsHJ5">
		<added order="4">2019-01-02T02:10:36.215Z</added>
		<task idref="nFj8ry4saRv.4"/>
		<context idref="osOs7sKsHJ5"/>
		<rank-in-task>0001</rank-in-task>
		<rank-in-tag/>
	</task-to-tag>
	<task-to-tag id="ax7cOu7zHq-.4.osOs7sKsHJ5">
		<added order="6">2019-01-02T02:10:36.215Z</added>
		<task idref="ax7cOu7zHq-.4"/>
		<context idref="osOs7sKsHJ5"/>
		<rank-in-task>0001</rank-in-task>
		<rank-in-tag/>
	</task-to-tag>
</omnifocus>')
