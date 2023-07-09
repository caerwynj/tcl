#!/usr/bin/tclsh

source /format.tcl
source /format.cf

# Read in the whole script argv1 into a list

set filter [open [lindex $argv 0] r]
while {![eof $filter]} {
  lappend script "[gets $filter]"
}
set st [join $script "\n"]
set html_page [looprint nextline "$st"]
puts $html_page
