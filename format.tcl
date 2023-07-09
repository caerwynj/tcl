# Get values from DB and set to global field variables
proc nextline {} {
  global 0 1 2 3 4 5 6 7 8 9 FS NR
  set record [gets stdin]
  if {[eof stdin]} {
    return false
  } else {
    set fields [split $record $FS]
    set NR [llength $fields]
    set 0 $fields
    set i 1
    foreach field $fields {
      set $i $field
      incr i
    }
    return true
  }
}

proc looprint {cond scrpt} {
  global 0 1 2 3 4 5 6 7 8 9 ORS
  set lst ""
  while { "[$cond]" != "false"} {
    append lst [subst $scrpt]
  }
  return $lst
}
