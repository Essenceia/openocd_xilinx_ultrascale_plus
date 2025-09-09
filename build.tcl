set project_path [lindex $argv 0]
set src_path [lindex $argv 1]
set checkpoint_path [lindex $argv 2]
puts "Implementation script called with project path $project_path and src path $src_path, generating checkpoint at $checkpoint_path"

open_project $project_path 

# load src
read_verilog [glob -directory $src_path *.v]
read_xdc [glob -directory $src_path *.xdc]


# synth
synth_design -top top

# implement
opt_design
place_design
route_design
phys_opt_design

write_checkpoint $checkpoint_path -force 
close_project
exit 0
