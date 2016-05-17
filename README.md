# omnifocusr

omnifocusr parses your OmniFocus data into a convenient data frame in tidy format ready for analysis.

omnifocusR is compatible with OmniFocus 2.

## Installation

Get the development version from github:

```R
# install.packages("devtools")
devtools::install_github("bkkkk/omnifocusR")
```

## Using omnifocusr

To use omnifocusR you first need to export your database:

1. File -> Export...
2. Make sure to select *OmniFocus document* as the File Format
3. Right-click on the newly exported ofocus package and select *Show Package Contents*
4. Unzip the file to any location
5. You will note that a single XML file called *contents.xml* was extracted
6. In R:

```R
# library("omnifocusR")
tasks <- process_of_db("PATH_TO_CONTENTS.XML_FILE")
```

This will return a data frame (wrapped as a *tbl_df*) that contains all the tasks in the ofocus file with context and project names.

## Disclaimer

This project and it's contributors are not related in any way, shape or form to the OmniGroup or any organization related to them. This package was not built, tested, sanctioned, blessed, approved by the OmniGroup, nor is it maintained by them. They probably haven't got a clue that it exists. If something breaks because you used it, it's on you. I make no claims to OmniFocus or any of the OmniGroup applications, they are awesome and you should use them.

## TODO 

* [ ] Enable processing directly onto ofocus exported package
* [ ] Improve read speeds
* [ ] Create a few sample analyses to bundle with omnifocusR
