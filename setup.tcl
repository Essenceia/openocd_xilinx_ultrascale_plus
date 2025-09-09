set project_dir [lindex $argv 0]
set project_name [lindex $argv 1]

puts "Creating project $project_name at path [pwd]/$project_dir"
create_project -part xcku3p-ffvb676-2-e -force $project_name $project_dir

close_project
exit 0
