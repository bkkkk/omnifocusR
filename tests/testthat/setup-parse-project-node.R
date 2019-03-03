library(tidyr)
library(dplyr)
library(xml2)
library(tibble)

test_document_with_simple_project <- read_xml('<?xml version="1.0" encoding="UTF-8"?>
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

test_document_with_completed_due_defered_project <- read_xml('<?xml version="1.0" encoding="UTF-8"?>
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
