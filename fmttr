#!/usr/bin/tclsh

# (c) Nevill Hall Hospital & District NHS Trust, I.T. Department.
# Author: Caerwyn Jones
# Last Modified: 12/08/96

#System Variables
# Field separator
set FS "|"
# Number of fields in a record
set NF ""
# The number of the current record
set NR 0
# The ouput record separator
set ORS  {"\n"}
# The ouput field separator
set OFS {" "}
# The record separator
set RS  {"\n"}
set counter 0

# Get values from database and set to global field variables
proc nextline {} {
	global 0 1 2 3 4 5 6 7 8 9 FS NR
	set record [gets stdin]
	if {[eof stdin]} {
		return 0
	} else {
	set fields [split $record $FS]
	set NR [llength $fields]
	set 0 [join $fields]
	set i 1
		foreach field $fields {
			set $i $field
			incr i
		}
		return 1
	}
}

proc looprint {cond scrpt} {
	global 0 1 2 3 4 5 6 7 8 9 ORS 
	set lst ""	
	while "[expr $cond] != 0"  {
		append lst [uplevel #0 [list subst "$scrpt"]]
	}
	return $lst
}

# Read in the whole script argv1 into a list 

set filter [open [lindex $argv 0] r]
while {![eof $filter]} {
	lappend script "[gets $filter]"
}
set st [join $script "\n"]
set html_page [looprint "[nextline] == 1" "$st"]
puts $html_page
