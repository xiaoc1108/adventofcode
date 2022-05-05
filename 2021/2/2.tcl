#!/user/bin/tclsh

# Read the file
set fp [open "C:\\Xiao\\GitRepo\\adventofcode\\2021\\2\\input" r]
set fd [read $fp]
close $fp

# Clean the input
foreach row [split $fd "\n"] {
    if {$row != ""} {
        lappend indata $row
    }
}

set horizontal  0
set depth       0

foreach data $indata {
    if { [regexp {forward ([0-9]*)} $data match forward] } {
        incr horizontal $forward
        continue
    }

    if { [regexp {down ([0-9]*)} $data match down] } {
        incr depth $down
        continue
    }

    if { [regexp {up ([0-9]*)} $data match up] } {
        incr depth -$up
        continue
    }
}

puts "Horizontal position: $horizontal"
puts "Depth:               $depth"
puts "Product:             [expr $horizontal * $depth]"


set horizontal  0
set depth       0
set aim         0

foreach data $indata {
    if { [regexp {forward ([0-9]*)} $data match forward] } {
        incr horizontal $forward
        incr depth      [expr $aim * $forward]
        continue
    }

    if { [regexp {down ([0-9]*)} $data match down] } {
        incr aim   $down
        continue
    }

    if { [regexp {up ([0-9]*)} $data match up] } {
        incr aim   -$up
        continue
    }
}

puts ""
puts "Horizontal position: $horizontal"
puts "Depth:               $depth"
puts "Product:             [expr $horizontal * $depth]"


# Empty the list
set indata []